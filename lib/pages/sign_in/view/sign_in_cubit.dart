import 'package:bill_share/di/dependency_injection.dart';
import 'package:bill_share/pages/sign_in/view/sign_in_state.dart';
import 'package:bill_share/pages/sign_up/view/sign_up_screen.dart';
import 'package:bill_share/pages/sign_up/view/sign_up_widget_params.dart';
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

  void onBackButtonPressed() {}

  void onSignupPressed() {
    navigateTo<SignupScreen>(const SignupWidgetParams('some data...'));
  }

  void navigateTo<T extends Widget>(AbstractWidgetParams params) {
    final context = DependencyProvider.get<BuildContext>();
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) =>
            DependencyProvider.container.get<T>(param1: params),
      ),
    );
  }
}
