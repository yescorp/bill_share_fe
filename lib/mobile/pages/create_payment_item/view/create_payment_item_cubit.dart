import 'package:bill_share/mobile/pages/create_payment_item/view/create_payment_item_state.dart';
import 'package:bill_share/services/navigation/api/navigation_provider.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

class CreatePaymentItemCubit extends BlocBase<CreatePaymentItemState> {
  final NavigationProvider navigationProvider;

  CreatePaymentItemCubit(
    super.state, {
    required this.navigationProvider,
  });
}
