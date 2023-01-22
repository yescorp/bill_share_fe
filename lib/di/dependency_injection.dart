import 'package:bill_share/pages/sign_in/view/sign_in_screen.dart';
import 'package:bill_share/pages/sign_up/view/sign_up_screen.dart';
import 'package:bill_share/pages/sign_up/view/sign_up_widget_params.dart';
import 'package:bill_share/services/navigation/di/register_navigation.dart';
import 'package:bill_share/services/network_client.dart';
import 'package:flutter/cupertino.dart';
import 'package:get_it/get_it.dart';

class DependencyProvider {
  static final container = GetIt.instance;
  static final navigatorKey = GlobalKey<NavigatorState>();

  /// Every Dependency should be registered inside this 1 method.
  static void registerDependencies() {
    registerFactory<SigninScreen>(() => const SigninScreen());
    container.registerFactoryParam<SignupScreen, SignupScreenParams, void>(
        (param1, _) => SignupScreen(params: param1));

    registerBuildContext();
    registerNetworkClient();
    NavigationDependency.register();
  }

  //=========================== Register Dependencies methods ===========================

  static void registerBuildContext() {
    registerFactory<GlobalKey<NavigatorState>>(() => navigatorKey);
    registerFactory<BuildContext>(() => navigatorKey.currentContext!);
    registerFactory<NavigatorState>(
        () => Navigator.of(DependencyProvider.get<BuildContext>()));
  }

  static void registerNetworkClient() {
    const baseUrl = '';
    registerFactory<NetworkClient>(() => NetworkClient(baseUrl: baseUrl));
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
