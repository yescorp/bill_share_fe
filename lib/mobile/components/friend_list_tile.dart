import 'package:bill_share/mobile/components/acronym_avatar.dart';
import 'package:bill_share/models/user/friend_info.dart';
import 'package:bill_share/styles/colors.dart';
import 'package:bill_share/styles/text_styles.dart';
import 'package:flutter/material.dart';

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
    Future Function(String userId)? onAddFriend,
  }) =>
      FriendListTileView(
        key: key,
        info: info,
        onAddFriend: onAddFriend,
      );

  factory FriendListTile.request({
    Key? key,
    required FriendInfo info,
    Future Function(String userId)? onAccept,
    Future Function(String userId)? onReject,
  }) =>
      FriendshipRequestListTile(
        key: key,
        info: info,
        onAccept: onAccept,
        onReject: onReject,
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
            name: info.userName,
            heightWidth: 40,
          ),
          title: Text(
            info.userName,
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
  final Future Function(String userId)? onAddFriend;

  const FriendListTileView({
    super.key,
    required super.info,
    this.onAddFriend,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListTile(
        leading: AcronymAvatar(
          name: info.userName,
          heightWidth: 40,
        ),
        title: Text(
          info.userName,
          style: const TextStyle(
            fontSize: FontSizes.h3,
          ),
        ),
        trailing: info.isFriend
            ? null
            : IconButton(
                icon: Icon(
                  Icons.add,
                  color: Colors.black,
                ),
                onPressed: () => onAddFriend?.call(info.userId),
              ),
      ),
    );
  }
}

class FriendshipRequestListTile extends FriendListTile {
  final Future Function(String userId)? onAccept;
  final Future Function(String userId)? onReject;

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
          name: info.userName,
          heightWidth: 40,
        ),
        title: Text(
          info.userName,
          style: const TextStyle(
            fontSize: FontSizes.h3,
          ),
        ),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              iconSize: 30,
              onPressed: () => onAccept?.call(info.userId),
              icon: const Icon(
                Icons.check_circle_outline_outlined,
                color: AppColors.mainBlue,
              ),
            ),
            const SizedBox(width: 10),
            IconButton(
              iconSize: 30,
              onPressed: () => onReject?.call(info.userId),
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
