import 'package:bill_share/di/dependency_injection.dart';
import 'package:bill_share/common/base_screen.dart';
import 'package:bill_share/mobile/components/acronym_avatar.dart';
import 'package:bill_share/mobile/components/dot_separated_list_tile.dart';
import 'package:bill_share/mobile/components/selectable_payment_item.dart';
import 'package:bill_share/mobile/pages/select_items/view/select_items_cubit.dart';
import 'package:bill_share/mobile/pages/select_items/view/select_items_state.dart';
import 'package:bill_share/mobile/pages/select_items/view/select_items_screen_params.dart';
import 'package:bill_share/services/navigation/api/navigation_provider.dart';
import 'package:bill_share/styles/colors.dart';
import 'package:bill_share/styles/text_styles.dart';
import 'package:flutter/material.dart';

class SelectItemsScreen
    extends AbstractScreen<SelectItemsState, SelectItemsCubit> {
  final SelectItemsParams params;

  const SelectItemsScreen({
    super.key,
    required this.params,
  });

  @override
  SelectItemsCubit createCubit() {
    return DependencyProvider.get<SelectItemsCubit>();
  }

  @override
  void initCubit(SelectItemsCubit cubit) {
    cubit.initialize(params);
    super.initCubit(cubit);
  }

  @override
  Widget buildPage(context, cubit, state) {
    if (state.details == null) {
      return Container();
    }
    final details = state.details!;

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: Text(details.name),
      ),
      body: Padding(
        padding: const EdgeInsets.only(bottom: 100.0),
        child: ListView(
          children: [
            const Padding(
              padding: EdgeInsets.all(12.0),
              child: Text(
                'Participants',
                style: TextStyle(
                  fontSize: FontSizes.h3,
                ),
              ),
            ),
            Container(
              color: AppColors.white,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    ...details.participants.map(
                      (e) => Padding(
                        padding: const EdgeInsets.only(left: 4.0),
                        child: AcronymAvatar(
                          name: e.name,
                          heightWidth: 40,
                        ),
                      ),
                    ),
                    const Expanded(child: SizedBox(width: 10)),
                    IconButton(
                      onPressed: cubit.onAddFriendPressed,
                      icon: const Icon(
                        Icons.group_add_outlined,
                        size: 26,
                      ),
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(height: 10),
            const Padding(
              padding: EdgeInsets.all(12.0),
              child: Text(
                'Items',
                style: TextStyle(
                  fontSize: FontSizes.h3,
                ),
              ),
            ),
            ...details.items.map(
              (e) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 5.0),
                  child: SelectablePaymentItem(
                    item: e,
                    isSelected: details.selectedItemIds.contains(e.id),
                    selectedBy: [details.participants.first],
                  ),
                );
              },
            ),
            const SizedBox(height: 20),
            const Padding(
              padding: EdgeInsets.only(left: 12.0),
              child: Text(
                'Additional',
                style: TextStyle(
                  fontSize: FontSizes.h3,
                ),
              ),
            ),
            const SizedBox(height: 5),
            Container(
              decoration: const BoxDecoration(
                color: AppColors.white,
                border: Border.symmetric(
                  horizontal: BorderSide(
                    color: AppColors.grey1,
                    width: 0.2,
                  ),
                ),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 12),
              child: Row(
                children: [
                  const Text(
                    'Service',
                    style: TextStyle(
                      fontSize: FontSizes.h3,
                    ),
                  ),
                  const Expanded(child: SizedBox(width: 0)),
                  Text(
                    '${details.service * 100} %',
                    style: const TextStyle(
                      fontSize: FontSizes.h3,
                    ),
                  )
                ],
              ),
            ),
            Container(
              decoration: const BoxDecoration(
                color: AppColors.white,
                border: Border.symmetric(
                  horizontal: BorderSide(
                    color: AppColors.grey1,
                    width: 0.5,
                  ),
                ),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 12),
              child: Row(
                children: [
                  const Text(
                    'Taxes',
                    style: TextStyle(
                      fontSize: FontSizes.h3,
                    ),
                  ),
                  const Expanded(child: SizedBox(width: 0)),
                  Text(
                    '${details.taxes * 100} %',
                    style: const TextStyle(
                      fontSize: FontSizes.h3,
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
      bottomSheet: Container(
        padding: EdgeInsets.only(bottom: 40),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              decoration: const BoxDecoration(
                color: AppColors.white,
                border: Border.symmetric(
                  horizontal: BorderSide(
                    color: AppColors.grey1,
                    width: 0.5,
                  ),
                ),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  DotSeparatedListTile(
                    label: 'Total cost',
                    value: '${details.totalPrice} T',
                    style: const TextStyle(fontSize: FontSizes.h3),
                  ),
                  DotSeparatedListTile(
                    label: 'Your items',
                    value: '${details.paidPrice} T',
                    style: const TextStyle(fontSize: FontSizes.h3),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: cubit.onSubmit,
                      child: const Text(
                        'Finish',
                        style: TextStyle(
                          fontSize: FontSizes.h3,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  static void register() {
    DependencyProvider.container
        .registerFactoryParam<SelectItemsScreen, SelectItemsParams, void>(
            (param1, param2) => SelectItemsScreen(params: param1));
    DependencyProvider.registerFactory<SelectItemsCubit>(
      () => SelectItemsCubit(
        SelectItemsState(),
        navigationProvider: DependencyProvider.get<NavigationProvider>(),
      ),
    );
  }
}
