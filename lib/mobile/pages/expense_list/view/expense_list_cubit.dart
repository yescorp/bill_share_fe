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
import 'package:bill_share/services/navigation/api/navigation_provider.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

class ExpenseListCubit extends BlocBase<ExpenseListState> {
  final NavigationProvider navigationProvider;

  ExpenseListCubit(
    super.state, {
    required this.navigationProvider,
  });

  void initialize() {
    emit(
      state.copyWith(
        details: [
          PaymentInfo(
            id: 'unique',
            category: PaymentCategory(
              name: 'Restaurant',
              id: 'Restaurant',
            ),
            creator: const FriendInfo(
              userId: 'userId',
              name: 'name',
              surname: 'surname',
              userName: 'userName',
            ),
            items: [
              const PaymentItem(
                id: 'id',
                name: 'Combo Basket L',
                quantity: 1,
                price: 10500,
              ),
              const PaymentItem(
                id: 'oid',
                name: 'Combo Basket M',
                quantity: 1,
                price: 7000,
              ),
            ],
            name: 'KFC Dinner',
            participants: [
              const FriendInfo(
                userId: 'userId',
                name: 'name',
                surname: 'surname',
                userName: 'userName',
              ),
              const FriendInfo(
                userId: 'userId',
                name: 'qwe',
                surname: 'surname',
                userName: 'userName',
              ),
            ],
            type: PaymentType.necessary,
            selectedItemIds: [],
          ),
          PaymentInfo(
            id: 'unique2',
            category: PaymentCategory(
              name: 'Restaurant',
              id: 'Restaurant',
            ),
            creator: const FriendInfo(
              userId: 'userId',
              name: 'name',
              surname: 'surname',
              userName: 'userName',
            ),
            items: [
              const PaymentItem(
                id: 'id',
                name: 'Combo Basket L',
                quantity: 1,
                price: 10500,
              ),
              const PaymentItem(
                id: 'oid',
                name: 'Combo Basket M',
                quantity: 1,
                price: 7000,
              ),
            ],
            name: 'KFC Dinner',
            participants: [
              const FriendInfo(
                userId: 'userId',
                name: 'name',
                surname: 'surname',
                userName: 'userName',
              ),
              const FriendInfo(
                userId: 'userId',
                name: 'qwe',
                surname: 'surname',
                userName: 'userName',
              ),
            ],
            type: PaymentType.necessary,
            selectedItemIds: [],
          ),
        ],
      ),
    );
  }

  onExpenseTap(int index) {
    if (state.openedExpenses.contains(state.details[index].id)) {
      final newList = [...state.openedExpenses];
      newList.remove(state.details[index].id);
      emit(
        state.copyWith(
          openedExpenses: newList,
        ),
      );
    } else {
      emit(
        state.copyWith(
          openedExpenses: [...state.openedExpenses, state.details[index].id],
        ),
      );
    }
  }

  onExpenseDoubleTap(int index) async {
    await navigationProvider.push<SelectItemsScreen>(
      params: SelectItemsParams(
        details: state.details[index],
      ),
    );
  }

  void onQrIconPressed() {}

  void onAddExpensePressed() async {
    await navigationProvider.push<CreatePaymentScreen>(
      params: const CreatePaymentParams(),
    );
  }
}
