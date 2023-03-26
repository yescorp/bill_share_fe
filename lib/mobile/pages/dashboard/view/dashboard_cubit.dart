import 'package:bill_share/mobile/pages/dashboard/view/dashboard_state.dart';
import 'package:bill_share/models/payment/payment_category.dart';
import 'package:bill_share/models/spendings/spendings_details.dart';
import 'package:bill_share/services/navigation/api/navigation_provider.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

import '../../../../styles/colors.dart';

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
        spendingCategories: {
          PaymentCategory(
            id: 'qwe',
            name: 'Restaurants',
            color: AppColors.avatarColors[0],
          ): 100,
          PaymentCategory(
            id: 'asd',
            name: 'Grocery',
            color: AppColors.avatarColors[1],
          ): 200,
          PaymentCategory(
            id: 'asd',
            name: 'House Holdings',
            color: AppColors.avatarColors[2],
          ): 200,
        },
      ),
    ));
  }
}
