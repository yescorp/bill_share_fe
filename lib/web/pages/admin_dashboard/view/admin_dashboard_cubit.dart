import 'package:bill_share/models/user/detailed_user_info.dart';
import 'package:bill_share/models/user/user_info.dart';
import 'package:bill_share/swagger_generated_code/bill_share.swagger.dart';
import 'package:bill_share/web/pages/admin_dashboard/view/admin_dashboard_state.dart';
import 'package:bill_share/services/navigation/api/navigation_provider.dart';
import 'package:bill_share/web/pages/admin_user_details/view/admin_user_details_screen.dart';
import 'package:bill_share/web/pages/admin_user_details/view/admin_user_details_screen_params.dart';
import 'package:bloc/bloc.dart';

class AdminDashboardCubit extends BlocBase<AdminDashboardState> {
  final NavigationProvider navigationProvider;
  final BillShare client;

  AdminDashboardCubit(
    super.state, {
    required this.navigationProvider,
    required this.client,
  });

  void initialize() {
    client.usersAllGet().then((value) {
      if (value.body == null) {
        return [];
      }

      emit(state.copyWith(
        users: value.body!
            .map<DetailedUserInfo>(
              (e) => DetailedUserInfo(
                userId: e.id!,
                userName: e.name!,
                email: e.email!,
              ),
            )
            .toList(),
      ));
    }).onError((error, stackTrace) {
      int a = 0;
    });
  }

  Future<void> onUserDetailsClick(DetailedUserInfo e) async {
    await navigationProvider.push<AdminUserDetailsScreen>(
        params: AdminUserDetailsParams(userInfo: e));
  }
}
