import 'package:bill_share/mobile/pages/dashboard/view/dashboard_state.dart';
import 'package:bill_share/models/payment/payment_category.dart';
import 'package:bill_share/models/spendings/spendings_details.dart';
import 'package:bill_share/services/navigation/api/navigation_provider.dart';
import 'package:bill_share/swagger_generated_code/bill_share.swagger.dart';
import 'package:bloc/bloc.dart';

import '../../../../styles/colors.dart';

class DashboardCubit extends BlocBase<DashboardState> {
  final NavigationProvider navigationProvider;
  final BillShare client;

  DashboardCubit(
    super.state, {
    required this.navigationProvider,
    required this.client,
  });

  void initialize() {
    client.reportsPersonalGet(startDate: '1.1.2023', endDate: '1.12.2023').then(
      (value) {
        final was = [];
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
        emit(
          state.copyWith(
            spendingsDetails: details,
          ),
        );

        emit(state.copyWith(update: !state.update));
      },
    ).onError((error, stackTrace) {});
    // emit(state.copyWith(
    //   spendingsDetails: SpendingsDetails(
    //     limit: 100000,
    //     totalSpendings: 50000,
    //     month: DateTime(2023, 5),
    //     spendingCategories: {
    //       PaymentCategory(
    //         id: 'qwe',
    //         name: 'Restaurants',
    //         color: AppColors.avatarColors[0],
    //       ): 100,
    //       PaymentCategory(
    //         id: 'asd',
    //         name: 'Grocery',
    //         color: AppColors.avatarColors[1],
    //       ): 200,
    //       PaymentCategory(
    //         id: 'asd',
    //         name: 'House Holdings',
    //         color: AppColors.avatarColors[2],
    //       ): 200,
    //     },
    //   ),
    // ));
  }
}
