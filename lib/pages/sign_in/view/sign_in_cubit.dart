import 'package:bill_share/pages/sign_in/view/sign_in_state.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

class SigninCubit extends BlocBase<SigninScreenState> {
  SigninCubit(super.state);

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  onSubmit() {
    print(emailController.value.text);
    print(passwordController.value.text);
  }

  onForgotPassword() {}

  onSigninWithGooglePressed() {}

  @override
  Future<void> close() async {
    emailController.dispose();
    passwordController.dispose();

    super.close();
  }
}
