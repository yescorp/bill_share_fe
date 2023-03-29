import 'package:bill_share/di/dependency_injection.dart';
import 'package:bill_share/services/navigation/api/navigation_provider.dart';
import 'package:bill_share/services/navigation/api/screen_parameters.dart';
import 'package:flutter/material.dart';

class NavigationProviderImpl extends NavigationProvider {
  @override
  void pop<T>({
    T? result,
  }) {
    return DependencyProvider.get<NavigatorState>().pop<T>(result);
  }

  @override
  Future<void> push<Screen extends Widget>({
    ScreenParams? params,
  }) async {
    assert(
      DependencyProvider.container.isRegistered<Screen>(),
      'Screen must be registered in DI container',
    );

    final navigator = DependencyProvider.get<NavigatorState>();
    final screen = DependencyProvider.get<Screen>(param1: params);
    await navigator.push(MaterialPageRoute(builder: (context) => screen));
  }

  @override
  Future<T> pushWithResult<Screen extends Widget, T>({
    ScreenParams? params,
  }) async {
    assert(
      DependencyProvider.container.isRegistered<Screen>(),
      'Screen must be registered in DI container',
    );

    final navigator = DependencyProvider.get<NavigatorState>();
    final screen = DependencyProvider.get<Screen>(param1: params);
    return await navigator
        .push(MaterialPageRoute(builder: (context) => screen));
  }

  @override
  Future<void> replaceCurrent<Screen extends Widget>({
    ScreenParams? params,
  }) async {
    assert(
      DependencyProvider.container.isRegistered<Screen>(),
      'Screen must be registered in DI container',
    );

    final navigator = DependencyProvider.get<NavigatorState>();
    final screen = DependencyProvider.get<Screen>(param1: params);
    await navigator
        .pushReplacement(MaterialPageRoute(builder: (context) => screen));
  }

  @override
  Future<T?> replaceCurrentWithResult<Screen extends Widget, T>({
    ScreenParams? params,
  }) async {
    assert(
      DependencyProvider.container.isRegistered<Screen>(),
      'Screen must be registered in DI container',
    );

    final navigator = DependencyProvider.get<NavigatorState>();
    final screen = DependencyProvider.get<Screen>(param1: params);
    return await navigator.pushReplacement<T, Screen>(
        MaterialPageRoute(builder: (context) => screen));
  }

  @override
  Future<void> replaceAll<Screen extends Widget>({
    ScreenParams? params,
  }) async {
    assert(
      DependencyProvider.container.isRegistered<Screen>(),
      'Screen must be registered in DI container',
    );
    final navigator = DependencyProvider.get<NavigatorState>();
    final screen = DependencyProvider.get<Screen>(param1: params);
    navigator.pushAndRemoveUntil<Screen>(
      MaterialPageRoute(builder: (context) => screen),
      (route) => false,
    );
  }
}
