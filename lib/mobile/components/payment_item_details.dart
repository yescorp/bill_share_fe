import 'package:bill_share/di/dependency_injection.dart';
import 'package:bill_share/models/payment/payment_item.dart';
import 'package:bill_share/styles/colors.dart';
import 'package:bill_share/styles/text_styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

abstract class PaymentItemDetails extends StatelessWidget {
  final PaymentItem details;
  final VoidCallback? onDelete;

  const PaymentItemDetails({
    super.key,
    required this.details,
    this.onDelete,
  });

  factory PaymentItemDetails.variant1({
    Key? key,
    required PaymentItem details,
    VoidCallback? onDelete,
  }) =>
      PaymentItemDetails1(
        key: key,
        details: details,
        onDelete: onDelete,
      );
}

class PaymentItemDetails1 extends PaymentItemDetails {
  const PaymentItemDetails1({
    super.key,
    required super.details,
    super.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.grey1),
        color: AppColors.white,
        borderRadius: const BorderRadius.all(
          Radius.circular(10),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 5),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: Text(
                    details.name,
                    style: const TextStyle(
                      fontSize: FontSizes.h2,
                    ),
                  ),
                ),
                IconButton(
                  onPressed: onDelete,
                  icon: const Icon(
                    Icons.delete_forever,
                    color: AppColors.deleteRed,
                    size: 28,
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Text(
                  '${details.price} ${tenge}',
                  style: const TextStyle(
                    fontSize: FontSizes.h3,
                  ),
                ),
                Expanded(
                  child: Text(
                    '${details.quantity}x',
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: FontSizes.h3,
                    ),
                  ),
                ),
                Text(
                  '${details.total} $tenge',
                  style: const TextStyle(
                    fontSize: FontSizes.h3,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
