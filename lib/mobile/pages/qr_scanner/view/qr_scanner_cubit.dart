import 'package:bill_share/mobile/pages/qr_scanner/view/qr_scanner_state.dart';
import 'package:bill_share/services/navigation/api/navigation_provider.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

class QrScannerCubit extends BlocBase<QrScannerState> {
  final NavigationProvider navigationProvider;

  QrScannerCubit(
    super.state, {
    required this.navigationProvider,
  });

  void onBackButtonPressed() {
  }

  void onModeChange() {
  }

  onFlashToggle(bool value) {}
}
