import 'package:bill_share/mobile/pages/create_group/view/create_group_state.dart';
import 'package:bill_share/mobile/pages/select_friends/view/select_friends_screen.dart';
import 'package:bill_share/mobile/pages/select_friends/view/select_friends_screen_params.dart';
import 'package:bill_share/models/user/friend_info.dart';
import 'package:bill_share/services/navigation/api/navigation_provider.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

import '../../../../swagger_generated_code/bill_share.swagger.dart';

class CreateGroupCubit extends BlocBase<CreateGroupState> {
  final NavigationProvider navigationProvider;
  final BillShare client;
  final groupNameController = TextEditingController();

  CreateGroupCubit(
    super.state, {
    required this.navigationProvider,
    required this.client,
  });

  void onSelectFriends() async {
    final result = await navigationProvider
        .pushWithResult<SelectFriendsScreen, List<FriendInfo>?>(
      params: SelectFriendsParams(),
    );
    emit(state.copyWith(friends: result ?? []));
  }

  void onSubmit() async {
    final result = await client.groupsPost(
        body: CreateGroupRequest(
      groupName: groupNameController.text,
      participants:
          state.friends.map<String>((e) => e.userId).toList(growable: false),
    ));
    navigationProvider.pop();
  }
}
