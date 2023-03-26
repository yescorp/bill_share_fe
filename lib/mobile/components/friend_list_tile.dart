import 'package:bill_share/mobile/components/acronym_avatar.dart';
import 'package:bill_share/models/user/friend_info.dart';
import 'package:bill_share/styles/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

abstract class FriendListTile extends StatelessWidget {
  final FriendInfo info;
  final bool checked;
  final void Function(bool?)? onTap;

  const FriendListTile({
    super.key,
    required this.info,
    this.onTap,
    this.checked = false,
  });

  factory FriendListTile.select({
    Key? key,
    required FriendInfo info,
    bool checked = false,
    void Function(bool?)? onTap,
  }) =>
      FriendListTileSelect(
        key: key,
        info: info,
        onTap: onTap,
        checked: checked,
      );
}

class FriendListTileSelect extends FriendListTile {
  const FriendListTileSelect({
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
            name: info.name,
            heightWidth: 40,
          ),
          title: Text(
            info.name,
            style: const TextStyle(
              fontSize: FontSizes.h3,
            ),
          ),
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
