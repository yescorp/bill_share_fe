import 'package:bill_share/services/network_client.dart';
import 'package:get_it/get_it.dart';

final container = GetIt.instance;

bool _isRegistered = false;

void registerDependencies() {
  if (_isRegistered) {
    return;
  }

  registerNetworkClient();

  _isRegistered = true;
}

void registerNetworkClient() {
  const baseUrl = '';
  container.registerFactory(() => NetworkClient(baseUrl: baseUrl));
}
