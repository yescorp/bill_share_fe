import 'package:bill_share/mobile/pages/friend_profile/view/friend_profile_state.dart';
import 'package:bill_share/models/user/friend_info.dart';
import 'package:bill_share/services/navigation/api/navigation_provider.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

class FriendProfileCubit extends BlocBase<FriendProfileState> {
  final NavigationProvider navigationProvider;

  FriendProfileCubit(
    super.state, {
    required this.navigationProvider,
  });

  void initialize() {
    emit(FriendProfileState.loaded(
        info: const FriendInfo(
      name: 'Name',
      userId: 'userId',
      surname: 'Surname',
      userName: 'userName',
    )));
  }

  void onBackButtonPressed() {
  }
}
