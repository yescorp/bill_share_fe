import 'package:bill_share/di/dependency_injection.dart';
import 'package:bill_share/services/network_client/api/network_client.dart';
import 'package:bill_share/services/network_client/impl/network_client_impl.dart';

class NetworkClientDependency {
  static void register() {
    const baseUrl = '';
    DependencyProvider.registerFactory<NetworkClient>(
      () => NetworkClientImpl(baseUrl: baseUrl),
    );
  }
}
