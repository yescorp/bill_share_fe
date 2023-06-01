import 'package:bill_share/mobile/pages/select_items/view/select_items_screen_params.dart';
import 'package:bill_share/mobile/pages/select_items/view/select_items_state.dart';
import 'package:bill_share/models/payment/payment_item.dart';
import 'package:bill_share/models/user/payment_participant.dart';
import 'package:bill_share/services/mappers/payment_info.dart';
import 'package:bill_share/services/navigation/api/navigation_provider.dart';
import 'package:bill_share/swagger_generated_code/bill_share.swagger.dart';
import 'package:bloc/bloc.dart';

class SelectItemsCubit extends BlocBase<SelectItemsState> {
  final NavigationProvider navigationProvider;
  final BillShare client;
  final PaymentInfoMapper paymentMapper;

  SelectItemsCubit(
    super.state, {
    required this.navigationProvider,
    required this.client,
    required this.paymentMapper,
  });

  void initialize(SelectItemsParams params) {
    if (params.details != null) {
      emit(
        state.copyWith(
          details: params.details,
          selectedItemIds: params.details?.selectedItemIds ?? [],
        ),
      );
    } else if (params.id != null) {
      paymentMapper
          .fetch(params.id!)
          .then(
            (value) => emit(
              state.copyWith(
                details: value,
                selectedItemIds: value.selectedItemIds,
              ),
            ),
          )
          .onError((error, stackTrace) => null);
    }
  }

  void onAddFriendPressed() {}

  void onSubmit() async {
    if (state.details == null) {
      return;
    }

    final unselectedItems = state.details!.items.where(
      (item) =>
          !state.selectedItemIds.any((selectedId) => selectedId == item.id),
    );

    for (final element in unselectedItems) {
      await client.expensesExpenseIdItemsItemIdUnselectPost(
        expenseId: state.details!.id,
        itemId: element.id,
      );
    }

    for (final element in state.selectedItemIds) {
      await client.expensesExpenseIdItemsItemIdSelectPost(
        expenseId: state.details!.id,
        itemId: element,
      );
    }

    initialize(SelectItemsParams(id: state.details!.id));

    navigationProvider.pop();
  }

  onItemTap(PaymentItem item) {
    final newList = <String>[...(state.selectedItemIds)];
    if (newList.contains(item.id)) {
      newList.remove(item.id);
      item.selectedBy.removeWhere(
        (e) =>
            e.participantId ==
            state.details!.currentUserParticipantInfo.participantId,
      );
    } else {
      item.selectedBy.add(state.details!.currentUserParticipantInfo);
      newList.add(item.id);
    }

    state.details!.selectedItemIds = newList;

    emit(state.copyWith(
      selectedItemIds: newList,
    ));
  }
}
