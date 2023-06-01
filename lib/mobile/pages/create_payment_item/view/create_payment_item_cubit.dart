import 'package:bill_share/mobile/pages/create_payment_item/view/create_payment_item_state.dart';
import 'package:bill_share/models/payment/payment_item.dart';
import 'package:bill_share/services/navigation/api/navigation_provider.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

class CreatePaymentItemCubit extends BlocBase<CreatePaymentItemState> {
  final NavigationProvider navigationProvider;

  TextEditingController itemNameController = TextEditingController();

  TextEditingController itemPriceController = TextEditingController();

  TextEditingController itemCountController = TextEditingController();

  CreatePaymentItemCubit(
    super.state, {
    required this.navigationProvider,
  });

  void onBackButtonPressed() {
    navigationProvider.pop();
  }

  void onSubmit() {
    navigationProvider.pop<PaymentItem>(
      result: PaymentItem(
        id: '',
        name: itemNameController.text,
        quantity: int.parse(itemCountController.text),
        price: double.parse(itemPriceController.text),
      ),
    );
  }
}
