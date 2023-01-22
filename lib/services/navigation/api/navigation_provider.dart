import 'package:bill_share/services/navigation/api/screen_parameters.dart';
import 'package:flutter/material.dart';

abstract class NavigationProvider {
  Future<T> pushWithResult<Screen extends Widget, T>({
    ScreenParams? params,
  });

  Future<void> push<Screen extends Widget>({
    ScreenParams? params,
  });

  void pop<T>(T? result);

  Future<void> replaceCurrent<Screen extends Widget>({
    ScreenParams? params,
  });

  Future<T?> replaceCurrentWithResult<Screen extends Widget, T>({
    ScreenParams? params,
  });
}
