import 'package:bill_share/di/dependency_injection.dart';
import 'package:bill_share/services/image_converter/api/image_converter.dart';
import 'package:bill_share/services/image_converter/impl/image_converter_impl.dart';

class ImageConverterDependency {
  static void register() {
    DependencyProvider.registerLazySingleton<ImageConverter>(
        () => ImageConverterImpl());
  }
}
