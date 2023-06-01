import 'package:bill_share/models/payment/payment_info.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'select_items_state.freezed.dart';

@freezed
class SelectItemsState with _$SelectItemsState {
  factory SelectItemsState({
    PaymentInfo? details,
    @Default([]) List<String> selectedItemIds,
  }) = _SelectItemsState;
}
