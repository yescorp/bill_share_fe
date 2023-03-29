import 'package:bill_share/di/dependency_injection.dart';
import 'package:bill_share/common/base_screen.dart';
import 'package:bill_share/mobile/components/group_list_tile.dart';
import 'package:bill_share/mobile/pages/friends_list/view/friends_list_cubit.dart';
import 'package:bill_share/mobile/pages/friends_list/view/friends_list_state.dart';
import 'package:bill_share/services/navigation/api/navigation_provider.dart';
import 'package:flutter/material.dart';

import '../../../../styles/colors.dart';
import '../../../../styles/text_styles.dart';
import '../../../components/friend_list_tile.dart';

class FriendsListScreen
    extends AbstractScreen<FriendsListState, FriendsListCubit> {
  const FriendsListScreen({super.key});

  @override
  FriendsListCubit createCubit() {
    return DependencyProvider.get<FriendsListCubit>();
  }

  @override
  void initCubit(FriendsListCubit cubit) {
    cubit.initialize();
    super.initCubit(cubit);
  }

  @override
  Widget buildPage(context, cubit, state) {
    return DefaultTabController(
      length: 3,
      child: Builder(builder: (context) {
        return Scaffold(
          backgroundColor: AppColors.background,
          appBar: AppBar(
            leading: IconButton(
              onPressed: () {},
              icon: const Icon(Icons.arrow_back),
            ),
            title: TextField(
              controller: cubit.searchController,
              decoration: const InputDecoration(
                suffixIcon: Icon(Icons.search),
              ),
            ),
            bottom: const TabBar(
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
                Tab(
                  child: Text(
                    'Friendship Requests',
                    style: TextStyle(
                      fontSize: FontSizes.h3,
                    ),
                  ),
                ),
              ],
            ),
          ),
          body: Column(
            children: [
              Expanded(
                child: TabBarView(
                  children: [
                    ListView.separated(
                      itemCount: state.friends.length,
                      separatorBuilder: (context, index) => const Divider(
                        height: 1,
                        color: AppColors.grey1,
                      ),
                      itemBuilder: (context, index) => FriendListTile.view(
                        info: state.friends[index],
                      ),
                    ),
                    ListView.separated(
                      itemCount: state.groups.length,
                      separatorBuilder: (context, index) => const Divider(
                        height: 1,
                        color: AppColors.grey1,
                      ),
                      itemBuilder: (context, index) => GroupListTile.view(
                        info: state.groups[index],
                      ),
                    ),
                    ListView.separated(
                      itemCount: state.friendshipRequests.length,
                      separatorBuilder: (context, index) => const Divider(
                        height: 1,
                        color: AppColors.grey1,
                      ),
                      itemBuilder: (context, index) => FriendListTile.request(
                        info: state.friendshipRequests[index],
                        onAccept: () => cubit.acceptRequest(index),
                        onReject: () => cubit.rejectRequest(index),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                height: 100,
                decoration: BoxDecoration(
                  color: Colors.white,
                ),
              ),
            ],
          ),
        );
      }),
    );
  }

  static void register() {
    DependencyProvider.registerFactory<FriendsListScreen>(
        () => const FriendsListScreen());
    DependencyProvider.registerFactory<FriendsListCubit>(
      () => FriendsListCubit(
        FriendsListState(),
        navigationProvider: DependencyProvider.get<NavigationProvider>(),
      ),
    );
  }
}
