import 'package:bill_share/di/dependency_injection.dart';
import 'package:bill_share/services/navigation/api/navigation_provider.dart';
import 'package:bill_share/services/navigation/impl/navigation_provider_impl.dart';

class NavigationDependency {
  static void register() {
    DependencyProvider.registerFactory<NavigationProvider>(
        () => NavigationProviderImpl());
  }
}
