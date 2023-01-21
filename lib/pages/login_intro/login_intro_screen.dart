import 'package:bill_share/abstract/base_screen.dart';
import 'package:bill_share/pages/login_intro/login_intro_cubit.dart';
import 'package:bill_share/pages/login_intro/login_intro_state.dart';
import 'package:flutter/material.dart';
import 'package:bill_share/styles/text_styles.dart';

class LoginIntroScreen
    extends AbstractScreen<LoginIntroState, LoginIntroCubit> {
  const LoginIntroScreen({Key? key}) : super(key: key);

  @override
  Widget buildPage(context, cubit, state) {
    final width = MediaQuery.of(context).size.width / 3;

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 40.0),
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
            const SizedBox(
              height: 10,
            ),
            const Center(
              child: Text(
                'Bill Share',
                style: TextStyles.h1,
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            const Center(
              child: Text(
                'Welcome',
                style: TextStyles.h2,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const Center(
                child: Text(
              'Managing expenses was never easier! \nHurry! Create an account to organize your spendings!',
              style: TextStyles.p1,
              textAlign: TextAlign.center,
            )),
            const SizedBox(
              height: 10,
            ),
            OutlinedButton(
              onPressed: cubit.onSigninPressed,
              child: const Text('Login'),
            ),
            const SizedBox(
              height: 10,
            ),
            OutlinedButton(
              onPressed: cubit.onSignupPressed,
              child: const Text('Signup'),
            ),
          ],
        ),
      ),
    );
  }

  @override
  LoginIntroCubit createCubit() {
    return LoginIntroCubit(LoginIntroState());
  }
}
