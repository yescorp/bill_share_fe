// ignore_for_file: avoid_print
import 'dart:io';

import 'package:interact/interact.dart';

const pathToMobilePages = './lib/mobile/pages';
const pathToWebPages = './lib/web/pages';

void main() {
  print('Hello! We will setup files for new screen for you!');

  print(
      'Please, enter the screen name without screen postfix [friends_list]: ');
  final screenName = stdin.readLineSync();
  if (screenName == '' || screenName == null) {
    print('Screen name must not be empty. Try again..');
    return;
  }

  final selectedPlatform = Select(
    options: [
      'Mobile',
      'Web',
    ],
    prompt: 'Please, choose the platform:',
  ).interact();

  final shouldIncludeScreenParams = Select(
    options: [
      'Yes',
      'No',
    ],
    prompt: 'Should include Screen Params for navigation?',
  ).interact();

  if (selectedPlatform == 0) {
    handleMobile(screenName, shouldIncludeScreenParams == 0);
    return;
  }

  if (selectedPlatform == 1) {
    handleWeb(screenName, shouldIncludeScreenParams == 0);
    return;
  }
}

Future<void> handleMobile(
    String screenName, bool shouldIncludeScreenParams) async {
  final className = getClassName(screenName);
  final screenClass = className + 'Screen';
  final cubitClass = className + 'Cubit';
  final stateClass = className + 'State';
  final paramsClass = className + 'Params';

  final path = '$pathToMobilePages/$screenName/view';
  Directory(path).create(recursive: true);
  final screen =
      await File('$path/${screenName}_screen.dart').create(recursive: true);

  final ctorWithParams = '''
  final $paramsClass params;

  const $screenClass({
    super.key,
    required this.params,
  });
''';

  final ctorWithoutParams = '''
  const $screenClass({super.key});
''';

  final constructor =
      shouldIncludeScreenParams ? ctorWithParams : ctorWithoutParams;

  final registerWithParams = '''
    DependencyProvider.container.registerFactoryParam<$screenClass, $paramsClass, void>(
        (param1, param2) => $screenClass(params: param1));
    DependencyProvider.registerFactory<$cubitClass>(
      () => $cubitClass(
        $stateClass(),
        navigationProvider: DependencyProvider.get<NavigationProvider>(),
      ),
    );''';

  final registerWithoutParams = '''
    DependencyProvider.registerFactory<$screenClass>(
        () => const $screenClass());
    DependencyProvider.registerFactory<$cubitClass>(
      () => $cubitClass(
        $stateClass(),
        navigationProvider: DependencyProvider.get<NavigationProvider>(),
      ),
    );''';

  final register =
      shouldIncludeScreenParams ? registerWithParams : registerWithoutParams;

  screen.writeAsString('''
import 'package:bill_share/di/dependency_injection.dart';
import 'package:bill_share/common/base_screen.dart';
import 'package:bill_share/mobile/pages/$screenName/view/${screenName}_cubit.dart';
import 'package:bill_share/mobile/pages/$screenName/view/${screenName}_state.dart';
import 'package:bill_share/mobile/pages/$screenName/view/${screenName}_screen_params.dart';
import 'package:bill_share/services/navigation/api/navigation_provider.dart';
import 'package:flutter/material.dart';

class $screenClass extends AbstractScreen<$stateClass, $cubitClass> {
$constructor
  @override
  $cubitClass createCubit() {
    return DependencyProvider.get<$cubitClass>();
  }

  @override
  Widget buildPage(context, cubit, state) {
    return Container();
  }

  static void register(){
$register
  }
}
''');

  final cubit =
      await File('$path/${screenName}_cubit.dart').create(recursive: true);
  cubit.writeAsString('''
import 'package:bill_share/mobile/pages/$screenName/view/${screenName}_state.dart';
import 'package:bill_share/services/navigation/api/navigation_provider.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

class $cubitClass extends BlocBase<$stateClass> {
  final NavigationProvider navigationProvider;

  $cubitClass(
    super.state, {
    required this.navigationProvider,
  });
}
''');

  final state =
      await File('$path/${screenName}_state.dart').create(recursive: true);
  state.writeAsString('''
class $stateClass {}
''');

  if (shouldIncludeScreenParams) {
    final params = await File('$path/${screenName}_screen_params.dart')
        .create(recursive: true);
    params.writeAsString('''
import 'package:bill_share/mobile/pages/$screenName/view/${screenName}_screen.dart';
import 'package:bill_share/services/navigation/api/screen_parameters.dart';

class $paramsClass extends ScreenParams<$screenClass> {}
''');
  }
}

void handleWeb(String screenName, bool bool) {}

String getClassName(String screenName) {
  return screenName.split('_').reduce((value, element) {
    return value.capitalize() + element.capitalize();
  });
}

extension on String {
  String capitalize() {
    if (length == 0) {
      return this;
    }

    return substring(0, 1).toUpperCase() + substring(1);
  }
}
