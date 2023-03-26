class PaymentItem {
  final String name;
  final int quantity;
  final double price;

  const PaymentItem({
    required this.name,
    required this.quantity,
    required this.price,
  });

  double get total => price * quantity;
}
