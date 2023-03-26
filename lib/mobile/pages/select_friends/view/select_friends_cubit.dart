import 'package:bill_share/mobile/pages/select_friends/view/select_friends_state.dart';
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

  void onBackButtonPressed() {
    navigationProvider.pop();
  }

  void onSubmit() {
    navigationProvider.pop<List<FriendInfo>>(
      result: [
        const FriendInfo(
          userId: 'userId',
          name: 'name',
          surname: 'surname',
          userName: 'userName',
        ),
      ],
    );
  }
}
