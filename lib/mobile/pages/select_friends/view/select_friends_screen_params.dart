import 'package:bill_share/mobile/pages/select_friends/view/select_friends_screen.dart';
import 'package:bill_share/models/user/friend_info.dart';
import 'package:bill_share/services/navigation/api/screen_parameters.dart';

class SelectFriendsParams extends ScreenParams<SelectFriendsScreen> {
  List<FriendInfo> selectedFriends = [];
}
