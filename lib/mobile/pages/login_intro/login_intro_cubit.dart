import 'package:bill_share/mobile/pages/login_intro/login_intro_state.dart';
import 'package:bill_share/mobile/pages/sign_in/view/sign_in_screen.dart';
import 'package:bill_share/mobile/pages/sign_up/view/sign_up_screen.dart';
import 'package:bill_share/services/navigation/api/navigation_provider.dart';
import 'package:bloc/bloc.dart';

class LoginIntroCubit extends BlocBase<LoginIntroState> {
  final NavigationProvider navigationProvider;

  LoginIntroCubit(
    super.state, {
    required this.navigationProvider,
  });

  void onSignupPressed() async {
    await navigationProvider.push<SignupScreen>();
  }

  void onSigninPressed() async {
    await navigationProvider.push<SigninScreen>();
  }
}
