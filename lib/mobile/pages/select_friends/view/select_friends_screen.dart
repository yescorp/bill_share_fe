import 'package:bill_share/di/dependency_injection.dart';
import 'package:bill_share/common/base_screen.dart';
import 'package:bill_share/mobile/pages/select_friends/view/select_friends_cubit.dart';
import 'package:bill_share/mobile/pages/select_friends/view/select_friends_state.dart';
import 'package:bill_share/mobile/pages/select_friends/view/select_friends_screen_params.dart';
import 'package:bill_share/services/navigation/api/navigation_provider.dart';
import 'package:flutter/material.dart';

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
  Widget buildPage(context, cubit, state) {
    return DefaultTabController(
      length: 2,
      child: Builder(builder: (context) {
        return Scaffold(
          appBar: AppBar(
            leading: IconButton(
              onPressed: cubit.onBackButtonPressed,
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
                  text: 'Friends',
                ),
                Tab(
                  text: 'Groups',
                ),
              ],
            ),
          ),
          body: TabBarView(
            children: [
              ListView(
                children: [Text('Friend')],
              ),
              ListView(
                children: [Text('Group')],
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
