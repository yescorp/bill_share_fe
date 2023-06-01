import 'package:freezed_annotation/freezed_annotation.dart';

part 'temp.freezed.dart';

@freezed
class User with _$User {
  const factory User({
    required String name,
    required int age,
    required List<String> hobbies,
  }) = _User;
}
