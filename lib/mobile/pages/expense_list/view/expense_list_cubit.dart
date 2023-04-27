import 'package:bill_share/mobile/pages/create_payment/view/create_payment_screen.dart';
import 'package:bill_share/mobile/pages/create_payment/view/create_payment_screen_params.dart';
import 'package:bill_share/mobile/pages/expense_list/view/expense_list_state.dart';
import 'package:bill_share/mobile/pages/select_items/view/select_items_screen.dart';
import 'package:bill_share/mobile/pages/select_items/view/select_items_screen_params.dart';
import 'package:bill_share/models/payment/payment_category.dart';
import 'package:bill_share/models/payment/payment_info.dart';
import 'package:bill_share/models/payment/payment_item.dart';
import 'package:bill_share/models/payment/payment_type.dart';
import 'package:bill_share/models/user/friend_info.dart';
import 'package:bill_share/services/mappers/payment_info.dart';
import 'package:bill_share/services/navigation/api/navigation_provider.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

import '../../../../swagger_generated_code/bill_share.swagger.dart';

class ExpenseListCubit extends BlocBase<ExpenseListState> {
  final NavigationProvider navigationProvider;
  final BillShare client;
  final PaymentInfoMapper paymentMapper;
  final pageSize = 1;

  ExpenseListCubit(
    super.state, {
    required this.navigationProvider,
    required this.client,
    required this.paymentMapper,
  });

  void initialize() {}

  onExpenseTap(String id) {
    if (state.openedExpenses.contains(id)) {
      final newList = [...state.openedExpenses];
      newList.remove(id);
      emit(
        state.copyWith(
          openedExpenses: newList,
        ),
      );
    } else {
      emit(
        state.copyWith(
          openedExpenses: [...state.openedExpenses, id],
        ),
      );
    }
  }

  onExpenseDoubleTap(String id) async {
    await navigationProvider.push<SelectItemsScreen>(
      params: SelectItemsParams(
        id: id,
      ),
    );
  }

  void onQrIconPressed() {}

  void onAddExpensePressed() async {
    await navigationProvider.push<CreatePaymentScreen>(
      params: const CreatePaymentParams(),
    );
  }

  Future<List<PaymentInfo>> getExpenses(int index) async {
    final result = await client.expensesGet(
      pageNumber: (index / pageSize).floor() + 1,
      pageSize: pageSize,
    );

    if (!result.isSuccessful) {
      return [];
    }
    final payments = <PaymentInfo>[];

    for (final dto in result.body!.data!) {
      try {
        payments.add(await paymentMapper.fromDto(dto));
      } on Exception catch (e, _) {
        print(e);
        rethrow;
      }
    }

    return payments;
  }

  Future<int> getExpensesCount() async {
    final result = await client.expensesGet(pageNumber: 1, pageSize: 1);
    if (!result.isSuccessful) {
      return 0;
    }

    return result.body!.totalCount!;
  }
}
