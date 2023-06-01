import 'package:bill_share/models/spendings/spendings_details.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'admin_user_details_state.freezed.dart';

@freezed
class AdminUserDetailsState with _$AdminUserDetailsState {
  factory AdminUserDetailsState({
    SpendingsDetails? spendings,
  }) = _AdminUserDetailsState;
}
