import 'package:bill_share/di/dependency_injection.dart';
import 'package:bill_share/common/base_screen.dart';
import 'package:bill_share/mobile/pages/create_payment_item/view/create_payment_item_cubit.dart';
import 'package:bill_share/mobile/pages/create_payment_item/view/create_payment_item_state.dart';
import 'package:bill_share/services/navigation/api/navigation_provider.dart';
import 'package:flutter/material.dart';

class CreatePaymentItemScreen
    extends AbstractScreen<CreatePaymentItemState, CreatePaymentItemCubit> {
  const CreatePaymentItemScreen({super.key});

  @override
  CreatePaymentItemCubit createCubit() {
    return DependencyProvider.get<CreatePaymentItemCubit>();
  }

  @override
  Widget buildPage(context, cubit, state) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: cubit.onBackButtonPressed,
        ),
        title: Text('Create payment item'),
      ),
      body: ListView(
        children: [
          TextField(
            controller: cubit.itemNameController,
          ),
          TextField(
            controller: cubit.itemPriceController,
            keyboardType: TextInputType.number,
          ),
          TextField(
            controller: cubit.itemCountController,
            keyboardType: TextInputType.number,
          ),
          ElevatedButton(
            onPressed: cubit.onSubmit,
            child: Text('Create'),
          ),
        ],
      ),
    );
  }

  static void register() {
    DependencyProvider.registerFactory<CreatePaymentItemScreen>(
        () => const CreatePaymentItemScreen());
    DependencyProvider.registerFactory<CreatePaymentItemCubit>(
      () => CreatePaymentItemCubit(
        CreatePaymentItemState(),
        navigationProvider: DependencyProvider.get<NavigationProvider>(),
      ),
    );
  }
}
