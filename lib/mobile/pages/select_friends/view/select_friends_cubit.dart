import 'package:bill_share/mobile/pages/select_friends/view/select_friends_state.dart';
import 'package:bill_share/models/group/group_info.dart';
import 'package:bill_share/models/user/friend_info.dart';
import 'package:bill_share/services/navigation/api/navigation_provider.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

class SelectFriendsCubit extends BlocBase<SelectFriendsState> {
  final NavigationProvider navigationProvider;

  final TextEditingController searchController = TextEditingController();

  SelectFriendsCubit(
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
      ),
    );
  }

  void onBackButtonPressed() {
    navigationProvider.pop();
  }

  void onSubmit() {
    navigationProvider.pop<List<FriendInfo>>(
      result: state.selectedFriends
          .map<FriendInfo>((e) => state.friends[e])
          .toList(growable: false),
    );
  }

  onFriendSelect(int index, bool? value) {
    if (value == null) {
      return;
    }
    if (value == true) {
      emit(
        state.copyWith(
          selectedFriends: [
            ...state.selectedFriends,
            index,
          ],
        ),
      );
    } else {
      final newList = [...state.selectedFriends];
      newList.remove(index);
      emit(
        state.copyWith(
          selectedFriends: newList,
        ),
      );
    }
  }

  onGroupSelect(int index, bool? value) {
    if (value == null) {
      return;
    }
    if (value == true) {
      emit(
        state.copyWith(
          selectedGroups: [
            ...state.selectedGroups,
            index,
          ],
        ),
      );
    } else {
      final newList = [...state.selectedGroups];
      newList.remove(index);
      emit(
        state.copyWith(
          selectedGroups: newList,
        ),
      );
    }
  }
}
