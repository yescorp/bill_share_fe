import 'package:bill_share/models/payment/payment_info.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../models/user/detailed_user_info.dart';

part 'admin_dashboard_state.freezed.dart';

@freezed
class AdminDashboardState with _$AdminDashboardState {
  factory AdminDashboardState({
    List<DetailedUserInfo>? users,
    List<PaymentInfo>? payments,
    @Default([]) List<String> openedExpenses,
  }) = _AdminDashboardState;
}
