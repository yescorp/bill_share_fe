import 'dart:async';

import 'package:bill_share/swagger_generated_code/bill_share.swagger.dart';
import 'package:chopper/chopper.dart';

const authorizationHeader = 'Authorization';

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
    if (response.body is AuthenticationToken) {
      accessToken = (response.body as AuthenticationToken).accessToken!;
      refreshToken = (response.body as AuthenticationToken).refreshToken!;
      return null;
    }

    if (response.statusCode != 401 || response.statusCode != 403) {
      return null;
    }

    if (!request.headers.containsKey(authorizationHeader) &&
        accessToken.isNotEmpty) {
      request.headers
          .putIfAbsent(authorizationHeader, () => 'Bearer $accessToken');
      return request;
    }

    if (refreshToken.isEmpty) {
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

    request.headers.remove(authorizationHeader);
    request.headers
        .putIfAbsent(authorizationHeader, () => 'Bearer $accessToken');

    return request;
  }
}
