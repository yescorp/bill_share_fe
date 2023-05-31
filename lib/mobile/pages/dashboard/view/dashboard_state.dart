import 'package:bill_share/models/spendings/spendings_details.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'dashboard_state.freezed.dart';

@freezed
class DashboardState with _$DashboardState {
  factory DashboardState({
    SpendingsDetails? spendingsDetails,
    @Default(false) bool update,
    @Default(100000) int monthlyLimit,
  }) = _DashboardState;
}
