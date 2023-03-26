import 'package:bill_share/mobile/pages/dashboard/view/dashboard_state.dart';
import 'package:bill_share/models/spendings/spendings_details.dart';
import 'package:bill_share/services/navigation/api/navigation_provider.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

class DashboardCubit extends BlocBase<DashboardState> {
  final NavigationProvider navigationProvider;

  DashboardCubit(
    super.state, {
    required this.navigationProvider,
  });

  void initialize() {
    emit(state.copyWith(
      spendingsDetails: SpendingsDetails(
        limit: 100000,
        totalSpendings: 50000,
        month: DateTime(2023, 5),
      ),
    ));
  }
}
