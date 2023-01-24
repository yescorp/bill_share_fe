import 'package:bill_share/mobile/pages/friends_list/view/friends_list_state.dart';
import 'package:bill_share/services/navigation/api/navigation_provider.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

class FriendsListCubit extends BlocBase<FriendsListState> {
  final NavigationProvider navigationProvider;
  final TextEditingController searchController = TextEditingController();

  FriendsListCubit(
    super.state, {
    required this.navigationProvider,
  });
}
