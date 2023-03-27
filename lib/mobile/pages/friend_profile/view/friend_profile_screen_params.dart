import 'package:bill_share/mobile/pages/friend_profile/view/friend_profile_screen.dart';
import 'package:bill_share/services/navigation/api/screen_parameters.dart';

class FriendProfileParams extends ScreenParams<FriendProfileScreen> {
  final String userId;

  const FriendProfileParams({
    required this.userId,
  });
}
