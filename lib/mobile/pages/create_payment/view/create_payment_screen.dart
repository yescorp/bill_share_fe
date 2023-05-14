import 'package:bill_share/di/dependency_injection.dart';
import 'package:bill_share/common/base_screen.dart';
import 'package:bill_share/mobile/components/dot_separated_list_tile.dart';
import 'package:bill_share/mobile/components/payment_item_details.dart';
import 'package:bill_share/mobile/pages/create_payment/view/create_payment_cubit.dart';
import 'package:bill_share/mobile/pages/create_payment/view/create_payment_state.dart';
import 'package:bill_share/mobile/pages/create_payment/view/create_payment_screen_params.dart';
import 'package:bill_share/models/payment/payment_category.dart';
import 'package:bill_share/services/mappers/payment_info.dart';
import 'package:bill_share/services/navigation/api/navigation_provider.dart';
import 'package:bill_share/styles/text_styles.dart';
import 'package:bill_share/swagger_generated_code/bill_share.swagger.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import '../../../../services/accessors/current_user_accessor.dart';
import '../../../../styles/colors.dart';
import '../../../components/acronym_avatar.dart';

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
  void initCubit(CreatePaymentCubit cubit, BuildContext context) {
    cubit.initialize(context, params);
    super.initCubit(cubit, context);
  }

  @override
  Widget buildPage(context, cubit, state) {
    return Scaffold(
      backgroundColor: AppColors.background,
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
        padding: EdgeInsets.only(right: 20, left: 20, top: 20, bottom: 150),
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
              controller: cubit.paymentNameController,
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
                child: DropdownButton<PaymentCategory>(
                  hint: Text('Category'),
                  value: state.selectedCategory,
                  isExpanded: true,
                  items: state.categories
                      .map<DropdownMenuItem<PaymentCategory>>(
                        (e) => DropdownMenuItem<PaymentCategory>(
                          value: e,
                          child: Text(e.name),
                        ),
                      )
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
                child: DropdownButton<ExpenseTypeId>(
                  iconEnabledColor: AppColors.grey1,
                  value: state.selectedPaymentType,
                  hint: Text('Payment type'),
                  isExpanded: true,
                  items: cubit.paymentTypes
                      .map<DropdownMenuItem<ExpenseTypeId>>(
                        (e) => DropdownMenuItem<ExpenseTypeId>(
                          value: e,
                          child: Text(e.name),
                        ),
                      )
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
              Container(
                height: 40,
                child: ListView(
                  reverse: true,
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  children: [
                    ...state.friends.map<Widget>(
                      (e) => Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 1.0),
                        child: AcronymAvatar(
                          name: e.userName,
                          heightWidth: 40,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
            const SizedBox(height: 10),
            ElevatedButton.icon(
              icon: Icon(Icons.add),
              label: Text('Products'),
              onPressed: cubit.onAddProductPressed,
            ),
            if (state.items.isNotEmpty) ...[
              ...state.items.map<Widget>(
                (e) => Container(
                  padding: EdgeInsets.symmetric(vertical: 5),
                  child: PaymentItemDetails.variant1(
                    details: e,
                    onDelete: () => cubit.onDelete(e),
                  ),
                ),
              )
            ],
          ],
        ),
      ),
      bottomSheet: Container(
        color: AppColors.background,
        padding:
            const EdgeInsets.only(right: 20, left: 20, bottom: 20, top: 10),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                const Expanded(
                  child: DotSeparatedListTile(
                    label: 'Service',
                    value: '10%',
                    style: TextStyle(fontSize: FontSizes.h3),
                  ),
                ),
                Checkbox(
                  value: state.isServiceEnabled,
                  onChanged: cubit.onServiceToggle,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                const Expanded(
                  child: DotSeparatedListTile(
                    label: 'Taxes',
                    value: '12%',
                    style: TextStyle(fontSize: FontSizes.h3),
                  ),
                ),
                Checkbox(
                  value: state.isTaxesEnabled,
                  onChanged: cubit.onTaxesToggle,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    child: Text('Create Payment'),
                    onPressed: cubit.onSubmit,
                  ),
                ),
              ],
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
        client: DependencyProvider.get<BillShare>(),
        userAccessor: DependencyProvider.get<CurrentUserAccessor>(),
        paymentInfoMapper: DependencyProvider.get<PaymentInfoMapper>(),
      ),
    );
  }
}
