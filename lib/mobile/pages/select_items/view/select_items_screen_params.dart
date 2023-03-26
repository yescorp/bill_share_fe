import 'package:bill_share/mobile/pages/select_items/view/select_items_screen.dart';
import 'package:bill_share/models/payment/payment_info.dart';
import 'package:bill_share/services/navigation/api/screen_parameters.dart';

class SelectItemsParams extends ScreenParams<SelectItemsScreen> {
  String? id;
  PaymentInfo? details;

  SelectItemsParams({
    this.id,
    this.details,
  });
}
