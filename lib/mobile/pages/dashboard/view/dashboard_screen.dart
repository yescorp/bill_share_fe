import 'package:bill_share/di/dependency_injection.dart';
import 'package:bill_share/common/base_screen.dart';
import 'package:bill_share/mobile/components/spendings_card.dart';
import 'package:bill_share/mobile/pages/dashboard/view/dashboard_cubit.dart';
import 'package:bill_share/mobile/pages/dashboard/view/dashboard_state.dart';
import 'package:bill_share/models/spendings/spendings_details.dart';
import 'package:bill_share/services/navigation/api/navigation_provider.dart';
import 'package:flutter/material.dart';

class DashboardScreen extends AbstractScreen<DashboardState, DashboardCubit> {
  const DashboardScreen({super.key});

  @override
  DashboardCubit createCubit() {
    return DependencyProvider.get<DashboardCubit>();
  }

  @override
  void initCubit(DashboardCubit cubit) {
    cubit.initialize();
    super.initCubit(cubit);
  }

  @override
  Widget buildPage(context, cubit, state) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ListView(
          children: [
            SpendingsCard(
              details: state.spendingsDetails,
            ),
          ],
        ),
      ),
    );
  }

  static void register() {
    DependencyProvider.registerFactory<DashboardScreen>(
        () => const DashboardScreen());
    DependencyProvider.registerFactory<DashboardCubit>(
      () => DashboardCubit(
        DashboardState(),
        navigationProvider: DependencyProvider.get<NavigationProvider>(),
      ),
    );
  }
}
