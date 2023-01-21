import 'package:bill_share/di/dependency_injection.dart';
import 'package:bill_share/pages/sign_in/view/sign_in_screen.dart';
import 'package:bill_share/pages/sign_up/view/sign_up_state.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

class SignupCubit extends BlocBase<SignupScreenState> {
  SignupCubit(super.state);

  final TextEditingController emailController = TextEditingController();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  void onBackButtonPressed() {}

  void onSigninPressed() {
    final context = DependencyProvider.get<BuildContext>();
    Navigator.of(context)
        .push(MaterialPageRoute(builder: ((context) => const SigninScreen())));
  }

  void onSubmit() {}

  void onSignupWithGooglePressed() {}
}
