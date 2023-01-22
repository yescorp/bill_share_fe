import 'package:bill_share/mobile/pages/sign_in/view/sign_in_state.dart';
import 'package:bill_share/mobile/pages/sign_up/view/sign_up_screen.dart';
import 'package:bill_share/services/navigation/api/navigation_provider.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

class SigninCubit extends BlocBase<SigninScreenState> {
  final NavigationProvider navigationProvider;
  SigninCubit(
    super.state, {
    required this.navigationProvider,
  });

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  onSubmit() {
    print(emailController.value.text);
    print(passwordController.value.text);
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
    emailController.dispose();
    passwordController.dispose();

    super.close();
  }
}
