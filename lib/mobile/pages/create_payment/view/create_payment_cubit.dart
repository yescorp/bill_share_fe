import 'dart:convert';

import 'package:bill_share/di/dependency_injection.dart';
import 'package:bill_share/mobile/pages/create_payment/view/create_payment_state.dart';
import 'package:bill_share/mobile/pages/create_payment_item/view/create_payment_item_screen.dart';
import 'package:bill_share/mobile/pages/select_friends/view/select_friends_screen.dart';
import 'package:bill_share/mobile/pages/select_friends/view/select_friends_screen_params.dart';
import 'package:bill_share/models/payment/payment_item.dart';
import 'package:bill_share/models/user/friend_info.dart';
import 'package:bill_share/services/image_converter/api/image_converter.dart';
import 'package:bill_share/services/navigation/api/navigation_provider.dart';
import 'package:bill_share/swagger_generated_code/bill_share.swagger.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CreatePaymentCubit extends BlocBase<CreatePaymentState> {
  final NavigationProvider navigationProvider;
  final BillShare client;

  List<String> get categories => [
        'Restaurant',
        'Grocery',
      ];

  CreatePaymentCubit(
    super.state, {
    required this.navigationProvider,
    required this.client,
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

  void onBackButtonPressed() {
    navigationProvider.pop();
  }

  void onPaymentTypeChange(String? value) {
    emit(state.copyWith(
      selectedPaymentType: value,
    ));
  }

  void onAddFriendsPressed() async {
    final result = await navigationProvider
        .pushWithResult<SelectFriendsScreen, List<FriendInfo>?>(
      params: SelectFriendsParams(
        selectedFriends: state.friends,
      ),
    );
    if (result == null) {
      return;
    }

    emit(state.copyWith(
      friends: result,
    ));
  }

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

  onDelete(PaymentItem toDelete) {
    List<PaymentItem> newItems = [...state.items];
    newItems.remove(toDelete);

    emit(state.copyWith(
      items: newItems,
    ));
  }

  void onSubmit() async {
    final converter = DependencyProvider.get<ImageConverter>();
    final base64 = await converter
        .convertToBase64FromAssets('assets/category_icons/restaurant.png');
    final result = await client.iconsPost(
        body: CreateIconDto(
      iconImageData: base64,
      extension: 'png',
    ));

    print(result.isSuccessful);
  }
}
