import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class DotSeparatedListTile extends StatelessWidget {
  final String label;
  final String value;
  final TextStyle? style;

  const DotSeparatedListTile({
    super.key,
    required this.label,
    required this.value,
    this.style,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Text(
            label,
            softWrap: true,
            style: style,
          ),
        ),
        const SizedBox(width: 5),
        Expanded(
          child: Text(
            '.' * 100,
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
