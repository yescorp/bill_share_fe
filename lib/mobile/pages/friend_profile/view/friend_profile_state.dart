import 'package:bill_share/models/user/friend_info.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'friend_profile_state.freezed.dart';

@freezed
class FriendProfileState with _$FriendProfileState {
  factory FriendProfileState.empty() = _FriendProfileStateEmpty;

  factory FriendProfileState.loaded({
    required FriendInfo info,
  }) = _FriendProfileStateLoaded;
}
