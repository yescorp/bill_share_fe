import 'package:bill_share/common/base_cubit.dart';
import 'package:bill_share/di/dependency_injection.dart';
import 'package:bill_share/mobile/pages/create_group/view/create_group_screen.dart';
import 'package:bill_share/mobile/pages/friends_list/view/friends_list_state.dart';
import 'package:bill_share/mobile/pages/login_intro/login_intro_screen.dart';
import 'package:bill_share/models/user/user_info.dart';
import 'package:bill_share/services/navigation/api/navigation_provider.dart';
import 'package:bill_share/swagger_generated_code/bill_share.swagger.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

import '../../../../models/group/group_info.dart';
import '../../../../models/user/friend_info.dart';

class FriendsListCubit extends BaseCubit<FriendsListState> {
  final int pageSize = 1;

  final NavigationProvider navigationProvider;
  final BillShare client;
  final TextEditingController searchController = TextEditingController();

  FriendsListCubit(
    super.state, {
    required this.navigationProvider,
    required this.client,
  });

  @override
  void initialize(BuildContext context) {
    if (kGetCurrentUser() == null) {
      navigationProvider.replaceAll<LoginIntroScreen>();
      return;
    }
    super.initialize(context);
  }

  Future acceptRequest(String userId) async {
    final result = await client.friendsUserIdAcceptPost(userId: userId);
    if (result.isSuccessful) {
      emit(state.copyWith(
        update: !state.update,
      ));
    }
  }

  Future rejectRequest(String userId) async {
    final result = await client.friendsUserIdDeclinePost(userId: userId);

    if (result.isSuccessful) {
      emit(state.copyWith(
        update: !state.update,
      ));
    }
  }

  Future<int> getSearchUsersCount() async {
    if (searchController.text.isEmpty) {
      return 0;
    }

    final result = await client.usersSearchGet(
      username: searchController.text,
      pageSize: 1,
      pageNumber: 1,
    );
    if (result.isSuccessful) {
      return result.body!.totalCount!;
    }

    return 0;
  }

  Future<List<FriendInfo>> getUsersPage(int index) async {
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
          isFriend: e.isFriend == true,
        );
      }).toList();
    }

    return [];
  }

  Future<int> getFriendsCount() async {
    final result = await client.friendsGet(pageNumber: 1, pageSize: 1);
    if (!result.isSuccessful) {
      return 0;
    }

    return result.body!.totalCount!;
  }

  Future<List<FriendInfo>> getFriends(int index) async {
    final result = await client.friendsGet(
      pageNumber: (index / pageSize).floor() + 1,
      pageSize: pageSize,
    );
    if (!result.isSuccessful) {
      return [];
    }

    return result.body!.data!
        .map((e) => FriendInfo(
              userId: e.userId!,
              userName: e.userName!,
              isFriend: true,
            ))
        .toList();
  }

  Future<int> getIncomingRequestsCount() async {
    final result = await client.friendsIncomingGet(
      pageNumber: 1,
      pageSize: 1,
    );

    if (!result.isSuccessful) {
      return 0;
    }

    return result.body!.totalCount!;
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

  Future onAddFriend(String userId) async {
    final result = await client.friendsPost(
        body: CreateFriendshipRequestDto(userId: userId));
    if (result.isSuccessful) {}
  }

  Future<List<FriendInfo>> getIncomingRequestsPage(int index) async {
    final result = await client.friendsIncomingGet(
      pageNumber: (index / pageSize).floor() + 1,
      pageSize: pageSize,
    );

    if (!result.isSuccessful) {
      return [];
    }

    return result.body!.data!
        .map(
          (e) => FriendInfo(
            userId: e.userId!,
            userName: e.userName!,
            avatarUrl: e.userAvatarUrl,
          ),
        )
        .toList();
  }

  void onAddGroupPressed() async {
    await navigationProvider.push<CreateGroupScreen>();
  }

  Future<int> getGroupsCount() async {
    final result = await client.groupsGet(pageNumber: 1, pageSize: 1);
    if (!result.isSuccessful) {
      return 0;
    }

    return result.body!.totalCount!;
  }

  Future<List<GroupInfo>> getGroups(int index) async {
    final result = await client.groupsGet(
      pageNumber: (index / pageSize).floor() + 1,
      pageSize: pageSize,
    );

    if (!result.isSuccessful) {
      return [];
    }

    return result.body!.data!
        .map(
          (e) => GroupInfo(
            groupId: e.groupId!,
            groupName: e.groupName!,
            friends: e.participants
                    ?.map<FriendInfo>((e) =>
                        FriendInfo(userId: e.userId!, userName: e.userName!))
                    .toList() ??
                [],
          ),
        )
        .toList();
  }
}
