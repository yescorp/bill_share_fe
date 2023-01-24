import 'package:bill_share/di/dependency_injection.dart';
import 'package:bill_share/mobile/pages/friends_list/view/friends_list_screen.dart';
import 'package:bill_share/mobile/pages/login_intro/login_intro_screen.dart';
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
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Builder(builder: (context) {
        return GestureDetector(
            onTap: () {
              final focus = FocusScope.of(context);
              focus.unfocus();
            },
            child: const FriendsListScreen());
      }),
    );
  }
}
