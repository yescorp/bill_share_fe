import 'package:bill_share/models/user/payment_participant.dart';

class PaymentItem {
  final String id;
  final String name;
  final int quantity;
  final double price;
  late final List<PaymentParticipant> selectedBy;

  PaymentItem({
    required this.id,
    required this.name,
    required this.quantity,
    required this.price,
    List<PaymentParticipant>? selectedBy,
  }) {
    this.selectedBy = selectedBy ?? [];
  }

  double get total => price * quantity;
}
