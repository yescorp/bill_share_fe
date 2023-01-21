import 'package:bill_share/services/network_client.dart';
import 'package:flutter/cupertino.dart';
import 'package:get_it/get_it.dart';

class DependencyProvider {
  static final container = GetIt.instance;
  static final navigatorKey = GlobalKey<NavigatorState>();

  /// Every Dependency should be registered inside this 1 method.
  static void registerDependencies() {
    registerBuildContext();
    registerNetworkClient();
  }

  //=========================== Register Dependencies methods ===========================

  static void registerBuildContext() {
    registerLazySingleton<GlobalKey<NavigatorState>>(() => navigatorKey);
    registerLazySingleton<BuildContext>(() => navigatorKey.currentContext!);
  }

  static void registerNetworkClient() {
    const baseUrl = '';
    registerFactory<NetworkClient>(() => NetworkClient(baseUrl: baseUrl));
  }

  //=========================== Delegate Methods ===========================

  static T get<T extends Object>() {
    return container.get<T>();
  }

  static void registerFactory<T extends Object>(T Function() factory) {
    container.registerFactory<T>(factory);
  }

  static void registerLazySingleton<T extends Object>(T Function() factory) {
    container.registerLazySingleton<T>(factory);
  }
}
