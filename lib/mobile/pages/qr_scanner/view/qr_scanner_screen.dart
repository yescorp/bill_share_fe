import 'package:bill_share/di/dependency_injection.dart';
import 'package:bill_share/common/base_screen.dart';
import 'package:bill_share/mobile/pages/qr_scanner/view/qr_scanner_cubit.dart';
import 'package:bill_share/mobile/pages/qr_scanner/view/qr_scanner_state.dart';
import 'package:bill_share/services/navigation/api/navigation_provider.dart';
import 'package:bill_share/styles/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

import 'dart:math' as math;

import '../../../../styles/colors.dart';

class QrScannerScreen extends AbstractScreen<QrScannerState, QrScannerCubit> {
  const QrScannerScreen({super.key});

  @override
  QrScannerCubit createCubit() {
    return DependencyProvider.get<QrScannerCubit>();
  }

  @override
  Widget buildPage(context, cubit, state) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: cubit.onBackButtonPressed,
        ),
        title: const Text('BillShare'),
      ),
      body: MobileScanner(
        controller: MobileScannerController(
          detectionSpeed: DetectionSpeed.noDuplicates,
        ),
        onDetect: (BarcodeCapture barcodes) {},
      ),
      bottomSheet: Container(
        padding: const EdgeInsets.all(20),
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Choose mode',
                    style: TextStyle(
                      fontSize: FontSizes.h3,
                    ),
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Expanded(
                        child: ElevatedButton.icon(
                          icon: Transform.rotate(
                              angle: math.pi / 2,
                              child: Icon(Icons.format_align_center)),
                          onPressed: cubit.onModeChange,
                          label: Text('Scan text'),
                        ),
                      ),
                      const SizedBox(width: 30),
                      Expanded(
                        child: ElevatedButton.icon(
                          icon: Icon(Icons.table_rows_outlined),
                          onPressed: cubit.onModeChange,
                          label: Text('Fill manually'),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  const Divider(
                    color: AppColors.grey1,
                  ),
                  Row(
                    children: [
                      const Expanded(child: Text('Turn on flash')),
                      Switch(
                        value: false,
                        onChanged: (value) => cubit.onFlashToggle(value),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  static void register() {
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
