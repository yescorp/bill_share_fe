import 'package:bill_share/di/dependency_injection.dart';
import 'package:bill_share/common/base_screen.dart';
import 'package:bill_share/mobile/components/payment_item_details.dart';
import 'package:bill_share/mobile/pages/create_payment/view/create_payment_cubit.dart';
import 'package:bill_share/mobile/pages/create_payment/view/create_payment_state.dart';
import 'package:bill_share/mobile/pages/create_payment/view/create_payment_screen_params.dart';
import 'package:bill_share/services/navigation/api/navigation_provider.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../../../../styles/colors.dart';

class CreatePaymentScreen
    extends AbstractScreen<CreatePaymentState, CreatePaymentCubit> {
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
    return Scaffold(
      appBar: AppBar(
        title: Text('Payment info'),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
            color: AppColors.white,
          ),
          onPressed: cubit.onBackButtonPressed,
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        child: ListView(
          children: [
            TextField(
              decoration: const InputDecoration(
                labelText: 'Payment Name',
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
            DecoratedBox(
              decoration: BoxDecoration(
                border: Border.all(
                  color: AppColors.grey1,
                ),
                borderRadius: BorderRadius.all(Radius.circular(5)),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: DropdownButton(
                  hint: Text('Category'),
                  value: state.selectedCategory,
                  isExpanded: true,
                  items: cubit.categories
                      .map<DropdownMenuItem<String>>(
                          (e) => DropdownMenuItem<String>(
                                value: e,
                                child: Text(e),
                              ))
                      .toList(),
                  onChanged: cubit.onCategoryChange,
                  underline: Container(),
                ),
              ),
            ),
            const SizedBox(height: 10),
            DecoratedBox(
              decoration: BoxDecoration(
                border: Border.all(
                  color: AppColors.grey1,
                ),
                borderRadius: BorderRadius.all(Radius.circular(5)),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: DropdownButton(
                  iconEnabledColor: AppColors.grey1,
                  value: state.selectedPaymentType,
                  hint: Text('Payment type'),
                  isExpanded: true,
                  items: cubit.paymentTypes
                      .map<DropdownMenuItem<String>>(
                          (e) => DropdownMenuItem<String>(
                                value: e,
                                child: Text(e),
                              ))
                      .toList(),
                  onChanged: cubit.onPaymentTypeChange,
                  underline: Container(),
                ),
              ),
            ),
            const SizedBox(height: 10),
            ElevatedButton.icon(
              icon: Icon(Icons.add),
              label: Text('Friends'),
              onPressed: cubit.onAddFriendsPressed,
            ),
            if (state.friends.isNotEmpty) ...[
              // Build friends avatars
            ],
            const SizedBox(height: 10),
            ElevatedButton.icon(
              icon: Icon(Icons.add),
              label: Text('Products'),
              onPressed: cubit.onAddProductPressed,
            ),
            if (state.items.isNotEmpty) ...[
              // Build items
              ...state.items.map<Widget>(
                (e) => Container(
                  padding: EdgeInsets.symmetric(vertical: 5),
                  child: PaymentItemDetails.variant1(
                    details: e,
                    onDelete: () => cubit.onDelete(e),
                  ),
                ),
              )
            ]
          ],
        ),
      ),
      bottomSheet: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        height: 110,
        child: Row(
          children: [
            Expanded(
              child: ElevatedButton(
                child: Text('Create Payment'),
                onPressed: cubit.onSubmit,
              ),
            ),
          ],
        ),
      ),
    );
  }

  static void register() {
    DependencyProvider.container
        .registerFactoryParam<CreatePaymentScreen, CreatePaymentParams, void>(
            (param1, param2) => CreatePaymentScreen(params: param1));
    DependencyProvider.registerFactory<CreatePaymentCubit>(
      () => CreatePaymentCubit(
        CreatePaymentState(),
        navigationProvider: DependencyProvider.get<NavigationProvider>(),
      ),
    );
  }
}
