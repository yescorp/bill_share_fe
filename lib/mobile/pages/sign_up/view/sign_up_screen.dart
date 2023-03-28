import 'package:bill_share/di/dependency_injection.dart';
import 'package:bill_share/common/base_screen.dart';
import 'package:bill_share/mobile/pages/sign_up/view/sign_up_cubit.dart';
import 'package:bill_share/mobile/pages/sign_up/view/sign_up_state.dart';
import 'package:bill_share/services/navigation/api/navigation_provider.dart';
import 'package:flutter/material.dart';

import '../../../../styles/colors.dart';
import '../../../../styles/text_styles.dart';
import '../../../../swagger_generated_code/bill_share.swagger.dart';

class SignupScreen extends AbstractScreen<SignupScreenState, SignupCubit> {
  const SignupScreen({super.key});

  @override
  SignupCubit createCubit() {
    return DependencyProvider.get<SignupCubit>();
  }

  @override
  Widget buildPage(context, cubit, state) {
    final width = MediaQuery.of(context).size.width / 3;

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: cubit.onBackButtonPressed,
        ),
        elevation: 0,
        title: const Text(''),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextButton(
              onPressed: cubit.onSigninPressed,
              child: const Text(
                'Sign in',
                style: TextStyle(color: Colors.white, fontSize: FontSizes.p1),
              ),
            ),
          ),
        ],
      ),
      body: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primary,
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(12),
                  bottomRight: Radius.circular(12),
                )),
          ),
          ListView(
            shrinkWrap: true,
            children: [
              const SizedBox(height: 50),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text(
                    'Sign Up',
                    style: TextStyle(
                      fontSize: FontSizes.h1,
                      color: Colors.white,
                    ),
                  )
                ],
              ),
              const SizedBox(height: 20),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text(
                    'Please enter the necessary information\nto create an account.',
                    style: TextStyle(
                      fontSize: FontSizes.p1,
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.fade,
                    softWrap: true,
                  )
                ],
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(
                      Radius.circular(12),
                    ),
                  ),
                  child: ListView(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    children: [
                      const SizedBox(
                        height: 40,
                      ),
                      TextField(
                        controller: cubit.emailController,
                        decoration: const InputDecoration(
                          labelText: 'Email',
                          enabledBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: AppColors.borderColor),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: AppColors.focusedBorderColor),
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      TextField(
                        controller: cubit.usernameController,
                        decoration: const InputDecoration(
                          labelText: 'Username',
                          enabledBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: AppColors.borderColor),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: AppColors.focusedBorderColor),
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      TextField(
                        controller: cubit.passwordController,
                        obscureText: true,
                        decoration: const InputDecoration(
                          labelText: 'Password',
                          enabledBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: AppColors.borderColor),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: AppColors.focusedBorderColor),
                          ),
                        ),
                        obscuringCharacter: '*',
                      ),
                      const SizedBox(height: 10),
                      TextField(
                        controller: cubit.confirmPasswordController,
                        obscureText: true,
                        decoration: const InputDecoration(
                          labelText: 'Re-enter password',
                          enabledBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: AppColors.borderColor),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: AppColors.focusedBorderColor),
                          ),
                        ),
                        obscuringCharacter: '*',
                      ),
                      const SizedBox(height: 10),
                      ElevatedButton(
                        style: const ButtonStyle(
                          shadowColor: MaterialStatePropertyAll(Colors.white),
                          textStyle: MaterialStatePropertyAll(TextStyle(
                            color: Colors.white,
                          )),
                        ),
                        onPressed: cubit.onSubmit,
                        child: const Text('Sign Up'),
                      ),
                      const SizedBox(height: 40),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  static void register() {
    DependencyProvider.registerFactory<SignupScreen>(
        () => const SignupScreen());
    DependencyProvider.registerFactory<SignupCubit>(
      () => SignupCubit(
        SignupScreenState(),
        navigationProvider: DependencyProvider.get<NavigationProvider>(),
        client: DependencyProvider.get<BillShare>(),
      ),
    );
  }
}
