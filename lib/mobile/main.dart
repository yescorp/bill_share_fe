import 'package:bill_share/di/dependency_injection.dart';
import 'package:bill_share/mobile/pages/create_payment/view/create_payment_screen.dart';
import 'package:bill_share/mobile/pages/create_payment/view/create_payment_screen_params.dart';
import 'package:bill_share/mobile/pages/dashboard/view/dashboard_cubit.dart';
import 'package:bill_share/mobile/pages/dashboard/view/dashboard_screen.dart';
import 'package:bill_share/mobile/pages/friends_list/view/friends_list_screen.dart';
import 'package:bill_share/styles/theme.dart';
import 'package:flutter/material.dart';

void main() {
  DependencyProvider.registerDependencies();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

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
          child: const DashboardScreen(),
        );
      }),
    );
  }
}
