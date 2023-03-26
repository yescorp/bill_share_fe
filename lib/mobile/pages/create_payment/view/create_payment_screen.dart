import 'package:bill_share/di/dependency_injection.dart';
import 'package:bill_share/common/base_screen.dart';
import 'package:bill_share/mobile/pages/create_payment/view/create_payment_cubit.dart';
import 'package:bill_share/mobile/pages/create_payment/view/create_payment_state.dart';
import 'package:bill_share/mobile/pages/create_payment/view/create_payment_screen_params.dart';
import 'package:bill_share/services/navigation/api/navigation_provider.dart';
import 'package:flutter/material.dart';

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
            color: Colors.white,
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
                    color: Color(0xFF858585),
                  ),
                ),
              ),
            ),
            DropdownButton(
              value: state.selectedCategory,
              items: cubit.categories
                  .map<DropdownMenuItem<String>>(
                      (e) => DropdownMenuItem<String>(
                            value: e,
                            child: Text(e),
                          ))
                  .toList(),
              onChanged: cubit.onCategoryChange,
            ),
            DropdownButton(
              value: state.selectedPaymentType,
              items: cubit.paymentTypes
                  .map<DropdownMenuItem<String>>(
                      (e) => DropdownMenuItem<String>(
                            value: e,
                            child: Text(e),
                          ))
                  .toList(),
              onChanged: cubit.onPaymentTypeChange,
            ),
            ElevatedButton.icon(
              icon: Icon(Icons.add),
              label: Text('Friends'),
              onPressed: cubit.onAddFriendsPressed,
            ),
            if (state.friends.isNotEmpty) ...[
              // Build friends avatars
            ],
            ElevatedButton.icon(
              icon: Icon(Icons.add),
              label: Text('Products'),
              onPressed: cubit.onAddFriendsPressed,
            ),
            if (state.items.isNotEmpty) ...[
              // Build items
            ]
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
