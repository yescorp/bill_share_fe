import 'dart:io';

import 'package:bill_share/di/application_platform.dart';
import 'package:bill_share/mobile/pages/create_group/view/create_group_screen.dart';
import 'package:bill_share/mobile/pages/create_payment/view/create_payment_screen.dart';
import 'package:bill_share/mobile/pages/create_payment_item/view/create_payment_item_screen.dart';
import 'package:bill_share/mobile/pages/dashboard/view/dashboard_screen.dart';
import 'package:bill_share/mobile/pages/expense_list/view/expense_list_screen.dart';
import 'package:bill_share/mobile/pages/friend_profile/view/friend_profile_screen.dart';
import 'package:bill_share/mobile/pages/friends_list/view/friends_list_screen.dart';
import 'package:bill_share/mobile/pages/home/view/Home_screen.dart';
import 'package:bill_share/mobile/pages/login_intro/login_intro_screen.dart';
import 'package:bill_share/mobile/pages/select_friends/view/select_friends_screen.dart';
import 'package:bill_share/mobile/pages/select_items/view/select_items_screen.dart';
import 'package:bill_share/mobile/pages/sign_in/view/sign_in_screen.dart';
import 'package:bill_share/mobile/pages/sign_up/view/sign_up_screen.dart';
import 'package:bill_share/services/accessors/current_user_accessor.dart';
import 'package:bill_share/services/image_converter/di/image_converter_dependency.dart';
import 'package:bill_share/services/mappers/generic.dart';
import 'package:bill_share/services/mappers/payment_info.dart';
import 'package:bill_share/services/mock_categories/mock_categories.dart';
import 'package:bill_share/services/navigation/di/navigation_dependency.dart';
import 'package:bill_share/services/network_client/di/network_client_dependency.dart';
import 'package:bill_share/swagger_generated_code/authenticator.dart';
import 'package:bill_share/swagger_generated_code/bill_share.swagger.dart';
import 'package:bill_share/web/pages/admin_dashboard/view/admin_dashboard_cubit.dart';
import 'package:bill_share/web/pages/admin_dashboard/view/admin_dashboard_screen.dart';
import 'package:bill_share/web/pages/login/view/login_screen.dart';
import 'package:chopper/chopper.dart';
import 'package:flutter/cupertino.dart';
import 'package:get_it/get_it.dart';

import '../mobile/pages/qr_scanner/view/qr_scanner_screen.dart';
import '../models/user/user_info.dart';
import '../web/pages/admin_user_details/view/admin_user_details_screen.dart';
import 'http_overrides.dart';

void kSetCurrentUser(UserInfo info) {
  DependencyProvider.get<CurrentUserAccessor>().user = info;
}

UserInfo? kGetCurrentUser() {
  return DependencyProvider.get<CurrentUserAccessor>().user;
}

class DependencyProvider {
  static final container = GetIt.instance;
  static final navigatorKey = GlobalKey<NavigatorState>();
  // static const baseUrl = 'http://localhost:5135';
  static const baseUrl = 'https://api.devartz.kz';

  /// Every Dependency should be registered inside this 1 method.
  static void registerDependencies({
    ApplicationPlatform platform = ApplicationPlatform.mobile,
  }) {
    // HttpOverrides.global = BadCertHttpOverrides();
    switch (platform) {
      case ApplicationPlatform.mobile:
        registerMobileScreens();
        break;
      case ApplicationPlatform.web:
        registerWebScreens();
        break;
    }

    DependencyProvider.registerLazySingleton<GenericMapper>(
      () => const GenericMapper(),
    );

    registerBuildContext();
    registerSwagger();
    registerCurrentUserAccessor();
    NetworkClientDependency.register();
    NavigationDependency.register();
    ImageConverterDependency.register();
    MockCategories.register();
    PaymentInfoMapper.register();
  }

  static void registerMobileScreens() {
    LoginIntroScreen.register();
    SigninScreen.register();
    SignupScreen.register();
    FriendsListScreen.register();
    QrScannerScreen.register();
    CreatePaymentScreen.register();
    CreatePaymentItemScreen.register();
    SelectFriendsScreen.register();
    DashboardScreen.register();
    ExpenseListScreen.register();
    SelectItemsScreen.register();
    FriendProfileScreen.register();
    HomeScreen.register();
    CreateGroupScreen.register();
  }

  static void registerWebScreens() {
    LoginScreen.register();
    AdminDashboardScreen.register();
    AdminUserDetailsScreen.register();
  }

  //=========================== Register Swagger ===========================

  static void registerSwagger() {
    registerLazySingleton<BillShareAuthenticator>(
      () => BillShareAuthenticator(
        clientAccessor: DependencyProvider.get<BillShare>,
      ),
    );

    registerLazySingleton(
      () => BillShare.create(
        baseUrl: Uri.parse(baseUrl),
        authenticator: DependencyProvider.get<BillShareAuthenticator>(),
      ),
    );
  }

  static void registerCurrentUserAccessor() {
    registerLazySingleton<CurrentUserAccessor>(() => CurrentUserAccessor());
  }

  //=========================== Register Dependencies methods ===========================

  static void registerBuildContext() {
    registerLazySingleton<GlobalKey<NavigatorState>>(() => navigatorKey);
    registerLazySingleton<BuildContext>(() => navigatorKey.currentContext!);
    registerLazySingleton<NavigatorState>(
        () => Navigator.of(DependencyProvider.get<BuildContext>()));
  }

  //=========================== Delegate Methods ===========================

  static T get<T extends Object>({
    dynamic param1,
    dynamic param2,
  }) {
    return container.get<T>(param1: param1, param2: param2);
  }

  static void registerFactory<T extends Object>(
    T Function() factory, {
    String? instanceName,
  }) {
    container.registerFactory<T>(factory, instanceName: instanceName);
  }

  static void registerLazySingleton<T extends Object>(
    T Function() factory, {
    String? instanceName,
  }) {
    container.registerLazySingleton<T>(factory, instanceName: instanceName);
  }
}
