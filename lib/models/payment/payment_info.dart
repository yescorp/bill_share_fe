import 'package:bill_share/models/payment/payment_category.dart';
import 'package:bill_share/models/payment/payment_item.dart';
import 'package:bill_share/models/payment/payment_type.dart';
import 'package:bill_share/models/user/friend_info.dart';
import 'package:bill_share/models/user/user_info.dart';

class PaymentInfo {
  final String id;
  final String name;
  final PaymentCategory category;
  final PaymentType type;
  final List<PaymentItem> items;
  List<String> selectedItemIds;
  final List<FriendInfo> participants;
  final FriendInfo creator;
  final double service;
  final double taxes;
  final Map<String, double>? additional;

  PaymentInfo({
    required this.id,
    required this.name,
    required this.type,
    required this.category,
    required this.items,
    required this.selectedItemIds,
    required this.participants,
    required this.creator,
    this.service = 0,
    this.taxes = 0,
    this.additional,
  });

  double get totalPrice =>
      items
          .map((e) => e.price * e.quantity)
          .reduce((value, element) => value + element) *
      (service + 1) *
      (taxes + 1);

  double get paidPrice => selectedItemIds.isNotEmpty
      ? items
              .where((element) => selectedItemIds.contains(element.id))
              .map((e) => e.price * e.quantity)
              .reduce((value, element) => value + element) *
          (service + 1) *
          (taxes + 1)
      : 0;
}
