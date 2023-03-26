import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../models/group/group_info.dart';
import '../../../../models/user/friend_info.dart';

part 'friends_list_state.freezed.dart';

@freezed
class FriendsListState with _$FriendsListState {
  factory FriendsListState({
    @Default([]) List<FriendInfo> friends,
    @Default([]) List<FriendInfo> friendshipRequests,
    @Default([]) List<GroupInfo> groups,
  }) = _FriendsListState;
}
