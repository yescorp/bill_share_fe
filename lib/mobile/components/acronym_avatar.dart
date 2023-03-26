import 'package:flutter/cupertino.dart';

import '../../styles/colors.dart';

class AcronymAvatar extends StatelessWidget {
  final String name;
  final Color? borderColor;
  final double? heightWidth;

  const AcronymAvatar({
    super.key,
    required this.name,
    this.borderColor,
    this.heightWidth,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(5),
      width: heightWidth,
      height: heightWidth,
      decoration: BoxDecoration(
        border: Border.all(
          color: borderColor ?? AppColors.grey1,
        ),
        color: AppColors.randomAvatar,
        borderRadius: BorderRadius.all(Radius.circular((heightWidth ?? 0) / 2)),
      ),
      child: Center(
        child: Text(
          acronym,
          style: const TextStyle(
            color: AppColors.white,
          ),
        ),
      ),
    );
  }

  String get acronym => name.replaceAll(' ', '').substring(0, 2).toUpperCase();
}
