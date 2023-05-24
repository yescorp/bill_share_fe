import 'package:bill_share/di/dependency_injection.dart';
import 'package:bill_share/common/base_screen.dart';
import 'package:bill_share/mobile/components/friend_list_tile.dart';
import 'package:bill_share/styles/text_styles.dart';
import 'package:bill_share/web/components/detailed_user_tile.dart';
import 'package:bill_share/web/pages/admin_dashboard/view/admin_dashboard_cubit.dart';
import 'package:bill_share/web/pages/admin_dashboard/view/admin_dashboard_state.dart';
import 'package:bill_share/services/navigation/api/navigation_provider.dart';
import 'package:flutter/material.dart';
import 'package:collection/collection.dart';

import '../../../../styles/colors.dart';
import '../../../../swagger_generated_code/bill_share.swagger.dart';

class AdminDashboardScreen
    extends AbstractScreen<AdminDashboardState, AdminDashboardCubit> {
  const AdminDashboardScreen({super.key});

  @override
  AdminDashboardCubit createCubit() {
    return DependencyProvider.get<AdminDashboardCubit>();
  }

  @override
  void initCubit(AdminDashboardCubit cubit, BuildContext context) {
    super.initCubit(cubit, context);
    cubit.initialize();
  }

  @override
  Widget buildPage(context, cubit, state) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: const Text(
          'Welcome to the admin dashboard!',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: FontSizes.h1,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: ListView(
          children: [
            if (state.users == null) ...[
              const Center(
                child: CircularProgressIndicator(),
              )
            ]
            // ignore: prefer_is_empty
            else if (state.users?.length == 0) ...[
              const Center(
                child: Text(
                  'There are no users in the system',
                  style: TextStyle(fontSize: FontSizes.h1),
                ),
              ),
            ] else ...[
              const SizedBox(height: 20),
              ...state.users!
                  .mapIndexed<Widget>(
                    (i, e) => InkWell(
                      onTap: () => cubit.onUserDetailsClick(e),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 2),
                        child: DetailedUserTile(userInfo: e),
                      ),
                    ),
                  )
                  .toList(),
            ],
          ],
        ),
      ),
    );
  }

  static void register() {
    DependencyProvider.registerFactory<AdminDashboardScreen>(
        () => const AdminDashboardScreen());
    DependencyProvider.registerFactory<AdminDashboardCubit>(
      () => AdminDashboardCubit(
        AdminDashboardState(),
        navigationProvider: DependencyProvider.get<NavigationProvider>(),
        client: DependencyProvider.get<BillShare>(),
      ),
    );
  }
}
