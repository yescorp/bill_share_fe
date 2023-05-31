import 'package:bill_share/services/maps/user_id_color.dart';
import 'package:flutter/cupertino.dart';

import '../../styles/colors.dart';

class AcronymAvatar extends StatelessWidget {
  final String name;
  final String userId;
  final Color? borderColor;
  final double? heightWidth;
  final TextStyle? style;

  const AcronymAvatar({
    super.key,
    required this.name,
    required this.userId,
    this.borderColor,
    this.heightWidth,
    this.style,
  });

  @override
  Widget build(BuildContext context) {
    if (userIdColor[userId] == null) {
      userIdColor[userId] = AppColors.randomAvatar;
    }

    return Container(
      padding: EdgeInsets.all(5),
      width: heightWidth,
      height: heightWidth,
      decoration: BoxDecoration(
        border: Border.all(
          color: borderColor ?? AppColors.grey1,
        ),
        color: userIdColor[userId],
        borderRadius: BorderRadius.all(Radius.circular((heightWidth ?? 0) / 2)),
      ),
      child: Center(
        child: Text(
          acronym,
          style: style ??
              const TextStyle(
                color: AppColors.white,
              ),
        ),
      ),
    );
  }

  String get acronym => name.replaceAll(' ', '').substring(0, 2).toUpperCase();
}
