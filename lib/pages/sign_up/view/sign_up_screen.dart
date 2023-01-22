import 'package:bill_share/pages/base_screen.dart';
import 'package:bill_share/pages/sign_up/view/sign_up_cubit.dart';
import 'package:bill_share/pages/sign_up/view/sign_up_state.dart';
import 'package:bill_share/pages/sign_up/view/sign_up_widget_params.dart';
import 'package:flutter/material.dart';

class SignupScreen extends AbstractScreen<SignupScreenState, SignupCubit> {
  final SignupScreenParams params;

  const SignupScreen({
    super.key,
    required this.params,
  });

  @override
  SignupCubit createCubit() {
    return SignupCubit(SignupScreenState());
  }

  @override
  Widget buildPage(context, cubit, state) {
    final width = MediaQuery.of(context).size.width / 3;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: cubit.onBackButtonPressed,
        ),
        title: Text(params.data),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextButton(
              onPressed: cubit.onSigninPressed,
              child: const Text(
                'Sign in',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
        child: ListView(
          children: [
            const SizedBox(
              height: 80,
            ),
            Center(
              child: Container(
                width: width,
                height: width,
                decoration: const BoxDecoration(
                  color: Colors.grey,
                ),
              ),
            ),
            TextField(
              controller: cubit.emailController,
            ),
            const SizedBox(
              height: 10,
            ),
            TextField(
              controller: cubit.usernameController,
            ),
            const SizedBox(
              height: 10,
            ),
            TextField(
              controller: cubit.passwordController,
            ),
            const SizedBox(
              height: 10,
            ),
            TextField(
              controller: cubit.confirmPasswordController,
              obscureText: true,
              obscuringCharacter: '*',
            ),
            const SizedBox(height: 10),
            OutlinedButton(
              onPressed: cubit.onSubmit,
              child: const Text('Sign Up'),
            ),
            const SizedBox(height: 40),
            OutlinedButton(
              onPressed: cubit.onSignupWithGooglePressed,
              child: const Text('Sign Up with Google'),
            ),
          ],
        ),
      ),
    );
  }
}
