import 'package:bill_share/models/payment/payment_category.dart';

class SpendingsDetails {
  final DateTime month;
  final double totalSpendings;
  final double limit;
  final Map<PaymentCategory, double> spendingCategories;

  const SpendingsDetails({
    required this.month,
    required this.totalSpendings,
    required this.limit,
    required this.spendingCategories,
  });
}
