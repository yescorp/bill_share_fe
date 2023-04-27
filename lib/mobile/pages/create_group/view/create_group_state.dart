import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../models/user/friend_info.dart';

part 'create_group_state.freezed.dart';

@freezed
class CreateGroupState with _$CreateGroupState {
  factory CreateGroupState({
    @Default([]) List<FriendInfo> friends,
  }) = _CreateGroupState;
}
