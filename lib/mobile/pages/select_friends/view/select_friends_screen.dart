import 'package:bill_share/di/dependency_injection.dart';
import 'package:bill_share/common/base_screen.dart';
import 'package:bill_share/mobile/pages/select_friends/view/select_friends_cubit.dart';
import 'package:bill_share/mobile/pages/select_friends/view/select_friends_state.dart';
import 'package:bill_share/mobile/pages/select_friends/view/select_friends_screen_params.dart';
import 'package:bill_share/services/navigation/api/navigation_provider.dart';
import 'package:bill_share/styles/colors.dart';
import 'package:bill_share/styles/text_styles.dart';
import 'package:flutter/material.dart';

import '../../../components/group_list_tile.dart';
import '../../../components/friend_list_tile.dart';

class SelectFriendsScreen
    extends AbstractScreen<SelectFriendsState, SelectFriendsCubit> {
  final SelectFriendsParams params;

  const SelectFriendsScreen({
    super.key,
    required this.params,
  });

  @override
  SelectFriendsCubit createCubit() {
    return DependencyProvider.get<SelectFriendsCubit>();
  }

  @override
  void initCubit(SelectFriendsCubit cubit, context) {
    cubit.initialize();
    super.initCubit(cubit, context);
  }

  @override
  Widget buildPage(context, cubit, state) {
    return DefaultTabController(
      length: 2,
      child: Builder(builder: (context) {
        return Scaffold(
          backgroundColor: AppColors.background,
          appBar: AppBar(
            leading: IconButton(
              onPressed: cubit.onBackButtonPressed,
              icon: const Icon(Icons.arrow_back),
            ),
            title: const Text(
              'Select Friends',
              style: TextStyle(fontSize: FontSizes.h2),
            ),
            // TextField(
            //   controller: cubit.searchController,
            //   decoration: const InputDecoration(
            //     suffixIcon: Icon(Icons.search),
            //   ),
            // ),
            bottom: const TabBar(
              labelPadding: EdgeInsets.symmetric(horizontal: 50),
              isScrollable: true,
              tabs: [
                Tab(
                  child: Text(
                    'Friends',
                    style: TextStyle(
                      fontSize: FontSizes.h3,
                    ),
                  ),
                ),
                Tab(
                  child: Text(
                    'Groups',
                    style: TextStyle(
                      fontSize: FontSizes.h3,
                    ),
                  ),
                ),
              ],
            ),
          ),
          body: TabBarView(
            children: [
              ListView.separated(
                itemCount: state.friends.length,
                separatorBuilder: (context, index) => const Divider(
                  height: 1,
                  color: AppColors.grey1,
                ),
                itemBuilder: (context, index) => FriendListTile.select(
                  info: state.friends[index],
                  checked: state.selectedFriends.contains(index),
                  onTap: (value) => cubit.onFriendSelect(index, value),
                ),
              ),
              ListView.separated(
                itemCount: state.groups.length,
                separatorBuilder: (context, index) => const Divider(
                  height: 1,
                  color: AppColors.grey1,
                ),
                itemBuilder: (context, index) => GroupListTile.select(
                  info: state.groups[index],
                  checked: state.selectedGroups.contains(index),
                  onTap: (value) => cubit.onGroupSelect(index, value),
                ),
              ),
            ],
          ),
          bottomSheet: Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            height: 110,
            child: Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    child: Text('Submit'),
                    onPressed: cubit.onSubmit,
                  ),
                ),
              ],
            ),
          ),
        );
      }),
    );
  }

  static void register() {
    DependencyProvider.container
        .registerFactoryParam<SelectFriendsScreen, SelectFriendsParams, void>(
            (param1, param2) => SelectFriendsScreen(params: param1));
    DependencyProvider.registerFactory<SelectFriendsCubit>(
      () => SelectFriendsCubit(
        SelectFriendsState(),
        navigationProvider: DependencyProvider.get<NavigationProvider>(),
      ),
    );
  }
}
