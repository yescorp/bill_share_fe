import 'package:bill_share/models/payment/payment_category.dart';
import 'package:bill_share/models/payment/payment_item.dart';
import 'package:bill_share/models/payment/payment_type.dart';
import 'package:bill_share/models/user/friend_info.dart';
import 'package:bill_share/models/user/payment_participant.dart';
import 'package:bill_share/models/user/user_info.dart';
import 'package:bill_share/swagger_generated_code/bill_share.swagger.dart';

class PaymentInfo {
  final String id;
  final String name;
  final PaymentCategory category;
  final PaymentType type;
  final List<PaymentItem> items;
  List<String> selectedItemIds;
  final List<PaymentParticipant> participants;
  final PaymentParticipant currentUserParticipantInfo;
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
    required this.currentUserParticipantInfo,
  });

  double get totalPrice {
    double sum = items
        .map((e) => e.price * e.quantity)
        .reduce((value, element) => value + element);

    if (service != 0) {
      sum += sum * (service - 100) / 100;
    }

    if (taxes != 0) {
      sum += sum * (taxes - 100) / 100;
    }

    return sum;
  }

  double get paidPrice {
    double sum = selectedItemIds.isNotEmpty
        ? items
            .where((element) => selectedItemIds.contains(element.id))
            .map((e) =>
                e.price *
                e.quantity /
                (e.selectedBy.isEmpty ? 1 : e.selectedBy.length))
            .reduce((value, element) => value + element)
        : 0;

    if (service != 0) {
      sum += sum * (service - 100) / 100;
    }

    if (taxes != 0) {
      sum += sum * (taxes - 100) / 100;
    }

    return sum;
  }
}
