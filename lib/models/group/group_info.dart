import 'package:bill_share/models/user/friend_info.dart';

class GroupInfo {
  final List<FriendInfo> friends;
  final String groupName;
  final String groupId;

  const GroupInfo({
    required this.friends,
    required this.groupName,
    required this.groupId,
  });
}
