import 'package:bill_share/di/dependency_injection.dart';
import 'package:bill_share/common/base_screen.dart';
import 'package:bill_share/styles/text_styles.dart';
import 'package:bill_share/web/pages/login/view/login_cubit.dart';
import 'package:bill_share/web/pages/login/view/login_state.dart';
import 'package:bill_share/services/navigation/api/navigation_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../styles/colors.dart';
import '../../../../swagger_generated_code/bill_share.swagger.dart';

class LoginScreen extends AbstractScreen<LoginState, LoginCubit> {
  const LoginScreen({super.key});

  @override
  LoginCubit createCubit() {
    return DependencyProvider.get<LoginCubit>();
  }

  @override
  void initCubit(LoginCubit cubit, BuildContext context) {
    cubit.initialize(context);
    super.initCubit(cubit, context);
  }

  @override
  Widget buildPage(context, cubit, state) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width / 3.2,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  children: [
                    const SizedBox(height: 90),
                    Container(
                      width: 150,
                      height: 150,
                      decoration: const BoxDecoration(
                          color: Colors.transparent,
                          borderRadius: BorderRadius.all(Radius.circular(12))),
                      child: Padding(
                        padding: const EdgeInsets.all(12),
                        child: SvgPicture.asset(
                          'lib/assets/icons/logo.svg',
                          width: 150,
                          height: 150,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(width: 40),
                Expanded(
                  child: Center(
                    child: Container(
                      width: 500,
                      child: ListView(
                        shrinkWrap: true,
                        children: [
                          const SizedBox(height: 40),
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
                                borderSide:
                                    BorderSide(color: AppColors.borderColor),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: AppColors.focusedBorderColor),
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
                                borderSide: BorderSide(
                                    color: AppColors.focusedBorderColor),
                              ),
                            ),
                          ),
                          const SizedBox(height: 20),
                          ElevatedButton(
                            onPressed: cubit.onSubmit,
                            child: const Text(
                              'Submit',
                              style: TextStyle(
                                fontSize: FontSizes.p1,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
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
