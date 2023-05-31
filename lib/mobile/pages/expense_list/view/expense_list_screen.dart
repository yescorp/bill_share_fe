import 'package:bill_share/di/dependency_injection.dart';
import 'package:bill_share/common/base_screen.dart';
import 'package:bill_share/mobile/components/acronym_avatar.dart';
import 'package:bill_share/mobile/components/dot_separated_list_tile.dart';
import 'package:bill_share/mobile/components/wavy_container/wavy_container.dart';
import 'package:bill_share/mobile/pages/expense_list/view/expense_list_cubit.dart';
import 'package:bill_share/mobile/pages/expense_list/view/expense_list_state.dart';
import 'package:bill_share/models/payment/payment_info.dart';
import 'package:bill_share/services/mappers/payment_info.dart';
import 'package:bill_share/services/navigation/api/navigation_provider.dart';
import 'package:bill_share/styles/colors.dart';
import 'package:bill_share/styles/text_styles.dart';
import 'package:bill_share/swagger_generated_code/bill_share.swagger.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ExpenseListScreen
    extends AbstractScreen<ExpenseListState, ExpenseListCubit> {
  const ExpenseListScreen({super.key});

  @override
  ExpenseListCubit createCubit() {
    return DependencyProvider.get<ExpenseListCubit>();
  }

  @override
  void initCubit(ExpenseListCubit cubit, context) {
    cubit.initialize();
    super.initCubit(cubit, context);
  }

  @override
  Widget buildPage(context, cubit, state) {
    final l = AppLocalizations.of(context);

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: Text(l.expenseList_1),
        actions: [
          IconButton(
            onPressed: cubit.onQrIconPressed,
            icon: const Icon(
              Icons.qr_code_scanner,
              color: AppColors.white,
            ),
          ),
          IconButton(
            onPressed: cubit.onAddExpensePressed,
            icon: const Icon(
              Icons.add,
              color: AppColors.white,
            ),
          ),
        ],
      ),
      body: FutureBuilder(
        future: cubit.getExpensesCount(),
        builder: (
          BuildContext context,
          AsyncSnapshot<int> snapshot,
        ) {
          if (!snapshot.hasData) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (snapshot.data == 0) {
            return Center(
              child: Text(l.expenseList_6),
            );
          }
          return ListView.builder(
            itemCount: snapshot.data,
            shrinkWrap: true,
            itemBuilder: (context, index) => FutureBuilder(
              future: cubit.getExpenses(index),
              builder: (
                context,
                AsyncSnapshot<List<PaymentInfo>> snapshot,
              ) {
                if (!snapshot.hasData) {
                  return Container();
                }

                if (snapshot.hasError) {
                  return Container();
                }

                // ignore: prefer_is_empty
                if (snapshot.data?.length == 0) {
                  return Container();
                }

                final expense = snapshot.data![index % cubit.pageSize];

                return Padding(
                  padding: const EdgeInsets.only(bottom: 20.0),
                  child: InkWell(
                    onTap: () => cubit.onExpenseTap(expense.id),
                    onDoubleTap: () => cubit.onExpenseDoubleTap(expense.id),
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
                                      expense.type,
                                    ),
                                  ),
                                  const SizedBox(width: 20),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          expense.name,
                                          textAlign: TextAlign.start,
                                          style: const TextStyle(
                                            fontSize: FontSizes.h3,
                                          ),
                                        ),
                                        const SizedBox(height: 10),
                                        if (state.openedExpenses
                                                .contains(expense.id) &&
                                            expense.items.isNotEmpty) ...[
                                          ...expense.items.map(
                                            (e) => Padding(
                                              padding:
                                                  EdgeInsets.only(bottom: 5),
                                              child: DotSeparatedListTile(
                                                label: e.name,
                                                value:
                                                    '${e.price} x ${e.quantity}',
                                                style: const TextStyle(
                                                  fontSize: FontSizes.p1,
                                                ),
                                              ),
                                            ),
                                          ),
                                          DotSeparatedListTile(
                                            label: l.expenseList_4,
                                            value:
                                                '${expense.service - 100 < 0 ? 0 : expense.service - 100} %',
                                          ),
                                          DotSeparatedListTile(
                                            label: l.expenseList_5,
                                            value:
                                                '${expense.taxes - 100 < 0 ? 0 : expense.taxes - 100} %',
                                          ),
                                          const SizedBox(height: 20),
                                        ],
                                        DotSeparatedListTile(
                                          label: l.expenseList_2,
                                          value: '${expense.totalPrice}',
                                          style: const TextStyle(
                                            fontSize: FontSizes.p1,
                                          ),
                                        ),
                                        DotSeparatedListTile(
                                          label: l.expenseList_3,
                                          value: '${expense.paidPrice}',
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
                                  ...expense.participants.map(
                                    (e) => Padding(
                                      padding: const EdgeInsets.only(left: 4.0),
                                      child: AcronymAvatar(
                                        name: e.info.userName,
                                        userId: e.info.userId,
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
        client: DependencyProvider.get<BillShare>(),
        paymentMapper: DependencyProvider.get<PaymentInfoMapper>(),
      ),
    );
  }
}
