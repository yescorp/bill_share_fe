import 'package:bill_share/mobile/components/acronym_avatar.dart';
import 'package:bill_share/models/group/group_info.dart';
import 'package:flutter/material.dart';

import '../../styles/text_styles.dart';

abstract class GroupListTile extends StatelessWidget {
  final GroupInfo info;
  final bool checked;
  final void Function(bool?)? onTap;

  const GroupListTile({
    super.key,
    required this.info,
    this.onTap,
    this.checked = false,
  });

  factory GroupListTile.select({
    Key? key,
    required GroupInfo info,
    bool checked = false,
    void Function(bool?)? onTap,
  }) =>
      GroupListTileSelect(
        key: key,
        info: info,
        onTap: onTap,
        checked: checked,
      );
}

class GroupListTileSelect extends GroupListTile {
  const GroupListTileSelect({
    super.key,
    required super.info,
    super.onTap,
    super.checked,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onTap?.call(!checked);
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListTile(
          leading: AcronymAvatar(
            name: info.groupName,
            heightWidth: 40,
          ),
          title: Text(
            info.groupName,
            style: const TextStyle(
              fontSize: FontSizes.h3,
            ),
          ),
          subtitle: Text('Members ${info.friends.length}'),
          trailing: Transform.scale(
            scale: 1.5,
            child: Checkbox(
              value: checked,
              onChanged: onTap,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
