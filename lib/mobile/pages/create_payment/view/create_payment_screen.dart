import 'package:bill_share/di/dependency_injection.dart';
import 'package:bill_share/common/base_screen.dart';
import 'package:bill_share/mobile/pages/create_payment/view/create_payment_cubit.dart';
import 'package:bill_share/mobile/pages/create_payment/view/create_payment_state.dart';
import 'package:bill_share/mobile/pages/create_payment/view/create_payment_screen_params.dart';
import 'package:bill_share/services/navigation/api/navigation_provider.dart';
import 'package:flutter/material.dart';

class CreatePaymentScreen extends AbstractScreen<CreatePaymentState, CreatePaymentCubit> {
  final CreatePaymentParams params;

  const CreatePaymentScreen({
    super.key,
    required this.params,
  });

  @override
  CreatePaymentCubit createCubit() {
    return DependencyProvider.get<CreatePaymentCubit>();
  }

  @override
  Widget buildPage(context, cubit, state) {
    return Container();
  }

  static void register(){
    DependencyProvider.container.registerFactoryParam<CreatePaymentScreen, CreatePaymentParams, void>(
        (param1, param2) => CreatePaymentScreen(params: param1));
    DependencyProvider.registerFactory<CreatePaymentCubit>(
      () => CreatePaymentCubit(
        CreatePaymentState(),
        navigationProvider: DependencyProvider.get<NavigationProvider>(),
      ),
    );
  }
}
