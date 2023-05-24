import 'package:bill_share/di/application_platform.dart';
import 'package:bill_share/web/pages/login/view/login_screen.dart';
import 'package:flutter/material.dart';

import '../di/dependency_injection.dart';
import '../styles/theme.dart';

void main(List<String> args) {
  DependencyProvider.registerDependencies(platform: ApplicationPlatform.web);

  runApp(const WebApp());
}

class WebApp extends StatelessWidget {
  const WebApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: DependencyProvider.get<GlobalKey<NavigatorState>>(),
      title: 'Flutter Demo',
      theme: brightTheme,
      home: Builder(builder: (context) {
        return GestureDetector(
          onTap: () {
            final focus = FocusScope.of(context);
            focus.unfocus();
          },
          child: const LoginScreen(),
        );
      }),
    );
  }
}
