import 'package:bill_share/di/dependency_injection.dart';
import 'package:bill_share/common/base_screen.dart';
import 'package:bill_share/mobile/components/acronym_avatar.dart';
import 'package:bill_share/mobile/components/dot_separated_list_tile.dart';
import 'package:bill_share/mobile/components/wavy_container/wavy_container.dart';
import 'package:bill_share/mobile/pages/expense_list/view/expense_list_cubit.dart';
import 'package:bill_share/mobile/pages/expense_list/view/expense_list_state.dart';
import 'package:bill_share/services/navigation/api/navigation_provider.dart';
import 'package:bill_share/styles/colors.dart';
import 'package:bill_share/styles/text_styles.dart';
import 'package:flutter/material.dart';

class ExpenseListScreen
    extends AbstractScreen<ExpenseListState, ExpenseListCubit> {
  const ExpenseListScreen({super.key});

  @override
  ExpenseListCubit createCubit() {
    return DependencyProvider.get<ExpenseListCubit>();
  }

  @override
  void initCubit(ExpenseListCubit cubit) {
    cubit.initialize();
    super.initCubit(cubit);
  }

  @override
  Widget buildPage(context, cubit, state) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: Text('Expenses'),
      ),
      body: ListView.builder(
        itemCount: state.details.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 20.0),
            child: InkWell(
              onTap: () => cubit.onExpenseTap(index),
              onDoubleTap: () => cubit.onExpenseDoubleTap(index),
              child: WavyContainer(
                container: Container(
                    color: AppColors.white,
                    padding: EdgeInsets.all(20),
                    child: Column(
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Icon(
                              Icons.circle,
                              size: 40,
                              color: AppColors.colorForType(
                                  state.details[index].type),
                            ),
                            const SizedBox(width: 20),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    state.details[index].name,
                                    textAlign: TextAlign.start,
                                    style: const TextStyle(
                                      fontSize: FontSizes.h3,
                                    ),
                                  ),
                                  const SizedBox(height: 10),
                                  if (state.openedExpenses
                                          .contains(state.details[index].id) &&
                                      state
                                          .details[index].items.isNotEmpty) ...[
                                    ...state.details[index].items.map(
                                      (e) => DotSeparatedListTile(
                                        label: e.name,
                                        value: '${e.price} x ${e.quantity}',
                                        style: const TextStyle(
                                          fontSize: FontSizes.p1,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(height: 20),
                                  ],
                                  DotSeparatedListTile(
                                    label: 'Total',
                                    value: '${state.details[index].totalPrice}',
                                    style: const TextStyle(
                                      fontSize: FontSizes.p1,
                                    ),
                                  ),
                                  DotSeparatedListTile(
                                    label: 'Paid',
                                    value: '${state.details[index].paidPrice}',
                                    style: const TextStyle(
                                      fontSize: FontSizes.p1,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            ...state.details[index].participants.map(
                              (e) => Padding(
                                padding: const EdgeInsets.only(left: 4.0),
                                child: AcronymAvatar(
                                  name: e.name,
                                  heightWidth: 40,
                                ),
                              ),
                            ),
                          ],
                        )
                      ],
                    )),
              ),
            ),
          );
        },
      ),
    );
  }

  static void register() {
    DependencyProvider.registerFactory<ExpenseListScreen>(
        () => const ExpenseListScreen());
    DependencyProvider.registerFactory<ExpenseListCubit>(
      () => ExpenseListCubit(
        ExpenseListState(),
        navigationProvider: DependencyProvider.get<NavigationProvider>(),
      ),
    );
  }
}
