import 'package:bill_share/mobile/pages/sign_in/view/sign_in_screen.dart';
import 'package:bill_share/mobile/pages/sign_up/view/sign_up_state.dart';
import 'package:bill_share/services/navigation/api/navigation_provider.dart';
import 'package:bill_share/swagger_generated_code/bill_share.swagger.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

class SignupCubit extends BlocBase<SignupScreenState> {
  final NavigationProvider navigationProvider;
  final BillShare client;
  SignupCubit(
    super.state, {
    required this.navigationProvider,
    required this.client,
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

  void onSubmit() async {
    final result = await client.authenticationRegisterPost(
      body: SignUpUserCredentials(
        email: emailController.text,
        username: usernameController.text,
        password: passwordController.text,
      ),
    );
    print(result.statusCode);
  }

  void onSignupWithGooglePressed() {}
}
