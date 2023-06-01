import 'package:bill_share/di/dependency_injection.dart';
import 'package:bill_share/common/base_screen.dart';
import 'package:bill_share/styles/text_styles.dart';
import 'package:bill_share/swagger_generated_code/bill_share.swagger.dart';
import 'package:bill_share/web/pages/admin_user_details/view/admin_user_details_cubit.dart';
import 'package:bill_share/web/pages/admin_user_details/view/admin_user_details_state.dart';
import 'package:bill_share/web/pages/admin_user_details/view/admin_user_details_screen_params.dart';
import 'package:bill_share/services/navigation/api/navigation_provider.dart';
import 'package:flutter/material.dart';

import '../../../../mobile/components/categories_chart.dart';
import '../../../../styles/colors.dart';

class AdminUserDetailsScreen
    extends AbstractScreen<AdminUserDetailsState, AdminUserDetailsCubit> {
  final AdminUserDetailsParams params;

  const AdminUserDetailsScreen({
    super.key,
    required this.params,
  });

  @override
  AdminUserDetailsCubit createCubit() {
    return DependencyProvider.get<AdminUserDetailsCubit>();
  }

  @override
  void initCubit(AdminUserDetailsCubit cubit, BuildContext context) {
    cubit.initialize(params);
    super.initCubit(cubit, context);
  }

  @override
  Widget buildPage(context, cubit, state) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'User details',
          style: TextStyle(
            fontSize: FontSizes.h1,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: ListView(
          children: [
            if (state.spendings != null &&
                state.spendings!.totalSpendings > 0) ...[
              CategoriesChart(
                key: UniqueKey(),
                details: state.spendings?.spendingCategories,
                width: MediaQuery.of(context).size.width / 4,
              ),
              const SizedBox(height: 5),
              const Text(
                'Categories',
                textAlign: TextAlign.start,
                style: TextStyle(
                  fontSize: FontSizes.h2,
                ),
              ),
              const SizedBox(height: 5),
              Container(
                clipBehavior: Clip.hardEdge,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(20),
                  ),
                ),
                child: Column(
                  children: [
                    ...state.spendings!.spendingCategories.keys.map<Widget>(
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
                                '${state.spendings!.spendingCategories[category]} T',
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
              )
            ] else if (state.spendings == null) ...[
              const Center(
                child: CircularProgressIndicator(),
              ),
            ] else ...[
              const Center(
                child: Text('There is no information yet...'),
              )
            ]
          ],
        ),
      ),
    );
  }

  static void register() {
    DependencyProvider.container.registerFactoryParam<
        AdminUserDetailsScreen,
        AdminUserDetailsParams,
        void>((param1, param2) => AdminUserDetailsScreen(params: param1));
    DependencyProvider.registerFactory<AdminUserDetailsCubit>(
      () => AdminUserDetailsCubit(
        AdminUserDetailsState(),
        navigationProvider: DependencyProvider.get<NavigationProvider>(),
        client: DependencyProvider.get<BillShare>(),
      ),
    );
  }
}
