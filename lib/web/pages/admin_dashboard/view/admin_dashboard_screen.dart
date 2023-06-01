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
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../../mobile/components/acronym_avatar.dart';
import '../../../../mobile/components/dot_separated_list_tile.dart';
import '../../../../mobile/components/wavy_container/wavy_container.dart';
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
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: AppColors.background,
        appBar: AppBar(
          title: const Text(
            'Welcome to the admin dashboard!',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: FontSizes.h1,
            ),
          ),
          bottom: TabBar(
            tabs: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('Users'),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('Expenses'),
              ),
            ],
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: TabBarView(
            children: [
              ListView(
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
              ListView(
                children: [
                  if (state.payments == null) ...[
                    const Center(
                      child: CircularProgressIndicator(),
                    )
                  ]
                  // ignore: prefer_is_empty
                  else if (state.users?.length == 0) ...[
                    const Center(
                      child: Text(
                        'There are no payments in the system',
                        style: TextStyle(fontSize: FontSizes.h1),
                      ),
                    ),
                  ] else ...[
                    const SizedBox(height: 20),
                    ...state.payments!
                        .mapIndexed<Widget>((i, e) => Padding(
                              padding: const EdgeInsets.only(bottom: 20.0),
                              child: InkWell(
                                onTap: () => cubit.onExpenseTap(e.id),
                                onDoubleTap: () =>
                                    cubit.onExpenseDoubleTap(e.id),
                                child: WavyContainer(
                                  container: Container(
                                      color: AppColors.white,
                                      padding: EdgeInsets.all(20),
                                      child: Column(
                                        children: [
                                          Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Icon(
                                                Icons.circle,
                                                size: 40,
                                                color: AppColors.colorForType(
                                                  e.type,
                                                ),
                                              ),
                                              const SizedBox(width: 20),
                                              Expanded(
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      e.name,
                                                      textAlign:
                                                          TextAlign.start,
                                                      style: const TextStyle(
                                                        fontSize: FontSizes.h3,
                                                      ),
                                                    ),
                                                    const SizedBox(height: 10),
                                                    if (state.openedExpenses
                                                            .contains(e.id) &&
                                                        e.items.isNotEmpty) ...[
                                                      ...e.items.map(
                                                        (e) => Padding(
                                                          padding:
                                                              EdgeInsets.only(
                                                                  bottom: 5),
                                                          child:
                                                              DotSeparatedListTile(
                                                            label: e.name,
                                                            maxWidth: 800,
                                                            value:
                                                                '${e.price} x ${e.quantity}',
                                                            style:
                                                                const TextStyle(
                                                              fontSize:
                                                                  FontSizes.p1,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      DotSeparatedListTile(
                                                        label: 'Service',
                                                        value:
                                                            '${e.service - 100 < 0 ? 0 : e.service - 100} %',
                                                      ),
                                                      DotSeparatedListTile(
                                                        label: 'Taxes',
                                                        value:
                                                            '${e.taxes - 100 < 0 ? 0 : e.taxes - 100} %',
                                                      ),
                                                      const SizedBox(
                                                          height: 20),
                                                    ],
                                                    DotSeparatedListTile(
                                                      label: 'Total',
                                                      value: '${e.totalPrice}',
                                                      style: const TextStyle(
                                                        fontSize: FontSizes.p1,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                          const SizedBox(height: 10),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            children: [
                                              ...e.participants.map(
                                                (e) => Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 4.0),
                                                  child: AcronymAvatar(
                                                    name: e.info.userName,
                                                    userId: e.info.userId,
                                                    heightWidth: 40,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          )
                                        ],
                                      )),
                                ),
                              ),
                            ))
                        .toList(),
                  ],
                ],
              ),
            ],
          ),
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
