import 'package:bill_share/di/dependency_injection.dart';
import 'package:bill_share/mobile/pages/dashboard/view/dashboard_screen.dart';
import 'package:bill_share/mobile/pages/friends_list/view/friends_list_screen.dart';
import 'package:bill_share/mobile/pages/home/view/Home_screen.dart';
import 'package:bill_share/mobile/pages/sign_in/view/sign_in_screen.dart';
import 'package:bill_share/mobile/pages/sign_up/view/sign_up_state.dart';
import 'package:bill_share/models/user/user_info.dart';
import 'package:bill_share/services/accessors/current_user_accessor.dart';
import 'package:bill_share/services/mock_categories/mock_categories.dart';
import 'package:bill_share/services/navigation/api/navigation_provider.dart';
import 'package:bill_share/swagger_generated_code/bill_share.swagger.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

import '../../../../swagger_generated_code/authenticator.dart';

class SignupCubit extends BlocBase<SignupScreenState> {
  final NavigationProvider navigationProvider;
  final BillShare client;
  final MockCategories categoriesManager;

  SignupCubit(
    super.state, {
    required this.navigationProvider,
    required this.client,
    required this.categoriesManager,
  });

  final TextEditingController emailController = TextEditingController();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  void onBackButtonPressed() {
    navigationProvider.pop();
  }

  void onSigninPressed() {
    navigationProvider.replaceCurrent<SigninScreen>();
  }

  Future onSubmit() async {
    final result = await client.authenticationRegisterPost(
      body: SignUpUserCredentials(
        email: emailController.text,
        username: usernameController.text,
        password: passwordController.text,
      ),
    );

    if (result.isSuccessful) {
      DependencyProvider.get<BillShareAuthenticator>()
          .setCredentials(result.body!);
      final userInfo = await client.usersMeGet();
      kSetCurrentUser(
        UserInfo(
          userId: userInfo.body!.id!,
          userName: userInfo.body!.name!,
          avatarUrl: userInfo.body!.avatarUrl,
        ),
      );

      await categoriesManager.createMockCategoriesIfAbsent();

      final categories = await client.expenseCategoriesGet();

      await navigationProvider.replaceAll<HomeScreen>();
    }
  }

  void onSignupWithGooglePressed() {}
}
