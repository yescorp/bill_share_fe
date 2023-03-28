class UserInfo {
  final String userId;
  final String name;
  final String surname;
  final String userName;

  const UserInfo({
    required this.userId,
    this.name = '',
    this.surname = '',
    required this.userName,
  });
}
