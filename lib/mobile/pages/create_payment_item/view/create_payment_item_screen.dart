import 'package:bill_share/di/dependency_injection.dart';
import 'package:bill_share/common/base_screen.dart';
import 'package:bill_share/mobile/pages/create_payment_item/view/create_payment_item_cubit.dart';
import 'package:bill_share/mobile/pages/create_payment_item/view/create_payment_item_state.dart';
import 'package:bill_share/services/navigation/api/navigation_provider.dart';
import 'package:flutter/material.dart';

import '../../../../styles/colors.dart';

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
      backgroundColor: AppColors.background,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: cubit.onBackButtonPressed,
        ),
        title: Text('Create payment item'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: ListView(
          children: [
            TextField(
              controller: cubit.itemNameController,
              decoration: const InputDecoration(
                labelText: 'Name',
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: AppColors.grey1,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: AppColors.grey1,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: cubit.itemPriceController,
              decoration: const InputDecoration(
                labelText: 'Price',
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: AppColors.grey1,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: AppColors.grey1,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: cubit.itemCountController,
              decoration: const InputDecoration(
                labelText: 'Quantity',
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: AppColors.grey1,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: AppColors.grey1,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: cubit.onSubmit,
              child: Text('Create'),
            ),
          ],
        ),
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
