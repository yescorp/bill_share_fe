import 'package:bill_share/mobile/pages/friends_list/view/friends_list_screen.dart';
import 'package:bill_share/mobile/pages/sign_in/view/sign_in_state.dart';
import 'package:bill_share/mobile/pages/sign_up/view/sign_up_screen.dart';
import 'package:bill_share/services/navigation/api/navigation_provider.dart';
import 'package:bill_share/swagger_generated_code/authenticator.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

import '../../../../di/dependency_injection.dart';
import '../../../../models/user/user_info.dart';
import '../../../../swagger_generated_code/bill_share.swagger.dart';
import '../../dashboard/view/dashboard_screen.dart';

class SigninCubit extends BlocBase<SigninScreenState> {
  final NavigationProvider navigationProvider;
  final BillShare client;

  SigninCubit(
    super.state, {
    required this.navigationProvider,
    required this.client,
  });

  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  onSubmit() async {
    final result = await client.authenticationLoginPost(
      body: SignInUserCredentials(
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

      await navigationProvider.replaceAll<FriendsListScreen>();
    }
  }

  onForgotPassword() {}

  onSigninWithGooglePressed() {}

  void onBackButtonPressed() {
    navigationProvider.pop();
  }

  void onSignupPressed() {
    navigationProvider.replaceCurrent<SignupScreen>();
  }

  @override
  Future<void> close() async {
    usernameController.dispose();
    passwordController.dispose();

    super.close();
  }
}
