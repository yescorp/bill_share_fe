import 'package:bill_share/mobile/pages/create_payment/view/create_payment_screen.dart';
import 'package:bill_share/models/payment/parsed_payment.dart';
import 'package:bill_share/services/navigation/api/screen_parameters.dart';

class CreatePaymentParams extends ScreenParams<CreatePaymentScreen> {
  final ParsedPayment? initialPaymentInfo;

  const CreatePaymentParams({
    this.initialPaymentInfo,
  });
}
