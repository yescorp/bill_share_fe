import 'package:dio/dio.dart';

class FriendInfo {
  final String userId;
  final String name;
  final String surname;
  final String userName;
  final String? avatarUrl;

  const FriendInfo({
    required this.userId,
    required this.userName,
    this.name = '',
    this.surname = '',
    this.avatarUrl,
  });
}
