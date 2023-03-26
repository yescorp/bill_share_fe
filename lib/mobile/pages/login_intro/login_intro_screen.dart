import 'package:bill_share/common/base_screen.dart';
import 'package:bill_share/di/dependency_injection.dart';
import 'package:bill_share/mobile/pages/login_intro/login_intro_cubit.dart';
import 'package:bill_share/mobile/pages/login_intro/login_intro_state.dart';
import 'package:bill_share/services/navigation/api/navigation_provider.dart';
import 'package:flutter/material.dart';
import 'package:bill_share/styles/text_styles.dart';
import 'package:flutter_svg/svg.dart';

import '../../../styles/colors.dart';

class LoginIntroScreen
    extends AbstractScreen<LoginIntroState, LoginIntroCubit> {
  const LoginIntroScreen({Key? key}) : super(key: key);

  @override
  LoginIntroCubit createCubit() {
    return DependencyProvider.get<LoginIntroCubit>();
  }

  @override
  Widget buildPage(context, cubit, state) {
    final width = MediaQuery.of(context).size.width / 3;

    return Scaffold(
      backgroundColor: AppColors.background,
      body: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height / 1.5,
            decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primary,
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(12),
                  bottomRight: Radius.circular(12),
                )),
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 20.0, vertical: 40.0),
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
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(12))),
                    child: Padding(
                      padding: const EdgeInsets.all(12),
                      child: SvgPicture.asset(
                        'lib/assets/icons/logo.svg',
                        width: 200,
                        height: 200,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Center(
                  child: Text(
                    'Bill Share',
                    style: TextStyle(
                      fontSize: FontSizes.h1,
                      color: Colors.white,
                    ),
                  ),
                ),
                const Center(
                  child: Text(
                    'Keep your expences under control',
                    style: TextStyle(
                      fontSize: FontSizes.p1,
                      color: Colors.white,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                Container(
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(12))),
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    children: [
                      const Center(
                        child: Text(
                          'Welcome',
                          style: TextStyle(
                            fontSize: FontSizes.h1,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Center(
                          child: Text(
                        'Managing expenses was never easier! \nHurry! Create an account or login to organize your spendings!',
                        style: TextStyle(
                          fontSize: FontSizes.p1,
                          color: Colors.black,
                        ),
                        textAlign: TextAlign.center,
                      )),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: ElevatedButton(
                              style: const ButtonStyle(
                                shadowColor:
                                    MaterialStatePropertyAll(Colors.white),
                                textStyle: MaterialStatePropertyAll(TextStyle(
                                  color: Colors.white,
                                )),
                              ),
                              onPressed: cubit.onSigninPressed,
                              child: const Text('Login'),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: OutlinedButton(
                              style: OutlinedButton.styleFrom(
                                side: BorderSide(
                                  color: Theme.of(context).colorScheme.primary,
                                ),
                                textStyle: const TextStyle(),
                              ),
                              onPressed: cubit.onSignupPressed,
                              child: const Text('Signup'),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  static void register() {
    DependencyProvider.registerFactory<LoginIntroCubit>(() => LoginIntroCubit(
        LoginIntroState(),
        navigationProvider: DependencyProvider.get<NavigationProvider>()));

    DependencyProvider.registerFactory<LoginIntroScreen>(
        () => const LoginIntroScreen());
  }
}
