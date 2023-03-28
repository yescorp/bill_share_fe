import 'dart:async';

import 'package:bill_share/swagger_generated_code/bill_share.swagger.dart';
import 'package:chopper/chopper.dart';

class BillShareAuthenticator extends Authenticator {
  final BillShare Function() clientAccessor;
  String accessToken = '';
  String refreshToken = '';

  BillShareAuthenticator({
    required this.clientAccessor,
  });

  @override
  FutureOr<Request?> authenticate(Request request, Response response,
      [Request? originalRequest]) async {
    if (response.statusCode != 401 || response.statusCode != 403) {
      return null;
    }

    final tokensResponse = await clientAccessor().apiTokenRefreshPost(
      body: RefreshJwtTokenDto(
        refreshToken: refreshToken,
      ),
    );

    if (!tokensResponse.isSuccessful) {
      return null;
    }

    accessToken = tokensResponse.body!.accessToken!;
    refreshToken = tokensResponse.body!.refreshToken!;

    request.headers.remove('Authorization');
    request.headers.putIfAbsent('Authorization', () => 'Bearer $accessToken');

    return null;
  }
}
