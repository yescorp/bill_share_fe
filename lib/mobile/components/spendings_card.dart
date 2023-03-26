import 'package:bill_share/models/spendings/spendings_details.dart';
import 'package:bill_share/styles/colors.dart';
import 'package:bill_share/styles/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:intl/intl.dart';
import 'dart:math' as math;

class SpendingsCard extends StatelessWidget {
  final SpendingsDetails? details;

  const SpendingsCard({
    super.key,
    this.details,
  });

  @override
  Widget build(BuildContext context) {
    if (details == null) {
      return Container();
    }
    return Container(
      padding: EdgeInsets.all(20),
      decoration: const BoxDecoration(
        color: AppColors.mainPurple,
        borderRadius: BorderRadius.all(
          Radius.circular(20),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            DateFormat.MMMM().format(details!.month).toString(),
            textAlign: TextAlign.start,
            style: TextStyle(
              fontSize: FontSizes.h2,
              color: AppColors.white,
            ),
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              Expanded(
                child: Text(
                  'T ${details!.totalSpendings}',
                  style: TextStyle(
                    color: AppColors.white,
                    fontSize: FontSizes.h1,
                  ),
                ),
              ),
              Transform.rotate(
                angle: -math.pi / 2,
                child: const Icon(
                  Icons.sort,
                  color: AppColors.white,
                  size: 30,
                ),
              ),
            ],
          ),
          Row(
            children: [
              Expanded(
                child: Stack(
                  children: [
                    Divider(
                      height: 10,
                      thickness: 5,
                      color: AppColors.white.withAlpha(100),
                    ),
                    Divider(
                      height: 10,
                      thickness: 5,
                      endIndent: MediaQuery.of(context).size.width *
                          (details!.limit - details!.totalSpendings) /
                          details!.limit,
                      color: AppColors.white,
                    )
                  ],
                ),
              ),
              const SizedBox(width: 10),
              Text(
                '${details!.totalSpendings * 100 / details!.limit} %',
                style: const TextStyle(
                  color: AppColors.white,
                  fontSize: FontSizes.h3,
                ),
              ),
            ],
          ),
          Row(
            children: [
              Text(
                'Left to limit: T ${details!.limit - details!.totalSpendings}',
                style: TextStyle(
                  color: AppColors.white.withAlpha(200),
                  fontSize: FontSizes.h3,
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
