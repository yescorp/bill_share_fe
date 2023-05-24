import 'package:bill_share/di/dependency_injection.dart';
import 'package:bill_share/common/base_screen.dart';
import 'package:bill_share/styles/text_styles.dart';
import 'package:bill_share/web/pages/login/view/login_cubit.dart';
import 'package:bill_share/web/pages/login/view/login_state.dart';
import 'package:bill_share/services/navigation/api/navigation_provider.dart';
import 'package:flutter/material.dart';

import '../../../../styles/colors.dart';
import '../../../../swagger_generated_code/bill_share.swagger.dart';

class LoginScreen extends AbstractScreen<LoginState, LoginCubit> {
  const LoginScreen({super.key});

  @override
  LoginCubit createCubit() {
    return DependencyProvider.get<LoginCubit>();
  }

  @override
  Widget buildPage(context, cubit, state) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Column(
        children: [
          Expanded(
            child: Center(
              child: Container(
                width: 500,
                child: ListView(
                  shrinkWrap: true,
                  children: [
                    const Text(
                      'Login',
                      style: TextStyle(
                        fontSize: FontSizes.h1,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 20),
                    TextField(
                      controller: cubit.usernameController,
                      decoration: const InputDecoration(
                        labelText: 'Username',
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: AppColors.borderColor),
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
                          borderSide: BorderSide(color: AppColors.borderColor),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: AppColors.focusedBorderColor),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: cubit.onSubmit,
                      child: const Text('Submit'),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  static void register() {
    DependencyProvider.registerFactory<LoginScreen>(() => const LoginScreen());
    DependencyProvider.registerFactory<LoginCubit>(
      () => LoginCubit(
        LoginState(),
        navigationProvider: DependencyProvider.get<NavigationProvider>(),
        client: DependencyProvider.get<BillShare>(),
      ),
    );
  }
}
