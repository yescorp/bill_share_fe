import 'package:bill_share/di/dependency_injection.dart';
import 'package:bill_share/common/base_screen.dart';
import 'package:bill_share/mobile/components/acronym_avatar.dart';
import 'package:bill_share/mobile/components/categories_chart.dart';
import 'package:bill_share/mobile/pages/friend_profile/view/friend_profile_cubit.dart';
import 'package:bill_share/mobile/pages/friend_profile/view/friend_profile_state.dart';
import 'package:bill_share/mobile/pages/friend_profile/view/friend_profile_screen_params.dart';
import 'package:bill_share/services/navigation/api/navigation_provider.dart';
import 'package:bill_share/styles/text_styles.dart';
import 'package:flutter/material.dart';

import '../../../../models/payment/payment_category.dart';
import '../../../../styles/colors.dart';

final chartData = {
  PaymentCategory(
    id: 'qwe',
    name: 'Restaurants',
    color: AppColors.avatarColors[0],
  ): 100.0,
  PaymentCategory(
    id: 'asd',
    name: 'Grocery',
    color: AppColors.avatarColors[1],
  ): 200.0,
  PaymentCategory(
    id: 'asd',
    name: 'House Holdings',
    color: AppColors.avatarColors[2],
  ): 200.0,
};

class FriendProfileScreen
    extends AbstractScreen<FriendProfileState, FriendProfileCubit> {
  final FriendProfileParams params;

  const FriendProfileScreen({
    super.key,
    required this.params,
  });

  @override
  FriendProfileCubit createCubit() {
    return DependencyProvider.get<FriendProfileCubit>();
  }

  @override
  void initCubit(FriendProfileCubit cubit, context) {
    cubit.initialize();
    super.initCubit(cubit, context);
  }

  @override
  Widget buildPage(context, cubit, state) {
    return state.map(
      empty: (e) => Container(),
      loaded: (state) {
        return Scaffold(
          backgroundColor: AppColors.background,
          appBar: AppBar(
            leading: IconButton(
              icon: const Icon(Icons.arrow_back_ios),
              onPressed: cubit.onBackButtonPressed,
            ),
            title: Text(
              '${state.info.name} ${state.info.surname}',
              style: const TextStyle(
                fontSize: FontSizes.h2,
              ),
            ),
          ),
          body: ListView(
            shrinkWrap: true,
            children: [
              Container(
                padding: const EdgeInsets.all(12.0),
                decoration: BoxDecoration(
                    color: AppColors.white,
                    border: Border.all(
                      color: AppColors.grey1,
                    ),
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(30),
                      bottomRight: Radius.circular(30),
                    )),
                child: Row(
                  children: [
                    Expanded(
                      child: AcronymAvatar(
                        name: state.info.name,
                        heightWidth: 120,
                        style: const TextStyle(
                          fontSize: FontSizes.h2,
                          color: AppColors.white,
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Column(
                        children: [
                          const Text(
                            'Popular spending categories',
                            style: TextStyle(
                              fontSize: FontSizes.p1,
                            ),
                          ),
                          CategoriesChart(
                            details: chartData,
                            width: 100,
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const SizedBox(width: 10),
                  Expanded(
                    child: Container(
                      decoration: const BoxDecoration(
                        color: AppColors.mainBlue,
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                      child: const ListTile(
                        title: Text(
                          'Friends',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: AppColors.white,
                            fontSize: FontSizes.h3,
                          ),
                        ),
                        subtitle: Text(
                          '48',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: AppColors.white,
                            fontSize: FontSizes.p1,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Container(
                      decoration: const BoxDecoration(
                        color: AppColors.mainBlue,
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                      child: const ListTile(
                        title: Text(
                          'Groups',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: AppColors.white,
                            fontSize: FontSizes.h3,
                          ),
                        ),
                        subtitle: Text(
                          '48',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: AppColors.white,
                            fontSize: FontSizes.p1,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Container(
                      decoration: const BoxDecoration(
                        color: AppColors.mainBlue,
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                      child: const ListTile(
                        title: Text(
                          'Checks',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: AppColors.white,
                            fontSize: FontSizes.h3,
                          ),
                        ),
                        subtitle: Text(
                          '48',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: AppColors.white,
                            fontSize: FontSizes.p1,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                ],
              ),
              ListView.builder(
                shrinkWrap: true,
                itemCount: 3,
                itemBuilder: (context, index) {
                  return Container();
                },
              )
            ],
          ),
        );
      },
    );
  }

  static void register() {
    DependencyProvider.container
        .registerFactoryParam<FriendProfileScreen, FriendProfileParams, void>(
            (param1, param2) => FriendProfileScreen(params: param1));
    DependencyProvider.registerFactory<FriendProfileCubit>(
      () => FriendProfileCubit(
        FriendProfileState.empty(),
        navigationProvider: DependencyProvider.get<NavigationProvider>(),
      ),
    );
  }
}
