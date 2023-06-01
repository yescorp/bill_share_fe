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
  Future<Response<AccountResponse>> _accountsPost(
      {required CreateAccountRequest? body}) {
    final Uri $url = Uri.parse('/Accounts');
    final $body = body;
    final Request $request = Request(
      'POST',
      $url,
      client.baseUrl,
      body: $body,
    );
    return client.send<AccountResponse, AccountResponse>($request);
  }

  @override
  Future<Response<List<AccountResponse>>> _accountsGet() {
    final Uri $url = Uri.parse('/Accounts');
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
    );
    return client.send<List<AccountResponse>, AccountResponse>($request);
  }

  @override
  Future<Response<AccountResponse>> _accountsAccountIdGet(
      {required String? accountId}) {
    final Uri $url = Uri.parse('/Accounts/${accountId}');
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
    );
    return client.send<AccountResponse, AccountResponse>($request);
  }

  @override
  Future<Response<List<ShortExpenseResponse>>> _accountsAccountIdExpensesGet(
      {required String? accountId}) {
    final Uri $url = Uri.parse('/Accounts/${accountId}/expenses');
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
    );
    return client
        .send<List<ShortExpenseResponse>, ShortExpenseResponse>($request);
  }

  @override
  Future<Response<dynamic>> _accountsAccountIdDisablePut(
      {required String? accountId}) {
    final Uri $url = Uri.parse('/Accounts/${accountId}/disable');
    final Request $request = Request(
      'PUT',
      $url,
      client.baseUrl,
    );
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> _accountsAccountIdEnablePut(
      {required String? accountId}) {
    final Uri $url = Uri.parse('/Accounts/${accountId}/enable');
    final Request $request = Request(
      'PUT',
      $url,
      client.baseUrl,
    );
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> _accountsAccountIdAmountPut({
    required String? accountId,
    required ChangeAccountAmountRequest? body,
  }) {
    final Uri $url = Uri.parse('/Accounts/${accountId}/amount');
    final $body = body;
    final Request $request = Request(
      'PUT',
      $url,
      client.baseUrl,
      body: $body,
    );
    return client.send<dynamic, dynamic>($request);
  }

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
  Future<Response<dynamic>> _authenticationIsAdminGet() {
    final Uri $url = Uri.parse('/Authentication/is_admin');
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
    );
    return client.send<dynamic, dynamic>($request);
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
  Future<Response<ExpenseResponse>> _expensesExpenseIdGet(
      {required String? expenseId}) {
    final Uri $url = Uri.parse('/Expenses/${expenseId}');
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
    );
    return client.send<ExpenseResponse, ExpenseResponse>($request);
  }

  @override
  Future<Response<ExpenseResponse>> _expensesPost(
      {required CreateExpenseRequest? body}) {
    final Uri $url = Uri.parse('/Expenses');
    final $body = body;
    final Request $request = Request(
      'POST',
      $url,
      client.baseUrl,
      body: $body,
    );
    return client.send<ExpenseResponse, ExpenseResponse>($request);
  }

  @override
  Future<Response<ExpenseResponsePagedResponse>> _expensesGet({
    int? pageNumber,
    int? pageSize,
  }) {
    final Uri $url = Uri.parse('/Expenses');
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
    return client.send<ExpenseResponsePagedResponse,
        ExpenseResponsePagedResponse>($request);
  }

  @override
  Future<Response<dynamic>> _expensesExpenseIdLockPost(
      {required String? expenseId}) {
    final Uri $url = Uri.parse('/Expenses/${expenseId}/lock');
    final Request $request = Request(
      'POST',
      $url,
      client.baseUrl,
    );
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> _expensesExpenseIdUnlockPost(
      {required String? expenseId}) {
    final Uri $url = Uri.parse('/Expenses/${expenseId}/unlock');
    final Request $request = Request(
      'POST',
      $url,
      client.baseUrl,
    );
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<List<ExpenseResponse>>> _expensesAllPost() {
    final Uri $url = Uri.parse('/Expenses/all');
    final Request $request = Request(
      'POST',
      $url,
      client.baseUrl,
    );
    return client.send<List<ExpenseResponse>, ExpenseResponse>($request);
  }

  @override
  Future<Response<dynamic>> _expensesExpenseIdParticipantsPost({
    required String? expenseId,
    required AddExpenseParticipantRequest? body,
  }) {
    final Uri $url = Uri.parse('/Expenses/${expenseId}/participants');
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
  Future<Response<dynamic>>
      _expensesExpenseIdParticipantsParticipantIdDeletePost({
    required String? expenseId,
    required String? participantId,
  }) {
    final Uri $url = Uri.parse(
        '/Expenses/${expenseId}/participants/${participantId}/delete');
    final Request $request = Request(
      'POST',
      $url,
      client.baseUrl,
    );
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> _expensesExpenseIdItemsPost({
    required String? expenseId,
    required AddExpenseItemRequest? body,
  }) {
    final Uri $url = Uri.parse('/Expenses/${expenseId}/items');
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
  Future<Response<dynamic>> _expensesExpenseIdItemsItemIdDeletePost({
    required String? expenseId,
    required String? itemId,
  }) {
    final Uri $url = Uri.parse('/Expenses/${expenseId}/items/${itemId}/delete');
    final Request $request = Request(
      'POST',
      $url,
      client.baseUrl,
    );
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> _expensesExpenseIdItemsItemIdSelectPost({
    required String? expenseId,
    required String? itemId,
  }) {
    final Uri $url = Uri.parse('/Expenses/${expenseId}/items/${itemId}/select');
    final Request $request = Request(
      'POST',
      $url,
      client.baseUrl,
    );
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> _expensesExpenseIdItemsItemIdUnselectPost({
    required String? expenseId,
    required String? itemId,
  }) {
    final Uri $url =
        Uri.parse('/Expenses/${expenseId}/items/${itemId}/unselect');
    final Request $request = Request(
      'POST',
      $url,
      client.baseUrl,
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
  Future<Response<dynamic>> _friendsUserIdAcceptPost(
      {required String? userId}) {
    final Uri $url = Uri.parse('/Friends/${userId}/accept');
    final Request $request = Request(
      'POST',
      $url,
      client.baseUrl,
    );
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> _friendsUserIdDeclinePost(
      {required String? userId}) {
    final Uri $url = Uri.parse('/Friends/${userId}/decline');
    final Request $request = Request(
      'POST',
      $url,
      client.baseUrl,
    );
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<GroupResponse>> _groupsPost(
      {required CreateGroupRequest? body}) {
    final Uri $url = Uri.parse('/Groups');
    final $body = body;
    final Request $request = Request(
      'POST',
      $url,
      client.baseUrl,
      body: $body,
    );
    return client.send<GroupResponse, GroupResponse>($request);
  }

  @override
  Future<Response<GroupResponsePagedResponse>> _groupsGet({
    int? pageNumber,
    int? pageSize,
  }) {
    final Uri $url = Uri.parse('/Groups');
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
    return client
        .send<GroupResponsePagedResponse, GroupResponsePagedResponse>($request);
  }

  @override
  Future<Response<GroupResponse>> _groupsGroupIdGet(
      {required String? groupId}) {
    final Uri $url = Uri.parse('/Groups/${groupId}');
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
    );
    return client.send<GroupResponse, GroupResponse>($request);
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
  Future<Response<Report>> _reportsPersonalGet({
    String? startDate,
    String? endDate,
  }) {
    final Uri $url = Uri.parse('/Reports/personal');
    final Map<String, dynamic> $params = <String, dynamic>{
      'StartDate': startDate,
      'EndDate': endDate,
    };
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
      parameters: $params,
    );
    return client.send<Report, Report>($request);
  }

  @override
  Future<Response<Report>> _reportsSharedWithUserIdGet(
      {required String? userId}) {
    final Uri $url = Uri.parse('/Reports/shared_with/${userId}');
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
    );
    return client.send<Report, Report>($request);
  }

  @override
  Future<Response<Report>> _reportsForUserUserIdGet({
    required String? userId,
    String? startDate,
    String? endDate,
  }) {
    final Uri $url = Uri.parse('/Reports/for_user/${userId}');
    final Map<String, dynamic> $params = <String, dynamic>{
      'StartDate': startDate,
      'EndDate': endDate,
    };
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
      parameters: $params,
    );
    return client.send<Report, Report>($request);
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

  @override
  Future<Response<CustomerResponse>> _usersMeGet() {
    final Uri $url = Uri.parse('/Users/me');
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
    );
    return client.send<CustomerResponse, CustomerResponse>($request);
  }

  @override
  Future<Response<RelatedCustomerResponsePagedResponse>> _usersSearchGet({
    String? username,
    int? pageNumber,
    int? pageSize,
  }) {
    final Uri $url = Uri.parse('/Users/search');
    final Map<String, dynamic> $params = <String, dynamic>{
      'username': username,
      'PageNumber': pageNumber,
      'PageSize': pageSize,
    };
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
      parameters: $params,
    );
    return client.send<RelatedCustomerResponsePagedResponse,
        RelatedCustomerResponsePagedResponse>($request);
  }

  @override
  Future<Response<CustomerAvatarIcon>> _usersMeAvatarPost(
      {required CreateIconDto? body}) {
    final Uri $url = Uri.parse('/Users/me/avatar');
    final $body = body;
    final Request $request = Request(
      'POST',
      $url,
      client.baseUrl,
      body: $body,
    );
    return client.send<CustomerAvatarIcon, CustomerAvatarIcon>($request);
  }

  @override
  Future<Response<dynamic>> _usersMeAvatarDelete() {
    final Uri $url = Uri.parse('/Users/me/avatar');
    final Request $request = Request(
      'DELETE',
      $url,
      client.baseUrl,
    );
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<CustomerResponse>> _usersUserIdGet(
      {required String? userId}) {
    final Uri $url = Uri.parse('/Users/${userId}');
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
    );
    return client.send<CustomerResponse, CustomerResponse>($request);
  }

  @override
  Future<Response<List<CustomerResponse>>> _usersAllGet() {
    final Uri $url = Uri.parse('/Users/all');
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
    );
    return client.send<List<CustomerResponse>, CustomerResponse>($request);
  }
}
