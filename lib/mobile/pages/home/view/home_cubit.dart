import 'package:bill_share/mobile/pages/dashboard/view/dashboard_screen.dart';
import 'package:bill_share/mobile/pages/expense_list/view/expense_list_screen.dart';
import 'package:bill_share/mobile/pages/friends_list/view/friends_list_screen.dart';
import 'package:bill_share/mobile/pages/home/view/home_state.dart';
import 'package:bill_share/services/navigation/api/navigation_provider.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

class HomeCubit extends BlocBase<HomeState> {
  final NavigationProvider navigationProvider;

  HomeCubit(
    super.state, {
    required this.navigationProvider,
  });

  void initCubit() {
    const screens = [
      DashboardScreen(),
      ExpenseListScreen(),
      FriendsListScreen(),
    ];

    emit(state.copyWith(
      screens: screens,
      selectedScreen: 0,
    ));
  }

  void onNavigationIconPressed(int value) {
    emit(state.copyWith(
      selectedScreen: value,
    ));
  }
}
