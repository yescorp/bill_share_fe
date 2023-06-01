import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class StorageService {
  Future<void> setValue<T extends JsonSerializable>(String key, T value) async {
    final cache = await SharedPreferences.getInstance();
    cache.setString(key, value.toJson().toString());
  }
}
