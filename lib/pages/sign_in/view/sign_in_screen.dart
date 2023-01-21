import 'package:bill_share/abstract/base_screen.dart';
import 'package:bill_share/pages/sign_in/view/sign_in_cubit.dart';
import 'package:bill_share/pages/sign_in/view/sign_in_state.dart';
import 'package:flutter/material.dart';

class SigninScreen extends AbstractScreen<SigninScreenState, SigninCubit> {
  const SigninScreen({super.key});

  @override
  SigninCubit createCubit() {
    return SigninCubit(SigninScreenState());
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
        title: const Text(''),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextButton(
              onPressed: cubit.onSignupPressed,
              child: const Text(
                'Sign up',
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
            const SizedBox(),
            TextField(
              controller: cubit.passwordController,
              obscureText: true,
              obscuringCharacter: '*',
            ),
            const SizedBox(height: 10),
            OutlinedButton(
              onPressed: cubit.onSubmit,
              child: const Text('Sign In'),
            ),
            const SizedBox(height: 20),
            TextButton(
              onPressed: cubit.onForgotPassword,
              child: const Text('Forgot password?'),
            ),
            const SizedBox(height: 40),
            OutlinedButton(
              onPressed: cubit.onSigninWithGooglePressed,
              child: const Text('Sign in with Google'),
            ),
          ],
        ),
      ),
    );
  }
}
