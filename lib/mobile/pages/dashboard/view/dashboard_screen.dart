import 'package:bill_share/di/dependency_injection.dart';
import 'package:bill_share/common/base_screen.dart';
import 'package:bill_share/mobile/components/categories_chart.dart';
import 'package:bill_share/mobile/components/spendings_card.dart';
import 'package:bill_share/mobile/components/wavy_container/wavy_container.dart';
import 'package:bill_share/mobile/pages/dashboard/view/dashboard_cubit.dart';
import 'package:bill_share/mobile/pages/dashboard/view/dashboard_state.dart';
import 'package:bill_share/services/navigation/api/navigation_provider.dart';
import 'package:bill_share/styles/text_styles.dart';
import 'package:flutter/material.dart';

import '../../../../styles/colors.dart';

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
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: Text('Dashboard'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SpendingsCard(
                details: state.spendingsDetails,
              ),
              const SizedBox(height: 20),
              CategoriesChart(
                details: state.spendingsDetails!,
                width: MediaQuery.of(context).size.width / 2.2,
              ),
              const SizedBox(height: 20),
              const Text(
                'Categories',
                textAlign: TextAlign.start,
                style: TextStyle(
                  fontSize: FontSizes.h2,
                ),
              ),
              ...state.spendingsDetails!.spendingCategories.keys.map<Widget>(
                (category) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 3.0),
                    child: Container(
                      decoration: const BoxDecoration(
                        color: AppColors.white,
                      ),
                      child: ListTile(
                        leading: Icon(
                          Icons.circle,
                          color: category.color,
                          size: 40,
                        ),
                        title: Text(
                          category.name,
                          style: const TextStyle(
                            fontSize: FontSizes.h3,
                          ),
                        ),
                        subtitle: Text(
                          '${state.spendingsDetails!.spendingCategories[category]} T',
                          style: const TextStyle(
                            fontSize: FontSizes.h3,
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
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
