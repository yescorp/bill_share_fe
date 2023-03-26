import 'package:bill_share/mobile/pages/friends_list/view/friends_list_state.dart';
import 'package:bill_share/services/navigation/api/navigation_provider.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

import '../../../../models/group/group_info.dart';
import '../../../../models/user/friend_info.dart';

class FriendsListCubit extends BlocBase<FriendsListState> {
  final NavigationProvider navigationProvider;
  final TextEditingController searchController = TextEditingController();

  FriendsListCubit(
    super.state, {
    required this.navigationProvider,
  });

  void initialize() {
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

  acceptRequest(int index) {}

  rejectRequest(int index) {}
}
