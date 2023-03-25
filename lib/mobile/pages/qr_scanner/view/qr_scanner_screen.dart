import 'package:bill_share/di/dependency_injection.dart';
import 'package:bill_share/common/base_screen.dart';
import 'package:bill_share/mobile/pages/qr_scanner/view/qr_scanner_cubit.dart';
import 'package:bill_share/mobile/pages/qr_scanner/view/qr_scanner_state.dart';
import 'package:bill_share/services/navigation/api/navigation_provider.dart';
import 'package:flutter/material.dart';

class QrScannerScreen extends AbstractScreen<QrScannerState, QrScannerCubit> {
  const QrScannerScreen({super.key});

  @override
  QrScannerCubit createCubit() {
    return DependencyProvider.get<QrScannerCubit>();
  }

  @override
  Widget buildPage(context, cubit, state) {
    return Container();
  }

  static void register(){
    DependencyProvider.registerFactory<QrScannerScreen>(
        () => const QrScannerScreen());
    DependencyProvider.registerFactory<QrScannerCubit>(
      () => QrScannerCubit(
        QrScannerState(),
        navigationProvider: DependencyProvider.get<NavigationProvider>(),
      ),
    );
  }
}
