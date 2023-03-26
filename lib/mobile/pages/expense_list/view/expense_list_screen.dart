import 'package:bill_share/di/dependency_injection.dart';
import 'package:bill_share/common/base_screen.dart';
import 'package:bill_share/mobile/components/wavy_container/wavy_container.dart';
import 'package:bill_share/mobile/pages/expense_list/view/expense_list_cubit.dart';
import 'package:bill_share/mobile/pages/expense_list/view/expense_list_state.dart';
import 'package:bill_share/services/navigation/api/navigation_provider.dart';
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
      appBar: AppBar(
        title: Text('Expenses'),
      ),
      body: ListView.builder(
        itemCount: state.details.length,
        itemBuilder: (context, index) {
          return WavyContainer(
            container: Container(
                padding: EdgeInsets.all(8),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Icon(Icons.circle),
                        Column(
                          children: [
                            Text(state.details[index].name),
                            Text('${state.details[index].totalPrice}'),
                            Text('${state.details[index].paidPrice}'),
                          ],
                        ),
                      ],
                    ),
                    Row(
                      children: [],
                    )
                  ],
                )),
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
