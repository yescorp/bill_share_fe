import 'package:bill_share/models/payment/payment_item.dart';

class ParsedPayment {
  final String? sellerName;
  final List<PaymentItem> items;
  final double service;
  final double taxes;
  final Map<String, double>? additional;

  const ParsedPayment({
    required this.items,
    this.service = 0,
    this.taxes = 0,
    this.additional,
    this.sellerName,
  });
}
