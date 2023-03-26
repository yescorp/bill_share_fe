import 'package:dio/dio.dart';

class FriendInfo {
  final String userId;
  final String name;
  final String surname;
  final String userName;

  const FriendInfo({
    required this.userId,
    required this.name,
    required this.surname,
    required this.userName,
  });
}
