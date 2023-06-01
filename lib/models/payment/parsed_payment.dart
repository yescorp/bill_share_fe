import 'package:bill_share/models/payment/payment_item.dart';

class ParsedPayment {
  final String? sellerName;
  final List<PaymentItem> items;
  final bool service;
  final bool taxes;
  final Map<String, double>? additional;

  const ParsedPayment({
    required this.items,
    this.service = false,
    this.taxes = false,
    this.additional,
    this.sellerName,
  });
}
