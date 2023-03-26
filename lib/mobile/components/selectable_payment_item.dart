import 'package:bill_share/mobile/components/acronym_avatar.dart';
import 'package:bill_share/models/payment/payment_item.dart';
import 'package:bill_share/models/user/friend_info.dart';
import 'package:bill_share/styles/colors.dart';
import 'package:bill_share/styles/text_styles.dart';
import 'package:flutter/material.dart';

class SelectablePaymentItem extends StatelessWidget {
  final PaymentItem item;
  final bool isSelected;
  final List<FriendInfo> selectedBy;
  final VoidCallback? onTap;

  const SelectablePaymentItem({
    super.key,
    required this.item,
    required this.isSelected,
    required this.selectedBy,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final textColor = isSelected ? AppColors.white : AppColors.grey2;
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(12),
        color: isSelected ? AppColors.mainBlue : AppColors.white,
        child: Column(
          children: [
            Row(
              children: [
                Text(
                  item.name,
                  style: TextStyle(
                    color: textColor,
                    fontSize: FontSizes.h3,
                  ),
                ),
                const SizedBox(width: 10),
                isSelected
                    ? const Icon(
                        Icons.check_circle_outline,
                        color: AppColors.white,
                      )
                    : Container(),
              ],
            ),
            Row(
              children: [
                Expanded(
                  flex: 2,
                  child: Text(
                    '${item.price} T',
                    style: TextStyle(
                      color: textColor,
                      fontSize: FontSizes.p1,
                    ),
                  ),
                ),
                Expanded(
                  child: Text(
                    'x ${item.quantity}',
                    style: TextStyle(
                      color: textColor,
                      fontSize: FontSizes.p1,
                    ),
                  ),
                ),
                const Expanded(child: SizedBox(width: 0)),
                Text(
                  '${item.total} T',
                  style: TextStyle(
                    color: textColor,
                    fontSize: FontSizes.h3,
                  ),
                ),
              ],
            ),
            if (selectedBy.isNotEmpty) ...[
              Divider(
                color: textColor,
              ),
              Row(
                children: [
                  ...selectedBy.map(
                    (e) => AcronymAvatar(
                      name: e.name,
                      heightWidth: 40,
                    ),
                  ),
                ],
              ),
            ],
          ],
        ),
      ),
    );
  }
}
