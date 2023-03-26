import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../models/payment/payment_item.dart';
import '../../../../models/user/friend_info.dart';

part 'create_payment_state.freezed.dart';

@freezed
class CreatePaymentState with _$CreatePaymentState {
  factory CreatePaymentState({
    String? selectedCategory,
    String? selectedPaymentType,
    @Default([]) List<FriendInfo> friends,
    @Default([]) List<PaymentItem> items,
  }) = _CreatePaymentState;
}
