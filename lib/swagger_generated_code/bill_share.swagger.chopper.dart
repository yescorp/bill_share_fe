//Generated code

part of 'bill_share.swagger.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

// ignore_for_file: always_put_control_body_on_new_line, always_specify_types, prefer_const_declarations, unnecessary_brace_in_string_interps
class _$BillShare extends BillShare {
  _$BillShare([ChopperClient? client]) {
    if (client == null) return;
    this.client = client;
  }

  @override
  final definitionType = BillShare;

  @override
  Future<Response<AuthenticationToken>> _authenticationRegisterPost(
      {required SignUpUserCredentials? body}) {
    final Uri $url = Uri.parse('/Authentication/register');
    final $body = body;
    final Request $request = Request(
      'POST',
      $url,
      client.baseUrl,
      body: $body,
    );
    return client.send<AuthenticationToken, AuthenticationToken>($request);
  }

  @override
  Future<Response<AuthenticationToken>> _authenticationLoginPost(
      {required SignInUserCredentials? body}) {
    final Uri $url = Uri.parse('/Authentication/login');
    final $body = body;
    final Request $request = Request(
      'POST',
      $url,
      client.baseUrl,
      body: $body,
    );
    return client.send<AuthenticationToken, AuthenticationToken>($request);
  }

  @override
  Future<Response<ExpenseCategoryResponse>> _expenseCategoriesPost(
      {required CreateExpenseCategoryRequest? body}) {
    final Uri $url = Uri.parse('/expense-categories');
    final $body = body;
    final Request $request = Request(
      'POST',
      $url,
      client.baseUrl,
      body: $body,
    );
    return client
        .send<ExpenseCategoryResponse, ExpenseCategoryResponse>($request);
  }

  @override
  Future<Response<List<ExpenseCategoryResponse>>> _expenseCategoriesGet() {
    final Uri $url = Uri.parse('/expense-categories');
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
    );
    return client
        .send<List<ExpenseCategoryResponse>, ExpenseCategoryResponse>($request);
  }

  @override
  Future<Response<ExpenseCategoryResponse>> _expenseCategoriesCategoryIdGet(
      {required String? categoryId}) {
    final Uri $url = Uri.parse('/expense-categories/${categoryId}');
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
    );
    return client
        .send<ExpenseCategoryResponse, ExpenseCategoryResponse>($request);
  }

  @override
  Future<Response<dynamic>> _expenseCategoriesExpenseCategoryIdPatch({
    required String? expenseCategoryId,
    required UpdateExpenseCategoryRequest? body,
  }) {
    final Uri $url = Uri.parse('/expense-categories/${expenseCategoryId}');
    final $body = body;
    final Request $request = Request(
      'PATCH',
      $url,
      client.baseUrl,
      body: $body,
    );
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<List<ExpenseTypeResponse>>> _expenseTypesGet() {
    final Uri $url = Uri.parse('/expense-types');
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
    );
    return client
        .send<List<ExpenseTypeResponse>, ExpenseTypeResponse>($request);
  }

  @override
  Future<Response<dynamic>> _friendsPost(
      {required CreateFriendshipRequestDto? body}) {
    final Uri $url = Uri.parse('/Friends');
    final $body = body;
    final Request $request = Request(
      'POST',
      $url,
      client.baseUrl,
      body: $body,
    );
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<UserFriendResponsePagedResponse>> _friendsGet({
    int? pageNumber,
    int? pageSize,
  }) {
    final Uri $url = Uri.parse('/Friends');
    final Map<String, dynamic> $params = <String, dynamic>{
      'PageNumber': pageNumber,
      'PageSize': pageSize,
    };
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
      parameters: $params,
    );
    return client.send<UserFriendResponsePagedResponse,
        UserFriendResponsePagedResponse>($request);
  }

  @override
  Future<Response<UserFriendResponsePagedResponse>> _friendsOutcomingGet({
    int? pageNumber,
    int? pageSize,
  }) {
    final Uri $url = Uri.parse('/Friends/outcoming');
    final Map<String, dynamic> $params = <String, dynamic>{
      'PageNumber': pageNumber,
      'PageSize': pageSize,
    };
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
      parameters: $params,
    );
    return client.send<UserFriendResponsePagedResponse,
        UserFriendResponsePagedResponse>($request);
  }

  @override
  Future<Response<UserFriendResponsePagedResponse>> _friendsIncomingGet({
    int? pageNumber,
    int? pageSize,
  }) {
    final Uri $url = Uri.parse('/Friends/incoming');
    final Map<String, dynamic> $params = <String, dynamic>{
      'PageNumber': pageNumber,
      'PageSize': pageSize,
    };
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
      parameters: $params,
    );
    return client.send<UserFriendResponsePagedResponse,
        UserFriendResponsePagedResponse>($request);
  }

  @override
  Future<Response<dynamic>> _friendsFriendshipRequestIdAcceptPost(
      {required String? friendshipRequestId}) {
    final Uri $url = Uri.parse('/Friends/${friendshipRequestId}/accept');
    final Request $request = Request(
      'POST',
      $url,
      client.baseUrl,
    );
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> _friendsFriendshipRequestIdDeclinePost(
      {required String? friendshipRequestId}) {
    final Uri $url = Uri.parse('/Friends/${friendshipRequestId}/decline');
    final Request $request = Request(
      'POST',
      $url,
      client.baseUrl,
    );
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<IconResponse>> _iconsPost({required CreateIconDto? body}) {
    final Uri $url = Uri.parse('/Icons');
    final $body = body;
    final Request $request = Request(
      'POST',
      $url,
      client.baseUrl,
      body: $body,
    );
    return client.send<IconResponse, IconResponse>($request);
  }

  @override
  Future<Response<List<IconResponse>>> _iconsGet() {
    final Uri $url = Uri.parse('/Icons');
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
    );
    return client.send<List<IconResponse>, IconResponse>($request);
  }

  @override
  Future<Response<IconResponse>> _iconsIconIdGet({required String? iconId}) {
    final Uri $url = Uri.parse('/Icons/${iconId}');
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
    );
    return client.send<IconResponse, IconResponse>($request);
  }

  @override
  Future<Response<dynamic>> _apiTokenChallengeGet() {
    final Uri $url = Uri.parse('/api/Token/challenge');
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
    );
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<AuthenticationToken>> _apiTokenRefreshPost(
      {required RefreshJwtTokenDto? body}) {
    final Uri $url = Uri.parse('/api/Token/refresh');
    final $body = body;
    final Request $request = Request(
      'POST',
      $url,
      client.baseUrl,
      body: $body,
    );
    return client.send<AuthenticationToken, AuthenticationToken>($request);
  }
}
