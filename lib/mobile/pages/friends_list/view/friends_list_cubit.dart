import 'package:bill_share/di/dependency_injection.dart';
import 'package:bill_share/mobile/pages/friends_list/view/friends_list_state.dart';
import 'package:bill_share/mobile/pages/login_intro/login_intro_screen.dart';
import 'package:bill_share/models/user/user_info.dart';
import 'package:bill_share/services/navigation/api/navigation_provider.dart';
import 'package:bill_share/swagger_generated_code/bill_share.swagger.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

import '../../../../models/group/group_info.dart';
import '../../../../models/user/friend_info.dart';

class FriendsListCubit extends BlocBase<FriendsListState> {
  final int pageSize = 10;

  final NavigationProvider navigationProvider;
  final BillShare client;
  final TextEditingController searchController = TextEditingController();

  FriendsListCubit(
    super.state, {
    required this.navigationProvider,
    required this.client,
  });

  void initialize() {
    if (kGetCurrentUser() == null) {
      navigationProvider.replaceAll<LoginIntroScreen>();
      return;
    }
    //=========================== Mock ===========================
    emit(
      state.copyWith(
        friends: [
          const FriendInfo(
            userId: 'userId',
            name: 'qwe',
            surname: 'surname',
            userName: 'userName',
          ),
          const FriendInfo(
            userId: 'userId',
            name: 'asd',
            surname: 'surname',
            userName: 'userName',
          ),
          const FriendInfo(
            userId: 'userId',
            name: 'uio',
            surname: 'surname',
            userName: 'userName',
          ),
          const FriendInfo(
            userId: 'userId',
            name: 'zuo',
            surname: 'surname',
            userName: 'userName',
          ),
        ],
        groups: [
          const GroupInfo(friends: [
            FriendInfo(
              userId: 'userId',
              name: 'zuo',
              surname: 'surname',
              userName: 'userName',
            ),
          ], groupName: 'Group 1', groupId: 'Group 1'),
        ],
        friendshipRequests: [
          const FriendInfo(
            userId: 'userId',
            name: 'zuo',
            surname: 'surname',
            userName: 'userName',
          ),
        ],
      ),
    );
  }

  Future<int> getFriendsCount() async {
    final result = await client.usersSearchGet(pageSize: pageSize);
    if (result.isSuccessful) {
      return result.body!.totalCount!;
    }

    return 0;
  }

  acceptRequest(int index) {}

  rejectRequest(int index) {}

  Future<int> getSearchUsersCount() async {
    await Future.delayed(Duration(seconds: 1));
    if (searchController.text.isEmpty) {
      return 0;
    }

    final result = await client.usersSearchGet(
      username: searchController.text,
      pageSize: pageSize,
      pageNumber: 1,
    );
    if (result.isSuccessful) {
      return result.body!.totalCount!;
    }

    return 0;
  }

  Future<List<FriendInfo>> getUsersPage(int index) async {
    await Future.delayed(Duration(seconds: 1));
    if (searchController.text.isEmpty) {
      return [];
    }

    final result = await client.usersSearchGet(
      pageNumber: (index / pageSize).floor() + 1,
      pageSize: pageSize,
      username: searchController.text,
    );

    if (result.isSuccessful && result.body?.data != null) {
      return result.body!.data!.map<FriendInfo>((e) {
        return FriendInfo(
          userId: e.userId!,
          userName: e.userName!,
          name: e.userName!,
        );
      }).toList();
    }

    return [];
  }

  void onSearch(String value) {
    emit(state.copyWith(
      isSearch: true,
    ));
  }

  void onCancelSearch() {
    emit(state.copyWith(
      isSearch: false,
    ));
  }
}
