import 'package:bill_share/mobile/components/acronym_avatar.dart';
import 'package:bill_share/models/user/detailed_user_info.dart';
import 'package:flutter/material.dart';

class DetailedUserTile extends StatelessWidget {
  final DetailedUserInfo userInfo;

  const DetailedUserTile({
    super.key,
    required this.userInfo,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
      ),
      padding: const EdgeInsets.all(10),
      child: Row(
        children: [
          AcronymAvatar(
            userId: userInfo.userId,
            name: userInfo.userName,
            heightWidth: 40,
          ),
          const SizedBox(width: 10),
          Expanded(child: Text(userInfo.userId)),
          const SizedBox(width: 10),
          Expanded(child: Text(userInfo.email)),
          const SizedBox(width: 10),
          Expanded(child: Text(userInfo.userName)),
        ],
      ),
    );
  }
}
