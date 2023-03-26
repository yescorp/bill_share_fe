import 'package:bill_share/mobile/pages/select_items/view/select_items_screen_params.dart';
import 'package:bill_share/mobile/pages/select_items/view/select_items_state.dart';
import 'package:bill_share/services/navigation/api/navigation_provider.dart';
import 'package:bloc/bloc.dart';

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

  void onAddFriendPressed() {
  }
}
