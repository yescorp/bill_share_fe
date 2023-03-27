import 'package:bill_share/mobile/pages/select_items/view/select_items_screen_params.dart';
import 'package:bill_share/mobile/pages/select_items/view/select_items_state.dart';
import 'package:bill_share/models/payment/payment_info.dart';
import 'package:bill_share/models/payment/payment_item.dart';
import 'package:bill_share/services/navigation/api/navigation_provider.dart';
import 'package:bloc/bloc.dart';
import 'package:graphic/graphic.dart';

class SelectItemsCubit extends BlocBase<SelectItemsState> {
  final NavigationProvider navigationProvider;

  SelectItemsCubit(
    super.state, {
    required this.navigationProvider,
  });

  void initialize(SelectItemsParams params) {
    if (params.details != null) {
      emit(
        state.copyWith(
          details: params.details,
        ),
      );
    } else {
      //...
    }
  }

  void onAddFriendPressed() {}

  void onSubmit() {}

  onItemTap(PaymentItem e) {
    print('Helo');

    final newList = <String>[...(state.details?.selectedItemIds ?? [])];
    if (newList.contains(e.id)) {
      newList.remove(e.id);
    } else {
      newList.add(e.id);
    }

    state.details!.selectedItemIds = newList;
    emit(state.copyWith(
      details: state.details,
    ));
  }
}
