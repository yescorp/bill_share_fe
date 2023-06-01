import 'dart:convert';

import 'package:bill_share/di/dependency_injection.dart';

class GenericMapper {
  const GenericMapper();

  T mapInstanceFromString<T>(String str) {
    assert(DependencyProvider.container
        .isRegistered<T Function(Map<String, Object?>)>());

    final factory = DependencyProvider.get<T Function(Map<String, Object?>)>();
    const decoder = JsonDecoder();
    final json = decoder.convert(str);
    return factory(json);
  }
}
