import 'package:bill_share/models/payment/payment_info.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'expense_list_state.freezed.dart';

@freezed
class ExpenseListState with _$ExpenseListState {
  factory ExpenseListState({
    @Default([]) List<PaymentInfo> details,
    @Default([]) List<String> openedExpenses,
  }) = _ExpenseListState;
}
