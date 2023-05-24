class DetailedUserInfo {
  final String userId;
  final String userName;
  final String email;
  final String? avatarUrl;

  const DetailedUserInfo({
    required this.userId,
    required this.userName,
    required this.email,
    this.avatarUrl,
  });
}
