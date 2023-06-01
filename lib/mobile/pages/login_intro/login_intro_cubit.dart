import 'dart:convert';
import 'dart:io';

import 'package:bill_share/mobile/pages/login_intro/login_intro_state.dart';
import 'package:bill_share/mobile/pages/sign_in/view/sign_in_screen.dart';
import 'package:bill_share/mobile/pages/sign_up/view/sign_up_screen.dart';
import 'package:bill_share/services/navigation/api/navigation_provider.dart';
import 'package:bloc/bloc.dart';
import 'package:chopper/chopper.dart';
import 'package:html/dom.dart';
import 'package:http/http.dart' as http;
import 'package:html/dom.dart' as dom;
import 'package:webview_flutter/webview_flutter.dart';

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
