import 'package:bill_share/di/dependency_injection.dart';
import 'package:bill_share/common/base_screen.dart';
import 'package:bill_share/mobile/components/acronym_avatar.dart';
import 'package:bill_share/mobile/main.dart';
import 'package:bill_share/mobile/pages/settings/view/settings_cubit.dart';
import 'package:bill_share/mobile/pages/settings/view/settings_state.dart';
import 'package:bill_share/services/navigation/api/navigation_provider.dart';
import 'package:bill_share/styles/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../../styles/colors.dart';

class SettingsScreen extends AbstractScreen<SettingsState, SettingsCubit> {
  const SettingsScreen({super.key});

  @override
  SettingsCubit createCubit() {
    return DependencyProvider.get<SettingsCubit>();
  }

  @override
  void initCubit(SettingsCubit cubit, BuildContext context) {
    cubit.initialize();
    super.initCubit(cubit, context);
  }

  @override
  Widget buildPage(context, cubit, state) {
    final l = AppLocalizations.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          l.settings_4,
        ),
      ),
      body: state.info == null
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : Padding(
              padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
              child: ListView(
                children: [
                  Row(
                    children: [
                      AcronymAvatar(
                        name: state.info!.userName,
                        userId: state.info!.userId,
                        heightWidth: 80,
                        style: const TextStyle(
                          fontSize: FontSizes.h3,
                          color: AppColors.white,
                        ),
                      ),
                      const SizedBox(width: 20),
                      Text(
                        state.info!.userName,
                        style: const TextStyle(
                          fontSize: FontSizes.h2,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Text(
                    l.settings_1,
                    style: TextStyle(
                      fontSize: FontSizes.h2,
                    ),
                  ),
                  const SizedBox(height: 10),
                  TextField(
                    controller: cubit.monthlyLimitController,
                    decoration: InputDecoration(
                      labelText: l.settings_2,
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: AppColors.borderColor),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: AppColors.focusedBorderColor),
                      ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: cubit.setMonthlyLimit,
                    child: Text(
                      l.settings_3,
                    ),
                  ),
                  const SizedBox(height: 30),
                  DropdownButton<String>(
                    hint: Text(l.crp_3),
                    value: AppLocalizations.of(context).localeName,
                    isExpanded: true,
                    items: [
                      DropdownMenuItem<String>(
                        value: 'ru',
                        child: Text('Русский'),
                      ),
                      DropdownMenuItem<String>(
                        value: 'en',
                        child: Text('English'),
                      ),
                    ],
                    onChanged: (String? value) async {
                      if (value == null) {
                        return;
                      }
                      
                      MyApp.of(context)?.setLocale(Locale(value));
                    },
                  ),
                ],
              ),
            ),
    );
  }

  static void register() {
    DependencyProvider.registerFactory<SettingsScreen>(
        () => const SettingsScreen());
    DependencyProvider.registerFactory<SettingsCubit>(
      () => SettingsCubit(
        SettingsState(),
        navigationProvider: DependencyProvider.get<NavigationProvider>(),
      ),
    );
  }
}
