import 'package:bill_share/models/spendings/spendings_details.dart';
import 'package:flutter/material.dart';
import 'package:graphic/graphic.dart';

import '../../models/payment/payment_category.dart';

class CategoriesChart extends StatelessWidget {
  final SpendingsDetails details;
  final double width;
  const CategoriesChart({
    super.key,
    required this.details,
    required this.width,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          height: width,
          width: width,
          child: Chart<MapEntry<PaymentCategory, double>>(
            elements: [
              IntervalElement(
                modifiers: [StackModifier()],
                label: LabelAttr(
                  encoder: (tuple) => Label(
                    '${((tuple['percent'] as num) * 100)} %',
                    LabelStyle(
                      style: Defaults.runeStyle.copyWith(
                        fontSize: 14,
                      ),
                      align: Alignment.center,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                color: ColorAttr(
                  encoder: (map) => Color(map['color'] as int),
                ),
                position: Varset('percent') / Varset('category'),
              ),
            ],
            coord: PolarCoord(
              transposed: true,
              dimCount: 1,
            ),
            data: details.spendingCategories.entries.toList(),
            variables: {
              'category': Variable(
                accessor: (entry) => entry.key.name,
              ),
              'total': Variable(
                accessor: (entry) => entry.value,
                scale: LinearScale(min: 0),
              ),
              'color': Variable(
                accessor: (entry) => entry.key.color.value,
              )
            },
            transforms: [
              Proportion(variable: 'total', as: 'percent'),
            ],
          ),
        ),
        Expanded(
          child: ListView.builder(
            itemExtent: 40,
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: details.spendingCategories.length,
            itemBuilder: (context, index) {
              final categories = details.spendingCategories.keys.toList();
              return ListTile(
                leading: Icon(
                  Icons.rectangle_rounded,
                  color: categories[index].color,
                ),
                title: Text(categories[index].name),
              );
            },
          ),
        )
      ],
    );
  }
}
