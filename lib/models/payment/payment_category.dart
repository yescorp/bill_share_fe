import 'package:flutter/material.dart';

class PaymentCategory {
  final String name;
  final String id;
  Color color;

  PaymentCategory({
    required this.id,
    required this.name,
    this.color = Colors.blue,
  });
}
