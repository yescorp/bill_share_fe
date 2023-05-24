import 'package:bill_share/web/pages/admin_user_details/view/admin_user_details_screen_params.dart';
import 'package:bill_share/web/pages/admin_user_details/view/admin_user_details_state.dart';
import 'package:bill_share/services/navigation/api/navigation_provider.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

import '../../../../models/payment/payment_category.dart';
import '../../../../models/spendings/spendings_details.dart';
import '../../../../styles/colors.dart';
import '../../../../swagger_generated_code/bill_share.swagger.dart';

class AdminUserDetailsCubit extends BlocBase<AdminUserDetailsState> {
  final NavigationProvider navigationProvider;
  final BillShare client;

  AdminUserDetailsCubit(
    super.state, {
    required this.navigationProvider,
    required this.client,
  });

  void initialize(AdminUserDetailsParams params) {
    client
        .reportsForUserUserIdGet(
            userId: params.userInfo.userId,
            startDate: '1.1.2023',
            endDate: '1.1.2024')
        .then((value) {
      List<Color> was = [];
      final details = SpendingsDetails(
        month: DateTime.now(),
        totalSpendings: value.body!.totalSpendings!,
        limit: 2000000,
        spendingCategories: Map.fromIterable(
          value.body!.categoriesSpendings!,
          key: (item) {
            final temp = (item as CategorySpend);
            var color = AppColors.randomAvatar;
            while (was.contains(color) &&
                was.length < AppColors.avatarColors.length) {
              color = AppColors.randomAvatar;
            }
            was.add(color);
            return PaymentCategory(
              id: temp.categoryId!,
              name: temp.categoryName!,
              color: color,
            );
          },
          value: (item) {
            {
              final temp = (item as CategorySpend);
              return temp.total!;
            }
          },
        ),
      );
      emit(state.copyWith(
        spendings: details,
      ));
    }).onError((error, stackTrace) => null);
  }
}
