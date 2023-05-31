import 'package:bill_share/models/user/user_info.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'settings_state.freezed.dart';

@freezed
class SettingsState with _$SettingsState {
  factory SettingsState({
    UserInfo? info,
    @Default(0) int monthlyLimit,
  }) = _SettingsState;
}
