import 'package:bill_share/di/dependency_injection.dart';
import 'package:bill_share/common/base_screen.dart';
import 'package:bill_share/mobile/pages/sign_in/view/sign_in_cubit.dart';
import 'package:bill_share/mobile/pages/sign_in/view/sign_in_state.dart';
import 'package:bill_share/services/navigation/api/navigation_provider.dart';
import 'package:bill_share/styles/text_styles.dart';
import 'package:bill_share/swagger_generated_code/bill_share.swagger.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../../styles/colors.dart';

class SigninScreen extends AbstractScreen<SigninScreenState, SigninCubit> {
  const SigninScreen({super.key});

  @override
  SigninCubit createCubit() {
    return DependencyProvider.get<SigninCubit>();
  }

  @override
  Widget buildPage(context, cubit, state) {
    final width = MediaQuery.of(context).size.width / 3;
    final l = AppLocalizations.of(context);

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
              onPressed: cubit.onSignupPressed,
              child: Text(
                l.signIn_1,
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
                children: [
                  Text(
                    l.signIn_2,
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
                children: [
                  Text(
                    l.signIn_3,
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
                        controller: cubit.usernameController,
                        decoration: InputDecoration(
                          labelText: l.signIn_4,
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
                        decoration: InputDecoration(
                          labelText: l.signIn_5,
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
                        onPressed: () async {
                          final entry = OverlayEntry(
                            builder: (context) => const Center(
                              child: CircularProgressIndicator(),
                            ),
                          );
                          Overlay.of(context).insert(entry);
                          await cubit.onSubmit();
                          entry.remove();
                        },
                        child: Text(l.signIn_6),
                      ),
                      TextButton(
                        onPressed: cubit.onForgotPassword,
                        child: Text(l.signIn_7),
                      ),
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
    DependencyProvider.registerFactory<SigninScreen>(
        () => const SigninScreen());
    DependencyProvider.registerFactory<SigninCubit>(
      () => SigninCubit(
        SigninScreenState(),
        navigationProvider: DependencyProvider.get<NavigationProvider>(),
        client: DependencyProvider.get<BillShare>(),
      ),
    );
  }
}
