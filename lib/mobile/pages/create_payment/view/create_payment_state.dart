import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../models/payment/payment_category.dart';
import '../../../../models/payment/payment_item.dart';
import '../../../../models/user/friend_info.dart';
import '../../../../swagger_generated_code/bill_share.enums.swagger.dart';

part 'create_payment_state.freezed.dart';

@freezed
class CreatePaymentState with _$CreatePaymentState {
  factory CreatePaymentState({
    PaymentCategory? selectedCategory,
    ExpenseTypeId? selectedPaymentType,
    @Default(false) bool isServiceEnabled,
    @Default(false) bool isTaxesEnabled,
    @Default([]) List<FriendInfo> friends,
    @Default([]) List<PaymentItem> items,
    @Default([]) List<PaymentCategory> categories,
  }) = _CreatePaymentState;
}
