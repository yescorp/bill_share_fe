import 'package:flutter/material.dart';

import '../../styles/text_styles.dart';

class LoginIntroScreen extends StatelessWidget {
  const LoginIntroScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
            const SizedBox(height: 10,),
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
              onPressed: () {},
              child: const Text('Login'),
            ),
            const SizedBox(
              height: 10,
            ),
            OutlinedButton(
              onPressed: () {},
              child: const Text('Signup'),
            ),
          ],
        ),
      ),
    );
  }
}
