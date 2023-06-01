import 'package:bill_share/di/dependency_injection.dart';
import 'package:bill_share/mobile/pages/login_intro/login_intro_cubit.dart';
import 'package:bill_share/mobile/pages/login_intro/login_intro_screen.dart';
import 'package:bill_share/mobile/pages/settings/view/settings_state.dart';
import 'package:bill_share/services/navigation/api/navigation_provider.dart';
import 'package:bill_share/swagger_generated_code/authenticator.dart';
import 'package:bill_share/swagger_generated_code/bill_share.swagger.dart';
import 'package:bloc/bloc.dart';
import 'package:chopper/chopper.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsCubit extends BlocBase<SettingsState> {
  final NavigationProvider navigationProvider;

  final monthlyLimitController = TextEditingController();

  SettingsCubit(
    super.state, {
    required this.navigationProvider,
  });

  void initialize() {
    final user = kGetCurrentUser();
    if (user == null) {
      navigationProvider.pop();
    }

    emit(
      state.copyWith(info: user),
    );

    SharedPreferences.getInstance().then((value) {
      final monthlyLimit = value.getInt(
        DependencyProvider.monthlyLimitKey,
      );

      monthlyLimitController.text = monthlyLimit?.toString() ?? '0';

      emit(
        state.copyWith(
          monthlyLimit: monthlyLimit ?? 0,
        ),
      );
    }).onError((error, stackTrace) {
      int a = 0;
    });
  }

  Future<void> setMonthlyLimit() async {
    final sp = await SharedPreferences.getInstance();
    final isSet = await sp.setInt(
      DependencyProvider.monthlyLimitKey,
      int.tryParse(monthlyLimitController.text) ?? 100000,
    );
    if (isSet) {}
  }

  void onLocaleChanged(String? value) {}

  Future<void> onQuit() async {
    DependencyProvider.get<BillShareAuthenticator>().setCredentials(
      AuthenticationToken(
        accessToken: '',
        refreshToken: '',
      ),
    );
    await navigationProvider.replaceAll<LoginIntroScreen>();
  }
}
