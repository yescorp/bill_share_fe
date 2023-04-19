import 'package:bill_share/mobile/pages/select_friends/view/select_friends_screen_params.dart';
import 'package:bill_share/mobile/pages/select_friends/view/select_friends_state.dart';
import 'package:bill_share/models/group/group_info.dart';
import 'package:bill_share/models/user/friend_info.dart';
import 'package:bill_share/services/navigation/api/navigation_provider.dart';
import 'package:bill_share/swagger_generated_code/bill_share.swagger.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

class SelectFriendsCubit extends BlocBase<SelectFriendsState> {
  final NavigationProvider navigationProvider;
  final BillShare client;
  final pageSize = 1;

  final TextEditingController searchController = TextEditingController();

  SelectFriendsCubit(
    super.state, {
    required this.navigationProvider,
    required this.client,
  });

  void initialize(SelectFriendsParams params) {
    emit(
      state.copyWith(
        selectedFriends: params.selectedFriends,
      ),
    );
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

  void onBackButtonPressed() {
    navigationProvider.pop();
  }

  void onSubmit() {
    navigationProvider.pop<List<FriendInfo>>(
      result: state.selectedFriends,
    );
  }

  onFriendSelect(FriendInfo info, bool? value) {
    if (value == null) {
      return;
    }
    if (value == true) {
      emit(
        state.copyWith(
          selectedFriends: [
            ...state.selectedFriends,
            info,
          ],
        ),
      );
    } else {
      final newList = [...state.selectedFriends];
      newList.removeWhere((element) => element.userId == info.userId);
      emit(
        state.copyWith(
          selectedFriends: newList,
        ),
      );
    }
  }

  onGroupSelect(GroupInfo info, bool? value) {
    if (value == null) {
      return;
    }
    if (value == true) {
      emit(
        state.copyWith(
          selectedGroups: [
            ...state.selectedGroups,
            info,
          ],
        ),
      );
    } else {
      final newList = [...state.selectedGroups];
      newList.removeWhere((element) => element.groupId == info.groupId);
      emit(
        state.copyWith(
          selectedGroups: newList,
        ),
      );
    }
  }
}
