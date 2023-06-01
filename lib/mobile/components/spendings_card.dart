import 'package:bill_share/models/spendings/spendings_details.dart';
import 'package:bill_share/styles/colors.dart';
import 'package:bill_share/styles/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:intl/intl.dart';
import 'dart:math' as math;

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../di/dependency_injection.dart';

class SpendingsCard extends StatelessWidget {
  final SpendingsDetails? details;

  const SpendingsCard({
    super.key,
    this.details,
  });

  @override
  Widget build(BuildContext context) {
    final l = AppLocalizations.of(context);

    if (details == null) {
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
              DateFormat.MMMM().format(DateTime.now()).toString(),
              textAlign: TextAlign.start,
              style: const TextStyle(
                fontSize: FontSizes.h2,
                color: AppColors.white,
              ),
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                const Expanded(
                  child: Text(
                    'Loading...',
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
                      const Divider(
                        height: 10,
                        thickness: 5,
                        color: AppColors.white,
                      )
                    ],
                  ),
                ),
                const SizedBox(width: 10),
                const Text(
                  '... %',
                  style: TextStyle(
                    color: AppColors.white,
                    fontSize: FontSizes.h3,
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Text(
                  l.dashboard_2,
                  style: TextStyle(
                    color: AppColors.white.withAlpha(200),
                    fontSize: FontSizes.h3,
                  ),
                )
              ],
            ),
          ],
        ),
      );
    }
    return Container(
      padding: const EdgeInsets.all(20),
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
            style: const TextStyle(
              fontSize: FontSizes.h2,
              color: AppColors.white,
            ),
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              Expanded(
                child: Text(
                  '${details!.totalSpendings} $tenge',
                  style: const TextStyle(
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
                      endIndent: getEndIndent(context),
                      color: AppColors.white,
                    )
                  ],
                ),
              ),
              const SizedBox(width: 10),
              Text(
                '${getPercent()} %',
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
                '${AppLocalizations.of(context).dashboard_2}: ${details!.limit - details!.totalSpendings} $tenge',
                style: TextStyle(
                  color: AppColors.white.withAlpha(200),
                  fontSize: FontSizes.h3,
                ),
              )
            ],
          ),
        ],
      ),
    );
  }

  double getEndIndent(BuildContext context) {
    if (details!.limit == 0) {
      return 1;
    }

    final indent = (MediaQuery.of(context).size.width / 1.8) *
        (details!.limit - details!.totalSpendings) /
        details!.limit;
    if (indent < 0) {
      return 0;
    }

    return indent;
  }

  double getPercent() {
    if (details!.limit == 0) {
      return 100;
    }

    return details!.totalSpendings * 100 / details!.limit;
  }
}
