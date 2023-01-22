import 'package:bill_share/mobile/pages/sign_in/view/sign_in_screen.dart';
import 'package:bill_share/mobile/pages/sign_up/view/sign_up_state.dart';
import 'package:bill_share/services/navigation/api/navigation_provider.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

class SignupCubit extends BlocBase<SignupScreenState> {
  final NavigationProvider navigationProvider;
  SignupCubit(
    super.state, {
    required this.navigationProvider,
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

  void onSubmit() {}

  void onSignupWithGooglePressed() {}
}
