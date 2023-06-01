import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../models/group/group_info.dart';
import '../../../../models/user/friend_info.dart';

part 'select_friends_state.freezed.dart';

@freezed
class SelectFriendsState with _$SelectFriendsState {
  factory SelectFriendsState({
    @Default([]) List<FriendInfo> friends,
    @Default([]) List<FriendInfo> selectedFriends,
    @Default([]) List<GroupInfo> groups,
    @Default([]) List<GroupInfo> selectedGroups,
  }) = _SelectFriendsState;
}
