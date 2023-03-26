import 'package:bill_share/mobile/components/acronym_avatar.dart';
import 'package:bill_share/models/user/friend_info.dart';
import 'package:bill_share/styles/colors.dart';
import 'package:bill_share/styles/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

abstract class FriendListTile extends StatelessWidget {
  final FriendInfo info;

  const FriendListTile({
    super.key,
    required this.info,
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

  factory FriendListTile.view({
    Key? key,
    required FriendInfo info,
  }) =>
      FriendListTileSelect(
        key: key,
        info: info,
      );

  factory FriendListTile.request({
    Key? key,
    required FriendInfo info,
  }) =>
      FriendshipRequestListTile(
        key: key,
        info: info,
      );
}

class FriendListTileSelect extends FriendListTile {
  final bool checked;
  final void Function(bool?)? onTap;

  const FriendListTileSelect({
    super.key,
    required super.info,
    this.onTap,
    this.checked = false,
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

class FriendListTileView extends FriendListTile {
  const FriendListTileView({
    super.key,
    required super.info,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
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
      ),
    );
  }
}

class FriendshipRequestListTile extends FriendListTile {
  final VoidCallback? onAccept;

  final VoidCallback? onReject;

  const FriendshipRequestListTile({
    super.key,
    required super.info,
    this.onAccept,
    this.onReject,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
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
        trailing: Row(
          children: [
            IconButton(
              onPressed: onAccept,
              icon: const Icon(
                Icons.check_circle_outline_outlined,
                color: AppColors.mainBlue,
              ),
            ),
            const SizedBox(width: 10),
            IconButton(
              onPressed: onReject,
              icon: const Icon(
                Icons.cancel_outlined,
                color: AppColors.rejectRed,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
