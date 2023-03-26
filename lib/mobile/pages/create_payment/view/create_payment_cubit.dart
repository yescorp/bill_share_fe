import 'package:bill_share/mobile/pages/create_payment/view/create_payment_state.dart';
import 'package:bill_share/mobile/pages/create_payment_item/view/create_payment_item_screen.dart';
import 'package:bill_share/models/payment/payment_item.dart';
import 'package:bill_share/services/navigation/api/navigation_provider.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

class CreatePaymentCubit extends BlocBase<CreatePaymentState> {
  final NavigationProvider navigationProvider;

  List<String> get categories => [
        'Restaurant',
        'Grocery',
      ];

  CreatePaymentCubit(
    super.state, {
    required this.navigationProvider,
  });

  List<String> get paymentTypes => [
        'Necessary',
        'Self',
        'Urgent',
      ];

  void onCategoryChange(String? value) {
    emit(
      state.copyWith(
        selectedCategory: value,
      ),
    );
  }

  void onBackButtonPressed() {}

  void onPaymentTypeChange(String? value) {
    emit(state.copyWith(
      selectedPaymentType: value,
    ));
  }

  void onAddFriendsPressed() {}

  void onAddProductPressed() async {
    final result = await navigationProvider
        .pushWithResult<CreatePaymentItemScreen, PaymentItem?>();
    if (result == null) {
      return;
    }

    emit(state.copyWith(
      items: [...state.items, result],
    ));
  }
}
