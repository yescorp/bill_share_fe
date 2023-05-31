import 'package:bill_share/di/dependency_injection.dart';
import 'package:bill_share/mobile/pages/create_payment/view/create_payment_screen.dart';
import 'package:bill_share/mobile/pages/create_payment/view/create_payment_screen_params.dart';
import 'package:bill_share/mobile/pages/dashboard/view/dashboard_screen.dart';
import 'package:bill_share/mobile/pages/expense_list/view/expense_list_screen.dart';
import 'package:bill_share/mobile/pages/friends_list/view/friends_list_screen.dart';
import 'package:bill_share/mobile/pages/login_intro/login_intro_screen.dart';
import 'package:bill_share/mobile/pages/qr_scanner/view/qr_scanner_screen.dart';
import 'package:bill_share/styles/theme.dart';
import 'package:bill_share/swagger_generated_code/bill_share.swagger.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() {
  DependencyProvider.registerDependencies();

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  static _MyAppState? of(BuildContext context) =>
      context.findAncestorStateOfType<_MyAppState>();

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Locale locale = Locale('ru');
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [
        Locale('en'),
        Locale('ru'),
      ],
      locale: locale,
      navigatorKey: DependencyProvider.get<GlobalKey<NavigatorState>>(),
      title: 'Flutter Demo',
      theme: brightTheme,
      home: Builder(builder: (context) {
        return GestureDetector(
          onTap: () {
            final focus = FocusScope.of(context);
            focus.unfocus();
          },
          child: const LoginIntroScreen(),
        );
      }),
    );
  }

  void setLocale(Locale locale) {
    setState(() {
      this.locale = locale;
    });
  }
}
