class PaymentItem {
  final String id;
  final String name;
  final int quantity;
  final double price;

  const PaymentItem({
    required this.id,
    required this.name,
    required this.quantity,
    required this.price,
  });

  double get total => price * quantity;
}
