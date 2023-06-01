import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class DotSeparatedListTile extends StatelessWidget {
  final String label;
  final String value;
  final TextStyle? style;
  final double maxWidth;

  const DotSeparatedListTile({
    super.key,
    required this.label,
    required this.value,
    this.style,
    this.maxWidth = 170,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          constraints: BoxConstraints(
            maxWidth: maxWidth,
          ),
          child: Text(
            label,
            softWrap: true,
            style: style,
          ),
        ),
        const SizedBox(width: 5),
        Expanded(
          child: Text(
            '.' * 1000,
            overflow: TextOverflow.fade,
            softWrap: false,
          ),
        ),
        const SizedBox(width: 5),
        Text(
          value,
          style: style,
        ),
      ],
    );
  }
}
