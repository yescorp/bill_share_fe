import 'dart:convert';

import 'package:bill_share/di/dependency_injection.dart';
import 'package:bill_share/mobile/pages/create_payment/view/create_payment_screen_params.dart';
import 'package:bill_share/mobile/pages/create_payment/view/create_payment_state.dart';
import 'package:bill_share/mobile/pages/create_payment_item/view/create_payment_item_screen.dart';
import 'package:bill_share/mobile/pages/select_friends/view/select_friends_screen.dart';
import 'package:bill_share/mobile/pages/select_friends/view/select_friends_screen_params.dart';
import 'package:bill_share/mobile/pages/select_items/view/select_items_screen.dart';
import 'package:bill_share/mobile/pages/select_items/view/select_items_screen_params.dart';
import 'package:bill_share/models/payment/payment_category.dart';
import 'package:bill_share/models/payment/payment_info.dart';
import 'package:bill_share/models/payment/payment_item.dart';
import 'package:bill_share/models/user/friend_info.dart';
import 'package:bill_share/services/accessors/current_user_accessor.dart';
import 'package:bill_share/services/image_converter/api/image_converter.dart';
import 'package:bill_share/services/mappers/payment_info.dart';
import 'package:bill_share/services/navigation/api/navigation_provider.dart';
import 'package:bill_share/swagger_generated_code/bill_share.swagger.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

class CreatePaymentCubit extends BlocBase<CreatePaymentState> {
  final NavigationProvider navigationProvider;
  final paymentNameController = TextEditingController();
  final CurrentUserAccessor userAccessor;
  final BillShare client;
  final PaymentInfoMapper paymentInfoMapper;

  CreatePaymentCubit(
    super.state, {
    required this.navigationProvider,
    required this.client,
    required this.userAccessor,
    required this.paymentInfoMapper,
  });

  List<ExpenseTypeId> get paymentTypes => [
        ExpenseTypeId.necessary,
        ExpenseTypeId.selfexpenses,
        ExpenseTypeId.unexpected,
      ];

  void initialize(BuildContext context, CreatePaymentParams params) {
    if (params.initialPaymentInfo != null) {
      emit(state.copyWith(
        items: params.initialPaymentInfo!.items,
        isTaxesEnabled: params.initialPaymentInfo!.taxes,
      ));
      paymentNameController.text = params.initialPaymentInfo?.sellerName ?? '';
    }

    client.expenseCategoriesGet().then((value) {
      if (!value.isSuccessful) {
        return;
      }

      emit(
        state.copyWith(
          categories: value.body!
              .map(
                (e) => PaymentCategory(
                  id: e.id!,
                  name: e.name!,
                ),
              )
              .toList(),
        ),
      );
    });
  }

  void onCategoryChange(PaymentCategory? value) {
    emit(
      state.copyWith(
        selectedCategory: value,
      ),
    );
  }

  void onBackButtonPressed() {
    navigationProvider.pop();
  }

  void onPaymentTypeChange(ExpenseTypeId? value) {
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
    if (userAccessor.user == null) {
      return;
    }

    final accountsRequest = await client.accountsGet();
    if (!accountsRequest.isSuccessful) {
      return;
    }

    final participants = <String>{
      ...state.friends.map((e) => e.userId),
      userAccessor.user!.userId,
    }.toList();

    final account = accountsRequest.body!.first;
    final request = CreateExpenseRequest(
      name: paymentNameController.text,
      expenseTypeId: state.selectedPaymentType ?? ExpenseTypeId.selfexpenses,
      categoryId: state.selectedCategory?.id ?? state.categories[0].id,
      accountId: account.id,
      amount: _calculateAmount(),
      participants: participants
          .map<AddExpenseParticipantRequest>(
              (e) => AddExpenseParticipantRequest(userId: e))
          .toList(),
      items: [
        ...state.items.map(
          (e) => AddExpenseItemRequest(
            name: e.name,
            amount: e.price,
            count: e.quantity,
          ),
        ),
      ],
      multipliers: [
        if (state.isServiceEnabled)
          CreateExpenseMultiplierRequest(
            name: 'Service',
            costMultiplierPercent: 110,
          ),
        if (state.isTaxesEnabled)
          CreateExpenseMultiplierRequest(
            name: 'Taxes',
            costMultiplierPercent: 112,
          ),
      ],
    );

    final result = await client.expensesPost(body: request);

    print(result.isSuccessful);

    navigationProvider.replaceCurrent<SelectItemsScreen>(
      params: SelectItemsParams(
        id: result.body!.id,
        details: await paymentInfoMapper.fromDto(result.body!),
      ),
    );
  }

  void onServiceToggle(bool? value) {
    emit(
      state.copyWith(
        isServiceEnabled: !state.isServiceEnabled,
      ),
    );
  }

  void onTaxesToggle(bool? value) {
    emit(
      state.copyWith(
        isTaxesEnabled: !state.isTaxesEnabled,
      ),
    );
  }

  int _calculateAmount() {
    var total = state.items
        .map((e) => e.price * e.quantity)
        .reduce((value, element) => value + element);
    if (state.isServiceEnabled) {
      total *= 1.1;
    }
    if (state.isTaxesEnabled) {
      total *= 1.12;
    }

    return total.ceil();
  }
}
