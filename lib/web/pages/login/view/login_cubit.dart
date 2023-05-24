import 'package:bill_share/web/pages/admin_dashboard/view/admin_dashboard_screen.dart';
import 'package:bill_share/web/pages/login/view/login_state.dart';
import 'package:bill_share/services/navigation/api/navigation_provider.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

import '../../../../di/dependency_injection.dart';
import '../../../../models/user/user_info.dart';
import '../../../../swagger_generated_code/authenticator.dart';
import '../../../../swagger_generated_code/bill_share.swagger.dart';

class LoginCubit extends BlocBase<LoginState> {
  final NavigationProvider navigationProvider;
  final BillShare client;
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  LoginCubit(
    super.state, {
    required this.navigationProvider,
    required this.client,
  });

  Future onSubmit() async {
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

      await navigationProvider.replaceAll<AdminDashboardScreen>();
    }
  }
}
