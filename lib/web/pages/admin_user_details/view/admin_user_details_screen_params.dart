import 'package:bill_share/models/user/detailed_user_info.dart';
import 'package:bill_share/web/pages/admin_user_details/view/admin_user_details_screen.dart';
import 'package:bill_share/services/navigation/api/screen_parameters.dart';

class AdminUserDetailsParams extends ScreenParams<AdminUserDetailsScreen> {
  final DetailedUserInfo userInfo;

  const AdminUserDetailsParams({
    required this.userInfo,
  });
}
