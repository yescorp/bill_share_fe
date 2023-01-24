import 'package:bill_share/di/dependency_injection.dart';
import 'package:bill_share/common/base_screen.dart';
import 'package:bill_share/mobile/pages/friends_list/view/friends_list_cubit.dart';
import 'package:bill_share/mobile/pages/friends_list/view/friends_list_state.dart';
import 'package:bill_share/services/navigation/api/navigation_provider.dart';
import 'package:flutter/material.dart';

class FriendsListScreen
    extends AbstractScreen<FriendsListState, FriendsListCubit> {
  const FriendsListScreen({super.key});

  @override
  FriendsListCubit createCubit() {
    return DependencyProvider.get<FriendsListCubit>();
  }

  @override
  Widget buildPage(context, cubit, state) {
    return DefaultTabController(
      length: 3,
      child: Builder(builder: (context) {
        return Scaffold(
          appBar: AppBar(
            leading: IconButton(
              onPressed: () {},
              icon: Icon(Icons.arrow_back),
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
                  text: 'Friends',
                ),
                Tab(
                  text: 'Groups',
                ),
                Tab(
                  text: 'Friendship requests',
                ),
              ],
            ),
          ),
          body: const TabBarView(
            children: [
              Icon(Icons.directions_car),
              Icon(Icons.directions_transit),
              Icon(Icons.directions_bike),
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
