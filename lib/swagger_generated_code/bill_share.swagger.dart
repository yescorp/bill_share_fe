// ignore_for_file: type=lint

import 'package:json_annotation/json_annotation.dart';
import 'package:collection/collection.dart';
import 'dart:convert';

import 'package:chopper/chopper.dart';

import 'client_mapping.dart';
import 'dart:async';
import 'package:chopper/chopper.dart' as chopper;
import 'bill_share.enums.swagger.dart' as enums;
export 'bill_share.enums.swagger.dart';

part 'bill_share.swagger.chopper.dart';
part 'bill_share.swagger.g.dart';

// **************************************************************************
// SwaggerChopperGenerator
// **************************************************************************

@ChopperApi()
abstract class BillShare extends ChopperService {
  static BillShare create({
    ChopperClient? client,
    Authenticator? authenticator,
    Uri? baseUrl,
    Iterable<dynamic>? interceptors,
  }) {
    if (client != null) {
      return _$BillShare(client);
    }

    final newClient = ChopperClient(
        services: [_$BillShare()],
        converter: $JsonSerializableConverter(),
        interceptors: interceptors ?? [],
        authenticator: authenticator,
        baseUrl: baseUrl ?? Uri.parse('http://'));
    return _$BillShare(newClient);
  }

  ///
  Future<chopper.Response<AccountResponse>> accountsPost(
      {required CreateAccountRequest? body}) {
    generatedMapping.putIfAbsent(
        AccountResponse, () => AccountResponse.fromJsonFactory);

    return _accountsPost(body: body);
  }

  ///
  @Post(
    path: '/Accounts',
    optionalBody: true,
  )
  Future<chopper.Response<AccountResponse>> _accountsPost(
      {@Body() required CreateAccountRequest? body});

  ///
  Future<chopper.Response<List<AccountResponse>>> accountsGet() {
    generatedMapping.putIfAbsent(
        AccountResponse, () => AccountResponse.fromJsonFactory);

    return _accountsGet();
  }

  ///
  @Get(path: '/Accounts')
  Future<chopper.Response<List<AccountResponse>>> _accountsGet();

  ///
  ///@param accountId
  Future<chopper.Response<AccountResponse>> accountsAccountIdGet(
      {required String? accountId}) {
    generatedMapping.putIfAbsent(
        AccountResponse, () => AccountResponse.fromJsonFactory);

    return _accountsAccountIdGet(accountId: accountId);
  }

  ///
  ///@param accountId
  @Get(path: '/Accounts/{accountId}')
  Future<chopper.Response<AccountResponse>> _accountsAccountIdGet(
      {@Path('accountId') required String? accountId});

  ///
  ///@param accountId
  Future<chopper.Response<List<ShortExpenseResponse>>>
      accountsAccountIdExpensesGet({required String? accountId}) {
    generatedMapping.putIfAbsent(
        ShortExpenseResponse, () => ShortExpenseResponse.fromJsonFactory);

    return _accountsAccountIdExpensesGet(accountId: accountId);
  }

  ///
  ///@param accountId
  @Get(path: '/Accounts/{accountId}/expenses')
  Future<chopper.Response<List<ShortExpenseResponse>>>
      _accountsAccountIdExpensesGet(
          {@Path('accountId') required String? accountId});

  ///
  ///@param accountId
  Future<chopper.Response> accountsAccountIdDisablePut(
      {required String? accountId}) {
    return _accountsAccountIdDisablePut(accountId: accountId);
  }

  ///
  ///@param accountId
  @Put(
    path: '/Accounts/{accountId}/disable',
    optionalBody: true,
  )
  Future<chopper.Response> _accountsAccountIdDisablePut(
      {@Path('accountId') required String? accountId});

  ///
  ///@param accountId
  Future<chopper.Response> accountsAccountIdEnablePut(
      {required String? accountId}) {
    return _accountsAccountIdEnablePut(accountId: accountId);
  }

  ///
  ///@param accountId
  @Put(
    path: '/Accounts/{accountId}/enable',
    optionalBody: true,
  )
  Future<chopper.Response> _accountsAccountIdEnablePut(
      {@Path('accountId') required String? accountId});

  ///
  ///@param accountId
  Future<chopper.Response> accountsAccountIdAmountPut({
    required String? accountId,
    required ChangeAccountAmountRequest? body,
  }) {
    return _accountsAccountIdAmountPut(accountId: accountId, body: body);
  }

  ///
  ///@param accountId
  @Put(
    path: '/Accounts/{accountId}/amount',
    optionalBody: true,
  )
  Future<chopper.Response> _accountsAccountIdAmountPut({
    @Path('accountId') required String? accountId,
    @Body() required ChangeAccountAmountRequest? body,
  });

  ///
  Future<chopper.Response<AuthenticationToken>> authenticationRegisterPost(
      {required SignUpUserCredentials? body}) {
    generatedMapping.putIfAbsent(
        AuthenticationToken, () => AuthenticationToken.fromJsonFactory);

    return _authenticationRegisterPost(body: body);
  }

  ///
  @Post(
    path: '/Authentication/register',
    optionalBody: true,
  )
  Future<chopper.Response<AuthenticationToken>> _authenticationRegisterPost(
      {@Body() required SignUpUserCredentials? body});

  ///
  Future<chopper.Response<AuthenticationToken>> authenticationLoginPost(
      {required SignInUserCredentials? body}) {
    generatedMapping.putIfAbsent(
        AuthenticationToken, () => AuthenticationToken.fromJsonFactory);

    return _authenticationLoginPost(body: body);
  }

  ///
  @Post(
    path: '/Authentication/login',
    optionalBody: true,
  )
  Future<chopper.Response<AuthenticationToken>> _authenticationLoginPost(
      {@Body() required SignInUserCredentials? body});

  ///
  Future<chopper.Response<ExpenseCategoryResponse>> expenseCategoriesPost(
      {required CreateExpenseCategoryRequest? body}) {
    generatedMapping.putIfAbsent(
        ExpenseCategoryResponse, () => ExpenseCategoryResponse.fromJsonFactory);

    return _expenseCategoriesPost(body: body);
  }

  ///
  @Post(
    path: '/expense-categories',
    optionalBody: true,
  )
  Future<chopper.Response<ExpenseCategoryResponse>> _expenseCategoriesPost(
      {@Body() required CreateExpenseCategoryRequest? body});

  ///
  Future<chopper.Response<List<ExpenseCategoryResponse>>>
      expenseCategoriesGet() {
    generatedMapping.putIfAbsent(
        ExpenseCategoryResponse, () => ExpenseCategoryResponse.fromJsonFactory);

    return _expenseCategoriesGet();
  }

  ///
  @Get(path: '/expense-categories')
  Future<chopper.Response<List<ExpenseCategoryResponse>>>
      _expenseCategoriesGet();

  ///
  ///@param categoryId
  Future<chopper.Response<ExpenseCategoryResponse>>
      expenseCategoriesCategoryIdGet({required String? categoryId}) {
    generatedMapping.putIfAbsent(
        ExpenseCategoryResponse, () => ExpenseCategoryResponse.fromJsonFactory);

    return _expenseCategoriesCategoryIdGet(categoryId: categoryId);
  }

  ///
  ///@param categoryId
  @Get(path: '/expense-categories/{categoryId}')
  Future<chopper.Response<ExpenseCategoryResponse>>
      _expenseCategoriesCategoryIdGet(
          {@Path('categoryId') required String? categoryId});

  ///
  ///@param expenseCategoryId
  Future<chopper.Response> expenseCategoriesExpenseCategoryIdPatch({
    required String? expenseCategoryId,
    required UpdateExpenseCategoryRequest? body,
  }) {
    return _expenseCategoriesExpenseCategoryIdPatch(
        expenseCategoryId: expenseCategoryId, body: body);
  }

  ///
  ///@param expenseCategoryId
  @Patch(
    path: '/expense-categories/{expenseCategoryId}',
    optionalBody: true,
  )
  Future<chopper.Response> _expenseCategoriesExpenseCategoryIdPatch({
    @Path('expenseCategoryId') required String? expenseCategoryId,
    @Body() required UpdateExpenseCategoryRequest? body,
  });

  ///
  ///@param expenseId
  Future<chopper.Response<ExpenseResponse>> expensesExpenseIdGet(
      {required String? expenseId}) {
    generatedMapping.putIfAbsent(
        ExpenseResponse, () => ExpenseResponse.fromJsonFactory);

    return _expensesExpenseIdGet(expenseId: expenseId);
  }

  ///
  ///@param expenseId
  @Get(path: '/Expenses/{expenseId}')
  Future<chopper.Response<ExpenseResponse>> _expensesExpenseIdGet(
      {@Path('expenseId') required String? expenseId});

  ///
  Future<chopper.Response<ExpenseResponse>> expensesPost(
      {required CreateExpenseRequest? body}) {
    generatedMapping.putIfAbsent(
        ExpenseResponse, () => ExpenseResponse.fromJsonFactory);

    return _expensesPost(body: body);
  }

  ///
  @Post(
    path: '/Expenses',
    optionalBody: true,
  )
  Future<chopper.Response<ExpenseResponse>> _expensesPost(
      {@Body() required CreateExpenseRequest? body});

  ///
  ///@param PageNumber
  ///@param PageSize
  Future<chopper.Response<ExpenseResponsePagedResponse>> expensesGet({
    int? pageNumber,
    int? pageSize,
  }) {
    generatedMapping.putIfAbsent(ExpenseResponsePagedResponse,
        () => ExpenseResponsePagedResponse.fromJsonFactory);

    return _expensesGet(pageNumber: pageNumber, pageSize: pageSize);
  }

  ///
  ///@param PageNumber
  ///@param PageSize
  @Get(path: '/Expenses')
  Future<chopper.Response<ExpenseResponsePagedResponse>> _expensesGet({
    @Query('PageNumber') int? pageNumber,
    @Query('PageSize') int? pageSize,
  });

  ///
  ///@param expenseId
  Future<chopper.Response> expensesExpenseIdLockPost(
      {required String? expenseId}) {
    return _expensesExpenseIdLockPost(expenseId: expenseId);
  }

  ///
  ///@param expenseId
  @Post(
    path: '/Expenses/{expenseId}/lock',
    optionalBody: true,
  )
  Future<chopper.Response> _expensesExpenseIdLockPost(
      {@Path('expenseId') required String? expenseId});

  ///
  ///@param expenseId
  Future<chopper.Response> expensesExpenseIdUnlockPost(
      {required String? expenseId}) {
    return _expensesExpenseIdUnlockPost(expenseId: expenseId);
  }

  ///
  ///@param expenseId
  @Post(
    path: '/Expenses/{expenseId}/unlock',
    optionalBody: true,
  )
  Future<chopper.Response> _expensesExpenseIdUnlockPost(
      {@Path('expenseId') required String? expenseId});

  ///
  ///@param expenseId
  Future<chopper.Response> expensesExpenseIdParticipantsPost({
    required String? expenseId,
    required AddExpenseParticipantRequest? body,
  }) {
    return _expensesExpenseIdParticipantsPost(expenseId: expenseId, body: body);
  }

  ///
  ///@param expenseId
  @Post(
    path: '/Expenses/{expenseId}/participants',
    optionalBody: true,
  )
  Future<chopper.Response> _expensesExpenseIdParticipantsPost({
    @Path('expenseId') required String? expenseId,
    @Body() required AddExpenseParticipantRequest? body,
  });

  ///
  ///@param expenseId
  ///@param participantId
  Future<chopper.Response>
      expensesExpenseIdParticipantsParticipantIdDeletePost({
    required String? expenseId,
    required String? participantId,
  }) {
    return _expensesExpenseIdParticipantsParticipantIdDeletePost(
        expenseId: expenseId, participantId: participantId);
  }

  ///
  ///@param expenseId
  ///@param participantId
  @Post(
    path: '/Expenses/{expenseId}/participants/{participantId}/delete',
    optionalBody: true,
  )
  Future<chopper.Response>
      _expensesExpenseIdParticipantsParticipantIdDeletePost({
    @Path('expenseId') required String? expenseId,
    @Path('participantId') required String? participantId,
  });

  ///
  ///@param expenseId
  Future<chopper.Response> expensesExpenseIdItemsPost({
    required String? expenseId,
    required AddExpenseItemRequest? body,
  }) {
    return _expensesExpenseIdItemsPost(expenseId: expenseId, body: body);
  }

  ///
  ///@param expenseId
  @Post(
    path: '/Expenses/{expenseId}/items',
    optionalBody: true,
  )
  Future<chopper.Response> _expensesExpenseIdItemsPost({
    @Path('expenseId') required String? expenseId,
    @Body() required AddExpenseItemRequest? body,
  });

  ///
  ///@param expenseId
  ///@param itemId
  Future<chopper.Response> expensesExpenseIdItemsItemIdDeletePost({
    required String? expenseId,
    required String? itemId,
  }) {
    return _expensesExpenseIdItemsItemIdDeletePost(
        expenseId: expenseId, itemId: itemId);
  }

  ///
  ///@param expenseId
  ///@param itemId
  @Post(
    path: '/Expenses/{expenseId}/items/{itemId}/delete',
    optionalBody: true,
  )
  Future<chopper.Response> _expensesExpenseIdItemsItemIdDeletePost({
    @Path('expenseId') required String? expenseId,
    @Path('itemId') required String? itemId,
  });

  ///
  ///@param expenseId
  ///@param itemId
  Future<chopper.Response> expensesExpenseIdItemsItemIdSelectPost({
    required String? expenseId,
    required String? itemId,
  }) {
    return _expensesExpenseIdItemsItemIdSelectPost(
        expenseId: expenseId, itemId: itemId);
  }

  ///
  ///@param expenseId
  ///@param itemId
  @Post(
    path: '/Expenses/{expenseId}/items/{itemId}/select',
    optionalBody: true,
  )
  Future<chopper.Response> _expensesExpenseIdItemsItemIdSelectPost({
    @Path('expenseId') required String? expenseId,
    @Path('itemId') required String? itemId,
  });

  ///
  ///@param expenseId
  ///@param itemId
  Future<chopper.Response> expensesExpenseIdItemsItemIdUnselectPost({
    required String? expenseId,
    required String? itemId,
  }) {
    return _expensesExpenseIdItemsItemIdUnselectPost(
        expenseId: expenseId, itemId: itemId);
  }

  ///
  ///@param expenseId
  ///@param itemId
  @Post(
    path: '/Expenses/{expenseId}/items/{itemId}/unselect',
    optionalBody: true,
  )
  Future<chopper.Response> _expensesExpenseIdItemsItemIdUnselectPost({
    @Path('expenseId') required String? expenseId,
    @Path('itemId') required String? itemId,
  });

  ///
  Future<chopper.Response<List<ExpenseTypeResponse>>> expenseTypesGet() {
    generatedMapping.putIfAbsent(
        ExpenseTypeResponse, () => ExpenseTypeResponse.fromJsonFactory);

    return _expenseTypesGet();
  }

  ///
  @Get(path: '/expense-types')
  Future<chopper.Response<List<ExpenseTypeResponse>>> _expenseTypesGet();

  ///
  Future<chopper.Response> friendsPost(
      {required CreateFriendshipRequestDto? body}) {
    return _friendsPost(body: body);
  }

  ///
  @Post(
    path: '/Friends',
    optionalBody: true,
  )
  Future<chopper.Response> _friendsPost(
      {@Body() required CreateFriendshipRequestDto? body});

  ///
  ///@param PageNumber
  ///@param PageSize
  Future<chopper.Response<UserFriendResponsePagedResponse>> friendsGet({
    int? pageNumber,
    int? pageSize,
  }) {
    generatedMapping.putIfAbsent(UserFriendResponsePagedResponse,
        () => UserFriendResponsePagedResponse.fromJsonFactory);

    return _friendsGet(pageNumber: pageNumber, pageSize: pageSize);
  }

  ///
  ///@param PageNumber
  ///@param PageSize
  @Get(path: '/Friends')
  Future<chopper.Response<UserFriendResponsePagedResponse>> _friendsGet({
    @Query('PageNumber') int? pageNumber,
    @Query('PageSize') int? pageSize,
  });

  ///
  ///@param PageNumber
  ///@param PageSize
  Future<chopper.Response<UserFriendResponsePagedResponse>>
      friendsOutcomingGet({
    int? pageNumber,
    int? pageSize,
  }) {
    generatedMapping.putIfAbsent(UserFriendResponsePagedResponse,
        () => UserFriendResponsePagedResponse.fromJsonFactory);

    return _friendsOutcomingGet(pageNumber: pageNumber, pageSize: pageSize);
  }

  ///
  ///@param PageNumber
  ///@param PageSize
  @Get(path: '/Friends/outcoming')
  Future<chopper.Response<UserFriendResponsePagedResponse>>
      _friendsOutcomingGet({
    @Query('PageNumber') int? pageNumber,
    @Query('PageSize') int? pageSize,
  });

  ///
  ///@param PageNumber
  ///@param PageSize
  Future<chopper.Response<UserFriendResponsePagedResponse>> friendsIncomingGet({
    int? pageNumber,
    int? pageSize,
  }) {
    generatedMapping.putIfAbsent(UserFriendResponsePagedResponse,
        () => UserFriendResponsePagedResponse.fromJsonFactory);

    return _friendsIncomingGet(pageNumber: pageNumber, pageSize: pageSize);
  }

  ///
  ///@param PageNumber
  ///@param PageSize
  @Get(path: '/Friends/incoming')
  Future<chopper.Response<UserFriendResponsePagedResponse>>
      _friendsIncomingGet({
    @Query('PageNumber') int? pageNumber,
    @Query('PageSize') int? pageSize,
  });

  ///
  ///@param userId
  Future<chopper.Response> friendsUserIdAcceptPost({required String? userId}) {
    return _friendsUserIdAcceptPost(userId: userId);
  }

  ///
  ///@param userId
  @Post(
    path: '/Friends/{userId}/accept',
    optionalBody: true,
  )
  Future<chopper.Response> _friendsUserIdAcceptPost(
      {@Path('userId') required String? userId});

  ///
  ///@param userId
  Future<chopper.Response> friendsUserIdDeclinePost({required String? userId}) {
    return _friendsUserIdDeclinePost(userId: userId);
  }

  ///
  ///@param userId
  @Post(
    path: '/Friends/{userId}/decline',
    optionalBody: true,
  )
  Future<chopper.Response> _friendsUserIdDeclinePost(
      {@Path('userId') required String? userId});

  ///
  Future<chopper.Response<GroupResponse>> groupsPost(
      {required CreateGroupRequest? body}) {
    generatedMapping.putIfAbsent(
        GroupResponse, () => GroupResponse.fromJsonFactory);

    return _groupsPost(body: body);
  }

  ///
  @Post(
    path: '/Groups',
    optionalBody: true,
  )
  Future<chopper.Response<GroupResponse>> _groupsPost(
      {@Body() required CreateGroupRequest? body});

  ///
  ///@param PageNumber
  ///@param PageSize
  Future<chopper.Response<GroupResponsePagedResponse>> groupsGet({
    int? pageNumber,
    int? pageSize,
  }) {
    generatedMapping.putIfAbsent(GroupResponsePagedResponse,
        () => GroupResponsePagedResponse.fromJsonFactory);

    return _groupsGet(pageNumber: pageNumber, pageSize: pageSize);
  }

  ///
  ///@param PageNumber
  ///@param PageSize
  @Get(path: '/Groups')
  Future<chopper.Response<GroupResponsePagedResponse>> _groupsGet({
    @Query('PageNumber') int? pageNumber,
    @Query('PageSize') int? pageSize,
  });

  ///
  ///@param groupId
  Future<chopper.Response<GroupResponse>> groupsGroupIdGet(
      {required String? groupId}) {
    generatedMapping.putIfAbsent(
        GroupResponse, () => GroupResponse.fromJsonFactory);

    return _groupsGroupIdGet(groupId: groupId);
  }

  ///
  ///@param groupId
  @Get(path: '/Groups/{groupId}')
  Future<chopper.Response<GroupResponse>> _groupsGroupIdGet(
      {@Path('groupId') required String? groupId});

  ///
  Future<chopper.Response<IconResponse>> iconsPost(
      {required CreateIconDto? body}) {
    generatedMapping.putIfAbsent(
        IconResponse, () => IconResponse.fromJsonFactory);

    return _iconsPost(body: body);
  }

  ///
  @Post(
    path: '/Icons',
    optionalBody: true,
  )
  Future<chopper.Response<IconResponse>> _iconsPost(
      {@Body() required CreateIconDto? body});

  ///
  Future<chopper.Response<List<IconResponse>>> iconsGet() {
    generatedMapping.putIfAbsent(
        IconResponse, () => IconResponse.fromJsonFactory);

    return _iconsGet();
  }

  ///
  @Get(path: '/Icons')
  Future<chopper.Response<List<IconResponse>>> _iconsGet();

  ///
  ///@param iconId
  Future<chopper.Response<IconResponse>> iconsIconIdGet(
      {required String? iconId}) {
    generatedMapping.putIfAbsent(
        IconResponse, () => IconResponse.fromJsonFactory);

    return _iconsIconIdGet(iconId: iconId);
  }

  ///
  ///@param iconId
  @Get(path: '/Icons/{iconId}')
  Future<chopper.Response<IconResponse>> _iconsIconIdGet(
      {@Path('iconId') required String? iconId});

  ///
  ///@param StartDate
  ///@param EndDate
  Future<chopper.Response<Report>> reportsPersonalGet({
    String? startDate,
    String? endDate,
  }) {
    generatedMapping.putIfAbsent(Report, () => Report.fromJsonFactory);

    return _reportsPersonalGet(startDate: startDate, endDate: endDate);
  }

  ///
  ///@param StartDate
  ///@param EndDate
  @Get(path: '/Reports/personal')
  Future<chopper.Response<Report>> _reportsPersonalGet({
    @Query('StartDate') String? startDate,
    @Query('EndDate') String? endDate,
  });

  ///
  ///@param userId
  Future<chopper.Response<Report>> reportsSharedWithUserIdGet(
      {required String? userId}) {
    generatedMapping.putIfAbsent(Report, () => Report.fromJsonFactory);

    return _reportsSharedWithUserIdGet(userId: userId);
  }

  ///
  ///@param userId
  @Get(path: '/Reports/shared_with/{userId}')
  Future<chopper.Response<Report>> _reportsSharedWithUserIdGet(
      {@Path('userId') required String? userId});

  ///
  Future<chopper.Response> apiTokenChallengeGet() {
    return _apiTokenChallengeGet();
  }

  ///
  @Get(path: '/api/Token/challenge')
  Future<chopper.Response> _apiTokenChallengeGet();

  ///
  Future<chopper.Response<AuthenticationToken>> apiTokenRefreshPost(
      {required RefreshJwtTokenDto? body}) {
    generatedMapping.putIfAbsent(
        AuthenticationToken, () => AuthenticationToken.fromJsonFactory);

    return _apiTokenRefreshPost(body: body);
  }

  ///
  @Post(
    path: '/api/Token/refresh',
    optionalBody: true,
  )
  Future<chopper.Response<AuthenticationToken>> _apiTokenRefreshPost(
      {@Body() required RefreshJwtTokenDto? body});

  ///
  Future<chopper.Response<CustomerResponse>> usersMeGet() {
    generatedMapping.putIfAbsent(
        CustomerResponse, () => CustomerResponse.fromJsonFactory);

    return _usersMeGet();
  }

  ///
  @Get(path: '/Users/me')
  Future<chopper.Response<CustomerResponse>> _usersMeGet();

  ///
  ///@param username
  ///@param PageNumber
  ///@param PageSize
  Future<chopper.Response<RelatedCustomerResponsePagedResponse>>
      usersSearchGet({
    String? username,
    int? pageNumber,
    int? pageSize,
  }) {
    generatedMapping.putIfAbsent(RelatedCustomerResponsePagedResponse,
        () => RelatedCustomerResponsePagedResponse.fromJsonFactory);

    return _usersSearchGet(
        username: username, pageNumber: pageNumber, pageSize: pageSize);
  }

  ///
  ///@param username
  ///@param PageNumber
  ///@param PageSize
  @Get(path: '/Users/search')
  Future<chopper.Response<RelatedCustomerResponsePagedResponse>>
      _usersSearchGet({
    @Query('username') String? username,
    @Query('PageNumber') int? pageNumber,
    @Query('PageSize') int? pageSize,
  });

  ///
  Future<chopper.Response<CustomerAvatarIcon>> usersMeAvatarPost(
      {required CreateIconDto? body}) {
    generatedMapping.putIfAbsent(
        CustomerAvatarIcon, () => CustomerAvatarIcon.fromJsonFactory);

    return _usersMeAvatarPost(body: body);
  }

  ///
  @Post(
    path: '/Users/me/avatar',
    optionalBody: true,
  )
  Future<chopper.Response<CustomerAvatarIcon>> _usersMeAvatarPost(
      {@Body() required CreateIconDto? body});

  ///
  Future<chopper.Response> usersMeAvatarDelete() {
    return _usersMeAvatarDelete();
  }

  ///
  @Delete(path: '/Users/me/avatar')
  Future<chopper.Response> _usersMeAvatarDelete();

  ///
  ///@param userId
  Future<chopper.Response<CustomerResponse>> usersUserIdGet(
      {required String? userId}) {
    generatedMapping.putIfAbsent(
        CustomerResponse, () => CustomerResponse.fromJsonFactory);

    return _usersUserIdGet(userId: userId);
  }

  ///
  ///@param userId
  @Get(path: '/Users/{userId}')
  Future<chopper.Response<CustomerResponse>> _usersUserIdGet(
      {@Path('userId') required String? userId});
}

@JsonSerializable(explicitToJson: true)
class AccountResponse {
  AccountResponse({
    this.id,
    this.name,
    this.amount,
    this.externalId,
  });

  factory AccountResponse.fromJson(Map<String, dynamic> json) =>
      _$AccountResponseFromJson(json);

  static const toJsonFactory = _$AccountResponseToJson;
  Map<String, dynamic> toJson() => _$AccountResponseToJson(this);

  @JsonKey(name: 'id')
  final String? id;
  @JsonKey(name: 'name')
  final String? name;
  @JsonKey(name: 'amount')
  final double? amount;
  @JsonKey(name: 'externalId')
  final String? externalId;
  static const fromJsonFactory = _$AccountResponseFromJson;

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is AccountResponse &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.amount, amount) ||
                const DeepCollectionEquality().equals(other.amount, amount)) &&
            (identical(other.externalId, externalId) ||
                const DeepCollectionEquality()
                    .equals(other.externalId, externalId)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(amount) ^
      const DeepCollectionEquality().hash(externalId) ^
      runtimeType.hashCode;
}

extension $AccountResponseExtension on AccountResponse {
  AccountResponse copyWith(
      {String? id, String? name, double? amount, String? externalId}) {
    return AccountResponse(
        id: id ?? this.id,
        name: name ?? this.name,
        amount: amount ?? this.amount,
        externalId: externalId ?? this.externalId);
  }

  AccountResponse copyWithWrapped(
      {Wrapped<String?>? id,
      Wrapped<String?>? name,
      Wrapped<double?>? amount,
      Wrapped<String?>? externalId}) {
    return AccountResponse(
        id: (id != null ? id.value : this.id),
        name: (name != null ? name.value : this.name),
        amount: (amount != null ? amount.value : this.amount),
        externalId: (externalId != null ? externalId.value : this.externalId));
  }
}

@JsonSerializable(explicitToJson: true)
class AddExpenseItemRequest {
  AddExpenseItemRequest({
    this.name,
    this.count,
    this.amount,
  });

  factory AddExpenseItemRequest.fromJson(Map<String, dynamic> json) =>
      _$AddExpenseItemRequestFromJson(json);

  static const toJsonFactory = _$AddExpenseItemRequestToJson;
  Map<String, dynamic> toJson() => _$AddExpenseItemRequestToJson(this);

  @JsonKey(name: 'name')
  final String? name;
  @JsonKey(name: 'count')
  final int? count;
  @JsonKey(name: 'amount')
  final double? amount;
  static const fromJsonFactory = _$AddExpenseItemRequestFromJson;

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is AddExpenseItemRequest &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.count, count) ||
                const DeepCollectionEquality().equals(other.count, count)) &&
            (identical(other.amount, amount) ||
                const DeepCollectionEquality().equals(other.amount, amount)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(count) ^
      const DeepCollectionEquality().hash(amount) ^
      runtimeType.hashCode;
}

extension $AddExpenseItemRequestExtension on AddExpenseItemRequest {
  AddExpenseItemRequest copyWith({String? name, int? count, double? amount}) {
    return AddExpenseItemRequest(
        name: name ?? this.name,
        count: count ?? this.count,
        amount: amount ?? this.amount);
  }

  AddExpenseItemRequest copyWithWrapped(
      {Wrapped<String?>? name,
      Wrapped<int?>? count,
      Wrapped<double?>? amount}) {
    return AddExpenseItemRequest(
        name: (name != null ? name.value : this.name),
        count: (count != null ? count.value : this.count),
        amount: (amount != null ? amount.value : this.amount));
  }
}

@JsonSerializable(explicitToJson: true)
class AddExpenseParticipantRequest {
  AddExpenseParticipantRequest({
    this.userId,
  });

  factory AddExpenseParticipantRequest.fromJson(Map<String, dynamic> json) =>
      _$AddExpenseParticipantRequestFromJson(json);

  static const toJsonFactory = _$AddExpenseParticipantRequestToJson;
  Map<String, dynamic> toJson() => _$AddExpenseParticipantRequestToJson(this);

  @JsonKey(name: 'userId')
  final String? userId;
  static const fromJsonFactory = _$AddExpenseParticipantRequestFromJson;

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is AddExpenseParticipantRequest &&
            (identical(other.userId, userId) ||
                const DeepCollectionEquality().equals(other.userId, userId)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(userId) ^ runtimeType.hashCode;
}

extension $AddExpenseParticipantRequestExtension
    on AddExpenseParticipantRequest {
  AddExpenseParticipantRequest copyWith({String? userId}) {
    return AddExpenseParticipantRequest(userId: userId ?? this.userId);
  }

  AddExpenseParticipantRequest copyWithWrapped({Wrapped<String?>? userId}) {
    return AddExpenseParticipantRequest(
        userId: (userId != null ? userId.value : this.userId));
  }
}

@JsonSerializable(explicitToJson: true)
class AuthenticationToken {
  AuthenticationToken({
    this.accessToken,
    this.refreshToken,
  });

  factory AuthenticationToken.fromJson(Map<String, dynamic> json) =>
      _$AuthenticationTokenFromJson(json);

  static const toJsonFactory = _$AuthenticationTokenToJson;
  Map<String, dynamic> toJson() => _$AuthenticationTokenToJson(this);

  @JsonKey(name: 'accessToken')
  final String? accessToken;
  @JsonKey(name: 'refreshToken')
  final String? refreshToken;
  static const fromJsonFactory = _$AuthenticationTokenFromJson;

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is AuthenticationToken &&
            (identical(other.accessToken, accessToken) ||
                const DeepCollectionEquality()
                    .equals(other.accessToken, accessToken)) &&
            (identical(other.refreshToken, refreshToken) ||
                const DeepCollectionEquality()
                    .equals(other.refreshToken, refreshToken)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(accessToken) ^
      const DeepCollectionEquality().hash(refreshToken) ^
      runtimeType.hashCode;
}

extension $AuthenticationTokenExtension on AuthenticationToken {
  AuthenticationToken copyWith({String? accessToken, String? refreshToken}) {
    return AuthenticationToken(
        accessToken: accessToken ?? this.accessToken,
        refreshToken: refreshToken ?? this.refreshToken);
  }

  AuthenticationToken copyWithWrapped(
      {Wrapped<String?>? accessToken, Wrapped<String?>? refreshToken}) {
    return AuthenticationToken(
        accessToken:
            (accessToken != null ? accessToken.value : this.accessToken),
        refreshToken:
            (refreshToken != null ? refreshToken.value : this.refreshToken));
  }
}

@JsonSerializable(explicitToJson: true)
class CategorySpend {
  CategorySpend({
    this.categoryId,
    this.categoryName,
    this.total,
  });

  factory CategorySpend.fromJson(Map<String, dynamic> json) =>
      _$CategorySpendFromJson(json);

  static const toJsonFactory = _$CategorySpendToJson;
  Map<String, dynamic> toJson() => _$CategorySpendToJson(this);

  @JsonKey(name: 'categoryId')
  final String? categoryId;
  @JsonKey(name: 'categoryName')
  final String? categoryName;
  @JsonKey(name: 'total')
  final double? total;
  static const fromJsonFactory = _$CategorySpendFromJson;

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is CategorySpend &&
            (identical(other.categoryId, categoryId) ||
                const DeepCollectionEquality()
                    .equals(other.categoryId, categoryId)) &&
            (identical(other.categoryName, categoryName) ||
                const DeepCollectionEquality()
                    .equals(other.categoryName, categoryName)) &&
            (identical(other.total, total) ||
                const DeepCollectionEquality().equals(other.total, total)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(categoryId) ^
      const DeepCollectionEquality().hash(categoryName) ^
      const DeepCollectionEquality().hash(total) ^
      runtimeType.hashCode;
}

extension $CategorySpendExtension on CategorySpend {
  CategorySpend copyWith(
      {String? categoryId, String? categoryName, double? total}) {
    return CategorySpend(
        categoryId: categoryId ?? this.categoryId,
        categoryName: categoryName ?? this.categoryName,
        total: total ?? this.total);
  }

  CategorySpend copyWithWrapped(
      {Wrapped<String?>? categoryId,
      Wrapped<String?>? categoryName,
      Wrapped<double?>? total}) {
    return CategorySpend(
        categoryId: (categoryId != null ? categoryId.value : this.categoryId),
        categoryName:
            (categoryName != null ? categoryName.value : this.categoryName),
        total: (total != null ? total.value : this.total));
  }
}

@JsonSerializable(explicitToJson: true)
class ChangeAccountAmountRequest {
  ChangeAccountAmountRequest({
    this.amount,
  });

  factory ChangeAccountAmountRequest.fromJson(Map<String, dynamic> json) =>
      _$ChangeAccountAmountRequestFromJson(json);

  static const toJsonFactory = _$ChangeAccountAmountRequestToJson;
  Map<String, dynamic> toJson() => _$ChangeAccountAmountRequestToJson(this);

  @JsonKey(name: 'amount')
  final double? amount;
  static const fromJsonFactory = _$ChangeAccountAmountRequestFromJson;

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is ChangeAccountAmountRequest &&
            (identical(other.amount, amount) ||
                const DeepCollectionEquality().equals(other.amount, amount)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(amount) ^ runtimeType.hashCode;
}

extension $ChangeAccountAmountRequestExtension on ChangeAccountAmountRequest {
  ChangeAccountAmountRequest copyWith({double? amount}) {
    return ChangeAccountAmountRequest(amount: amount ?? this.amount);
  }

  ChangeAccountAmountRequest copyWithWrapped({Wrapped<double?>? amount}) {
    return ChangeAccountAmountRequest(
        amount: (amount != null ? amount.value : this.amount));
  }
}

@JsonSerializable(explicitToJson: true)
class CreateAccountRequest {
  CreateAccountRequest({
    this.name,
    this.amount,
    this.externalId,
  });

  factory CreateAccountRequest.fromJson(Map<String, dynamic> json) =>
      _$CreateAccountRequestFromJson(json);

  static const toJsonFactory = _$CreateAccountRequestToJson;
  Map<String, dynamic> toJson() => _$CreateAccountRequestToJson(this);

  @JsonKey(name: 'name')
  final String? name;
  @JsonKey(name: 'amount')
  final double? amount;
  @JsonKey(name: 'externalId')
  final String? externalId;
  static const fromJsonFactory = _$CreateAccountRequestFromJson;

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is CreateAccountRequest &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.amount, amount) ||
                const DeepCollectionEquality().equals(other.amount, amount)) &&
            (identical(other.externalId, externalId) ||
                const DeepCollectionEquality()
                    .equals(other.externalId, externalId)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(amount) ^
      const DeepCollectionEquality().hash(externalId) ^
      runtimeType.hashCode;
}

extension $CreateAccountRequestExtension on CreateAccountRequest {
  CreateAccountRequest copyWith(
      {String? name, double? amount, String? externalId}) {
    return CreateAccountRequest(
        name: name ?? this.name,
        amount: amount ?? this.amount,
        externalId: externalId ?? this.externalId);
  }

  CreateAccountRequest copyWithWrapped(
      {Wrapped<String?>? name,
      Wrapped<double?>? amount,
      Wrapped<String?>? externalId}) {
    return CreateAccountRequest(
        name: (name != null ? name.value : this.name),
        amount: (amount != null ? amount.value : this.amount),
        externalId: (externalId != null ? externalId.value : this.externalId));
  }
}

@JsonSerializable(explicitToJson: true)
class CreateExpenseCategoryRequest {
  CreateExpenseCategoryRequest({
    this.categoryName,
    this.iconId,
  });

  factory CreateExpenseCategoryRequest.fromJson(Map<String, dynamic> json) =>
      _$CreateExpenseCategoryRequestFromJson(json);

  static const toJsonFactory = _$CreateExpenseCategoryRequestToJson;
  Map<String, dynamic> toJson() => _$CreateExpenseCategoryRequestToJson(this);

  @JsonKey(name: 'categoryName')
  final String? categoryName;
  @JsonKey(name: 'iconId')
  final String? iconId;
  static const fromJsonFactory = _$CreateExpenseCategoryRequestFromJson;

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is CreateExpenseCategoryRequest &&
            (identical(other.categoryName, categoryName) ||
                const DeepCollectionEquality()
                    .equals(other.categoryName, categoryName)) &&
            (identical(other.iconId, iconId) ||
                const DeepCollectionEquality().equals(other.iconId, iconId)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(categoryName) ^
      const DeepCollectionEquality().hash(iconId) ^
      runtimeType.hashCode;
}

extension $CreateExpenseCategoryRequestExtension
    on CreateExpenseCategoryRequest {
  CreateExpenseCategoryRequest copyWith(
      {String? categoryName, String? iconId}) {
    return CreateExpenseCategoryRequest(
        categoryName: categoryName ?? this.categoryName,
        iconId: iconId ?? this.iconId);
  }

  CreateExpenseCategoryRequest copyWithWrapped(
      {Wrapped<String?>? categoryName, Wrapped<String?>? iconId}) {
    return CreateExpenseCategoryRequest(
        categoryName:
            (categoryName != null ? categoryName.value : this.categoryName),
        iconId: (iconId != null ? iconId.value : this.iconId));
  }
}

@JsonSerializable(explicitToJson: true)
class CreateExpenseMultiplierRequest {
  CreateExpenseMultiplierRequest({
    this.name,
    this.costMultiplierPercent,
  });

  factory CreateExpenseMultiplierRequest.fromJson(Map<String, dynamic> json) =>
      _$CreateExpenseMultiplierRequestFromJson(json);

  static const toJsonFactory = _$CreateExpenseMultiplierRequestToJson;
  Map<String, dynamic> toJson() => _$CreateExpenseMultiplierRequestToJson(this);

  @JsonKey(name: 'name')
  final String? name;
  @JsonKey(name: 'costMultiplierPercent')
  final int? costMultiplierPercent;
  static const fromJsonFactory = _$CreateExpenseMultiplierRequestFromJson;

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is CreateExpenseMultiplierRequest &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.costMultiplierPercent, costMultiplierPercent) ||
                const DeepCollectionEquality().equals(
                    other.costMultiplierPercent, costMultiplierPercent)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(costMultiplierPercent) ^
      runtimeType.hashCode;
}

extension $CreateExpenseMultiplierRequestExtension
    on CreateExpenseMultiplierRequest {
  CreateExpenseMultiplierRequest copyWith(
      {String? name, int? costMultiplierPercent}) {
    return CreateExpenseMultiplierRequest(
        name: name ?? this.name,
        costMultiplierPercent:
            costMultiplierPercent ?? this.costMultiplierPercent);
  }

  CreateExpenseMultiplierRequest copyWithWrapped(
      {Wrapped<String?>? name, Wrapped<int?>? costMultiplierPercent}) {
    return CreateExpenseMultiplierRequest(
        name: (name != null ? name.value : this.name),
        costMultiplierPercent: (costMultiplierPercent != null
            ? costMultiplierPercent.value
            : this.costMultiplierPercent));
  }
}

@JsonSerializable(explicitToJson: true)
class CreateExpenseRequest {
  CreateExpenseRequest({
    this.name,
    this.expenseTypeId,
    this.categoryId,
    this.accountId,
    this.amount,
    this.participants,
    this.items,
    this.multipliers,
  });

  factory CreateExpenseRequest.fromJson(Map<String, dynamic> json) =>
      _$CreateExpenseRequestFromJson(json);

  static const toJsonFactory = _$CreateExpenseRequestToJson;
  Map<String, dynamic> toJson() => _$CreateExpenseRequestToJson(this);

  @JsonKey(name: 'name')
  final String? name;
  @JsonKey(
    name: 'expenseTypeId',
    toJson: expenseTypeIdToJson,
    fromJson: expenseTypeIdFromJson,
  )
  final enums.ExpenseTypeId? expenseTypeId;
  @JsonKey(name: 'categoryId')
  final String? categoryId;
  @JsonKey(name: 'accountId')
  final String? accountId;
  @JsonKey(name: 'amount')
  final int? amount;
  @JsonKey(name: 'participants', defaultValue: <AddExpenseParticipantRequest>[])
  final List<AddExpenseParticipantRequest>? participants;
  @JsonKey(name: 'items', defaultValue: <AddExpenseItemRequest>[])
  final List<AddExpenseItemRequest>? items;
  @JsonKey(
      name: 'multipliers', defaultValue: <CreateExpenseMultiplierRequest>[])
  final List<CreateExpenseMultiplierRequest>? multipliers;
  static const fromJsonFactory = _$CreateExpenseRequestFromJson;

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is CreateExpenseRequest &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.expenseTypeId, expenseTypeId) ||
                const DeepCollectionEquality()
                    .equals(other.expenseTypeId, expenseTypeId)) &&
            (identical(other.categoryId, categoryId) ||
                const DeepCollectionEquality()
                    .equals(other.categoryId, categoryId)) &&
            (identical(other.accountId, accountId) ||
                const DeepCollectionEquality()
                    .equals(other.accountId, accountId)) &&
            (identical(other.amount, amount) ||
                const DeepCollectionEquality().equals(other.amount, amount)) &&
            (identical(other.participants, participants) ||
                const DeepCollectionEquality()
                    .equals(other.participants, participants)) &&
            (identical(other.items, items) ||
                const DeepCollectionEquality().equals(other.items, items)) &&
            (identical(other.multipliers, multipliers) ||
                const DeepCollectionEquality()
                    .equals(other.multipliers, multipliers)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(expenseTypeId) ^
      const DeepCollectionEquality().hash(categoryId) ^
      const DeepCollectionEquality().hash(accountId) ^
      const DeepCollectionEquality().hash(amount) ^
      const DeepCollectionEquality().hash(participants) ^
      const DeepCollectionEquality().hash(items) ^
      const DeepCollectionEquality().hash(multipliers) ^
      runtimeType.hashCode;
}

extension $CreateExpenseRequestExtension on CreateExpenseRequest {
  CreateExpenseRequest copyWith(
      {String? name,
      enums.ExpenseTypeId? expenseTypeId,
      String? categoryId,
      String? accountId,
      int? amount,
      List<AddExpenseParticipantRequest>? participants,
      List<AddExpenseItemRequest>? items,
      List<CreateExpenseMultiplierRequest>? multipliers}) {
    return CreateExpenseRequest(
        name: name ?? this.name,
        expenseTypeId: expenseTypeId ?? this.expenseTypeId,
        categoryId: categoryId ?? this.categoryId,
        accountId: accountId ?? this.accountId,
        amount: amount ?? this.amount,
        participants: participants ?? this.participants,
        items: items ?? this.items,
        multipliers: multipliers ?? this.multipliers);
  }

  CreateExpenseRequest copyWithWrapped(
      {Wrapped<String?>? name,
      Wrapped<enums.ExpenseTypeId?>? expenseTypeId,
      Wrapped<String?>? categoryId,
      Wrapped<String?>? accountId,
      Wrapped<int?>? amount,
      Wrapped<List<AddExpenseParticipantRequest>?>? participants,
      Wrapped<List<AddExpenseItemRequest>?>? items,
      Wrapped<List<CreateExpenseMultiplierRequest>?>? multipliers}) {
    return CreateExpenseRequest(
        name: (name != null ? name.value : this.name),
        expenseTypeId:
            (expenseTypeId != null ? expenseTypeId.value : this.expenseTypeId),
        categoryId: (categoryId != null ? categoryId.value : this.categoryId),
        accountId: (accountId != null ? accountId.value : this.accountId),
        amount: (amount != null ? amount.value : this.amount),
        participants:
            (participants != null ? participants.value : this.participants),
        items: (items != null ? items.value : this.items),
        multipliers:
            (multipliers != null ? multipliers.value : this.multipliers));
  }
}

@JsonSerializable(explicitToJson: true)
class CreateFriendshipRequestDto {
  CreateFriendshipRequestDto({
    this.userId,
  });

  factory CreateFriendshipRequestDto.fromJson(Map<String, dynamic> json) =>
      _$CreateFriendshipRequestDtoFromJson(json);

  static const toJsonFactory = _$CreateFriendshipRequestDtoToJson;
  Map<String, dynamic> toJson() => _$CreateFriendshipRequestDtoToJson(this);

  @JsonKey(name: 'userId')
  final String? userId;
  static const fromJsonFactory = _$CreateFriendshipRequestDtoFromJson;

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is CreateFriendshipRequestDto &&
            (identical(other.userId, userId) ||
                const DeepCollectionEquality().equals(other.userId, userId)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(userId) ^ runtimeType.hashCode;
}

extension $CreateFriendshipRequestDtoExtension on CreateFriendshipRequestDto {
  CreateFriendshipRequestDto copyWith({String? userId}) {
    return CreateFriendshipRequestDto(userId: userId ?? this.userId);
  }

  CreateFriendshipRequestDto copyWithWrapped({Wrapped<String?>? userId}) {
    return CreateFriendshipRequestDto(
        userId: (userId != null ? userId.value : this.userId));
  }
}

@JsonSerializable(explicitToJson: true)
class CreateGroupRequest {
  CreateGroupRequest({
    this.groupName,
    this.participants,
  });

  factory CreateGroupRequest.fromJson(Map<String, dynamic> json) =>
      _$CreateGroupRequestFromJson(json);

  static const toJsonFactory = _$CreateGroupRequestToJson;
  Map<String, dynamic> toJson() => _$CreateGroupRequestToJson(this);

  @JsonKey(name: 'groupName')
  final String? groupName;
  @JsonKey(name: 'participants', defaultValue: <String>[])
  final List<String>? participants;
  static const fromJsonFactory = _$CreateGroupRequestFromJson;

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is CreateGroupRequest &&
            (identical(other.groupName, groupName) ||
                const DeepCollectionEquality()
                    .equals(other.groupName, groupName)) &&
            (identical(other.participants, participants) ||
                const DeepCollectionEquality()
                    .equals(other.participants, participants)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(groupName) ^
      const DeepCollectionEquality().hash(participants) ^
      runtimeType.hashCode;
}

extension $CreateGroupRequestExtension on CreateGroupRequest {
  CreateGroupRequest copyWith({String? groupName, List<String>? participants}) {
    return CreateGroupRequest(
        groupName: groupName ?? this.groupName,
        participants: participants ?? this.participants);
  }

  CreateGroupRequest copyWithWrapped(
      {Wrapped<String?>? groupName, Wrapped<List<String>?>? participants}) {
    return CreateGroupRequest(
        groupName: (groupName != null ? groupName.value : this.groupName),
        participants:
            (participants != null ? participants.value : this.participants));
  }
}

@JsonSerializable(explicitToJson: true)
class CreateIconDto {
  CreateIconDto({
    this.iconImageData,
    this.extension,
  });

  factory CreateIconDto.fromJson(Map<String, dynamic> json) =>
      _$CreateIconDtoFromJson(json);

  static const toJsonFactory = _$CreateIconDtoToJson;
  Map<String, dynamic> toJson() => _$CreateIconDtoToJson(this);

  @JsonKey(name: 'iconImageData')
  final String? iconImageData;
  @JsonKey(name: 'extension')
  final String? extension;
  static const fromJsonFactory = _$CreateIconDtoFromJson;

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is CreateIconDto &&
            (identical(other.iconImageData, iconImageData) ||
                const DeepCollectionEquality()
                    .equals(other.iconImageData, iconImageData)) &&
            (identical(other.extension, extension) ||
                const DeepCollectionEquality()
                    .equals(other.extension, extension)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(iconImageData) ^
      const DeepCollectionEquality().hash(extension) ^
      runtimeType.hashCode;
}

extension $CreateIconDtoExtension on CreateIconDto {
  CreateIconDto copyWith({String? iconImageData, String? extension}) {
    return CreateIconDto(
        iconImageData: iconImageData ?? this.iconImageData,
        extension: extension ?? this.extension);
  }

  CreateIconDto copyWithWrapped(
      {Wrapped<String?>? iconImageData, Wrapped<String?>? extension}) {
    return CreateIconDto(
        iconImageData:
            (iconImageData != null ? iconImageData.value : this.iconImageData),
        extension: (extension != null ? extension.value : this.extension));
  }
}

@JsonSerializable(explicitToJson: true)
class CustomerAvatarIcon {
  CustomerAvatarIcon({
    this.avatarUrl,
  });

  factory CustomerAvatarIcon.fromJson(Map<String, dynamic> json) =>
      _$CustomerAvatarIconFromJson(json);

  static const toJsonFactory = _$CustomerAvatarIconToJson;
  Map<String, dynamic> toJson() => _$CustomerAvatarIconToJson(this);

  @JsonKey(name: 'avatarUrl')
  final String? avatarUrl;
  static const fromJsonFactory = _$CustomerAvatarIconFromJson;

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is CustomerAvatarIcon &&
            (identical(other.avatarUrl, avatarUrl) ||
                const DeepCollectionEquality()
                    .equals(other.avatarUrl, avatarUrl)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(avatarUrl) ^ runtimeType.hashCode;
}

extension $CustomerAvatarIconExtension on CustomerAvatarIcon {
  CustomerAvatarIcon copyWith({String? avatarUrl}) {
    return CustomerAvatarIcon(avatarUrl: avatarUrl ?? this.avatarUrl);
  }

  CustomerAvatarIcon copyWithWrapped({Wrapped<String?>? avatarUrl}) {
    return CustomerAvatarIcon(
        avatarUrl: (avatarUrl != null ? avatarUrl.value : this.avatarUrl));
  }
}

@JsonSerializable(explicitToJson: true)
class CustomerResponse {
  CustomerResponse({
    this.id,
    this.email,
    this.name,
    this.avatarUrl,
  });

  factory CustomerResponse.fromJson(Map<String, dynamic> json) =>
      _$CustomerResponseFromJson(json);

  static const toJsonFactory = _$CustomerResponseToJson;
  Map<String, dynamic> toJson() => _$CustomerResponseToJson(this);

  @JsonKey(name: 'id')
  final String? id;
  @JsonKey(name: 'email')
  final String? email;
  @JsonKey(name: 'name')
  final String? name;
  @JsonKey(name: 'avatarUrl')
  final String? avatarUrl;
  static const fromJsonFactory = _$CustomerResponseFromJson;

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is CustomerResponse &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.email, email) ||
                const DeepCollectionEquality().equals(other.email, email)) &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.avatarUrl, avatarUrl) ||
                const DeepCollectionEquality()
                    .equals(other.avatarUrl, avatarUrl)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(email) ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(avatarUrl) ^
      runtimeType.hashCode;
}

extension $CustomerResponseExtension on CustomerResponse {
  CustomerResponse copyWith(
      {String? id, String? email, String? name, String? avatarUrl}) {
    return CustomerResponse(
        id: id ?? this.id,
        email: email ?? this.email,
        name: name ?? this.name,
        avatarUrl: avatarUrl ?? this.avatarUrl);
  }

  CustomerResponse copyWithWrapped(
      {Wrapped<String?>? id,
      Wrapped<String?>? email,
      Wrapped<String?>? name,
      Wrapped<String?>? avatarUrl}) {
    return CustomerResponse(
        id: (id != null ? id.value : this.id),
        email: (email != null ? email.value : this.email),
        name: (name != null ? name.value : this.name),
        avatarUrl: (avatarUrl != null ? avatarUrl.value : this.avatarUrl));
  }
}

@JsonSerializable(explicitToJson: true)
class ExpenseCategoryResponse {
  ExpenseCategoryResponse({
    this.id,
    this.name,
    this.iconUrl,
  });

  factory ExpenseCategoryResponse.fromJson(Map<String, dynamic> json) =>
      _$ExpenseCategoryResponseFromJson(json);

  static const toJsonFactory = _$ExpenseCategoryResponseToJson;
  Map<String, dynamic> toJson() => _$ExpenseCategoryResponseToJson(this);

  @JsonKey(name: 'id')
  final String? id;
  @JsonKey(name: 'name')
  final String? name;
  @JsonKey(name: 'iconUrl')
  final String? iconUrl;
  static const fromJsonFactory = _$ExpenseCategoryResponseFromJson;

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is ExpenseCategoryResponse &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.iconUrl, iconUrl) ||
                const DeepCollectionEquality().equals(other.iconUrl, iconUrl)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(iconUrl) ^
      runtimeType.hashCode;
}

extension $ExpenseCategoryResponseExtension on ExpenseCategoryResponse {
  ExpenseCategoryResponse copyWith(
      {String? id, String? name, String? iconUrl}) {
    return ExpenseCategoryResponse(
        id: id ?? this.id,
        name: name ?? this.name,
        iconUrl: iconUrl ?? this.iconUrl);
  }

  ExpenseCategoryResponse copyWithWrapped(
      {Wrapped<String?>? id,
      Wrapped<String?>? name,
      Wrapped<String?>? iconUrl}) {
    return ExpenseCategoryResponse(
        id: (id != null ? id.value : this.id),
        name: (name != null ? name.value : this.name),
        iconUrl: (iconUrl != null ? iconUrl.value : this.iconUrl));
  }
}

@JsonSerializable(explicitToJson: true)
class ExpenseItemActionResponse {
  ExpenseItemActionResponse({
    this.selectItemUrl,
    this.unselectItemUrl,
    this.deleteItemUrl,
  });

  factory ExpenseItemActionResponse.fromJson(Map<String, dynamic> json) =>
      _$ExpenseItemActionResponseFromJson(json);

  static const toJsonFactory = _$ExpenseItemActionResponseToJson;
  Map<String, dynamic> toJson() => _$ExpenseItemActionResponseToJson(this);

  @JsonKey(name: 'selectItemUrl')
  final String? selectItemUrl;
  @JsonKey(name: 'unselectItemUrl')
  final String? unselectItemUrl;
  @JsonKey(name: 'deleteItemUrl')
  final String? deleteItemUrl;
  static const fromJsonFactory = _$ExpenseItemActionResponseFromJson;

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is ExpenseItemActionResponse &&
            (identical(other.selectItemUrl, selectItemUrl) ||
                const DeepCollectionEquality()
                    .equals(other.selectItemUrl, selectItemUrl)) &&
            (identical(other.unselectItemUrl, unselectItemUrl) ||
                const DeepCollectionEquality()
                    .equals(other.unselectItemUrl, unselectItemUrl)) &&
            (identical(other.deleteItemUrl, deleteItemUrl) ||
                const DeepCollectionEquality()
                    .equals(other.deleteItemUrl, deleteItemUrl)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(selectItemUrl) ^
      const DeepCollectionEquality().hash(unselectItemUrl) ^
      const DeepCollectionEquality().hash(deleteItemUrl) ^
      runtimeType.hashCode;
}

extension $ExpenseItemActionResponseExtension on ExpenseItemActionResponse {
  ExpenseItemActionResponse copyWith(
      {String? selectItemUrl, String? unselectItemUrl, String? deleteItemUrl}) {
    return ExpenseItemActionResponse(
        selectItemUrl: selectItemUrl ?? this.selectItemUrl,
        unselectItemUrl: unselectItemUrl ?? this.unselectItemUrl,
        deleteItemUrl: deleteItemUrl ?? this.deleteItemUrl);
  }

  ExpenseItemActionResponse copyWithWrapped(
      {Wrapped<String?>? selectItemUrl,
      Wrapped<String?>? unselectItemUrl,
      Wrapped<String?>? deleteItemUrl}) {
    return ExpenseItemActionResponse(
        selectItemUrl:
            (selectItemUrl != null ? selectItemUrl.value : this.selectItemUrl),
        unselectItemUrl: (unselectItemUrl != null
            ? unselectItemUrl.value
            : this.unselectItemUrl),
        deleteItemUrl:
            (deleteItemUrl != null ? deleteItemUrl.value : this.deleteItemUrl));
  }
}

@JsonSerializable(explicitToJson: true)
class ExpenseItemResponse {
  ExpenseItemResponse({
    this.id,
    this.name,
    this.count,
    this.amount,
    this.selectedByParticipants,
    this.actions,
  });

  factory ExpenseItemResponse.fromJson(Map<String, dynamic> json) =>
      _$ExpenseItemResponseFromJson(json);

  static const toJsonFactory = _$ExpenseItemResponseToJson;
  Map<String, dynamic> toJson() => _$ExpenseItemResponseToJson(this);

  @JsonKey(name: 'id')
  final String? id;
  @JsonKey(name: 'name')
  final String? name;
  @JsonKey(name: 'count')
  final int? count;
  @JsonKey(name: 'amount')
  final int? amount;
  @JsonKey(name: 'selectedByParticipants', defaultValue: <String>[])
  final List<String>? selectedByParticipants;
  @JsonKey(name: 'actions')
  final ExpenseItemActionResponse? actions;
  static const fromJsonFactory = _$ExpenseItemResponseFromJson;

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is ExpenseItemResponse &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.count, count) ||
                const DeepCollectionEquality().equals(other.count, count)) &&
            (identical(other.amount, amount) ||
                const DeepCollectionEquality().equals(other.amount, amount)) &&
            (identical(other.selectedByParticipants, selectedByParticipants) ||
                const DeepCollectionEquality().equals(
                    other.selectedByParticipants, selectedByParticipants)) &&
            (identical(other.actions, actions) ||
                const DeepCollectionEquality().equals(other.actions, actions)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(count) ^
      const DeepCollectionEquality().hash(amount) ^
      const DeepCollectionEquality().hash(selectedByParticipants) ^
      const DeepCollectionEquality().hash(actions) ^
      runtimeType.hashCode;
}

extension $ExpenseItemResponseExtension on ExpenseItemResponse {
  ExpenseItemResponse copyWith(
      {String? id,
      String? name,
      int? count,
      int? amount,
      List<String>? selectedByParticipants,
      ExpenseItemActionResponse? actions}) {
    return ExpenseItemResponse(
        id: id ?? this.id,
        name: name ?? this.name,
        count: count ?? this.count,
        amount: amount ?? this.amount,
        selectedByParticipants:
            selectedByParticipants ?? this.selectedByParticipants,
        actions: actions ?? this.actions);
  }

  ExpenseItemResponse copyWithWrapped(
      {Wrapped<String?>? id,
      Wrapped<String?>? name,
      Wrapped<int?>? count,
      Wrapped<int?>? amount,
      Wrapped<List<String>?>? selectedByParticipants,
      Wrapped<ExpenseItemActionResponse?>? actions}) {
    return ExpenseItemResponse(
        id: (id != null ? id.value : this.id),
        name: (name != null ? name.value : this.name),
        count: (count != null ? count.value : this.count),
        amount: (amount != null ? amount.value : this.amount),
        selectedByParticipants: (selectedByParticipants != null
            ? selectedByParticipants.value
            : this.selectedByParticipants),
        actions: (actions != null ? actions.value : this.actions));
  }
}

@JsonSerializable(explicitToJson: true)
class ExpenseMultiplierResponse {
  ExpenseMultiplierResponse({
    this.id,
    this.name,
    this.costMultiplierPercent,
  });

  factory ExpenseMultiplierResponse.fromJson(Map<String, dynamic> json) =>
      _$ExpenseMultiplierResponseFromJson(json);

  static const toJsonFactory = _$ExpenseMultiplierResponseToJson;
  Map<String, dynamic> toJson() => _$ExpenseMultiplierResponseToJson(this);

  @JsonKey(name: 'id')
  final String? id;
  @JsonKey(name: 'name')
  final String? name;
  @JsonKey(name: 'costMultiplierPercent')
  final int? costMultiplierPercent;
  static const fromJsonFactory = _$ExpenseMultiplierResponseFromJson;

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is ExpenseMultiplierResponse &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.costMultiplierPercent, costMultiplierPercent) ||
                const DeepCollectionEquality().equals(
                    other.costMultiplierPercent, costMultiplierPercent)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(costMultiplierPercent) ^
      runtimeType.hashCode;
}

extension $ExpenseMultiplierResponseExtension on ExpenseMultiplierResponse {
  ExpenseMultiplierResponse copyWith(
      {String? id, String? name, int? costMultiplierPercent}) {
    return ExpenseMultiplierResponse(
        id: id ?? this.id,
        name: name ?? this.name,
        costMultiplierPercent:
            costMultiplierPercent ?? this.costMultiplierPercent);
  }

  ExpenseMultiplierResponse copyWithWrapped(
      {Wrapped<String?>? id,
      Wrapped<String?>? name,
      Wrapped<int?>? costMultiplierPercent}) {
    return ExpenseMultiplierResponse(
        id: (id != null ? id.value : this.id),
        name: (name != null ? name.value : this.name),
        costMultiplierPercent: (costMultiplierPercent != null
            ? costMultiplierPercent.value
            : this.costMultiplierPercent));
  }
}

@JsonSerializable(explicitToJson: true)
class ExpenseParticipantActionResponse {
  ExpenseParticipantActionResponse({
    this.removeParticipantUrl,
  });

  factory ExpenseParticipantActionResponse.fromJson(
          Map<String, dynamic> json) =>
      _$ExpenseParticipantActionResponseFromJson(json);

  static const toJsonFactory = _$ExpenseParticipantActionResponseToJson;
  Map<String, dynamic> toJson() =>
      _$ExpenseParticipantActionResponseToJson(this);

  @JsonKey(name: 'removeParticipantUrl')
  final String? removeParticipantUrl;
  static const fromJsonFactory = _$ExpenseParticipantActionResponseFromJson;

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is ExpenseParticipantActionResponse &&
            (identical(other.removeParticipantUrl, removeParticipantUrl) ||
                const DeepCollectionEquality()
                    .equals(other.removeParticipantUrl, removeParticipantUrl)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(removeParticipantUrl) ^
      runtimeType.hashCode;
}

extension $ExpenseParticipantActionResponseExtension
    on ExpenseParticipantActionResponse {
  ExpenseParticipantActionResponse copyWith({String? removeParticipantUrl}) {
    return ExpenseParticipantActionResponse(
        removeParticipantUrl:
            removeParticipantUrl ?? this.removeParticipantUrl);
  }

  ExpenseParticipantActionResponse copyWithWrapped(
      {Wrapped<String?>? removeParticipantUrl}) {
    return ExpenseParticipantActionResponse(
        removeParticipantUrl: (removeParticipantUrl != null
            ? removeParticipantUrl.value
            : this.removeParticipantUrl));
  }
}

@JsonSerializable(explicitToJson: true)
class ExpenseParticipantResponse {
  ExpenseParticipantResponse({
    this.participantId,
    this.userId,
    this.name,
    this.avatarUrl,
    this.actions,
  });

  factory ExpenseParticipantResponse.fromJson(Map<String, dynamic> json) =>
      _$ExpenseParticipantResponseFromJson(json);

  static const toJsonFactory = _$ExpenseParticipantResponseToJson;
  Map<String, dynamic> toJson() => _$ExpenseParticipantResponseToJson(this);

  @JsonKey(name: 'participantId')
  final String? participantId;
  @JsonKey(name: 'userId')
  final String? userId;
  @JsonKey(name: 'name')
  final String? name;
  @JsonKey(name: 'avatarUrl')
  final String? avatarUrl;
  @JsonKey(name: 'actions')
  final ExpenseParticipantActionResponse? actions;
  static const fromJsonFactory = _$ExpenseParticipantResponseFromJson;

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is ExpenseParticipantResponse &&
            (identical(other.participantId, participantId) ||
                const DeepCollectionEquality()
                    .equals(other.participantId, participantId)) &&
            (identical(other.userId, userId) ||
                const DeepCollectionEquality().equals(other.userId, userId)) &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.avatarUrl, avatarUrl) ||
                const DeepCollectionEquality()
                    .equals(other.avatarUrl, avatarUrl)) &&
            (identical(other.actions, actions) ||
                const DeepCollectionEquality().equals(other.actions, actions)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(participantId) ^
      const DeepCollectionEquality().hash(userId) ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(avatarUrl) ^
      const DeepCollectionEquality().hash(actions) ^
      runtimeType.hashCode;
}

extension $ExpenseParticipantResponseExtension on ExpenseParticipantResponse {
  ExpenseParticipantResponse copyWith(
      {String? participantId,
      String? userId,
      String? name,
      String? avatarUrl,
      ExpenseParticipantActionResponse? actions}) {
    return ExpenseParticipantResponse(
        participantId: participantId ?? this.participantId,
        userId: userId ?? this.userId,
        name: name ?? this.name,
        avatarUrl: avatarUrl ?? this.avatarUrl,
        actions: actions ?? this.actions);
  }

  ExpenseParticipantResponse copyWithWrapped(
      {Wrapped<String?>? participantId,
      Wrapped<String?>? userId,
      Wrapped<String?>? name,
      Wrapped<String?>? avatarUrl,
      Wrapped<ExpenseParticipantActionResponse?>? actions}) {
    return ExpenseParticipantResponse(
        participantId:
            (participantId != null ? participantId.value : this.participantId),
        userId: (userId != null ? userId.value : this.userId),
        name: (name != null ? name.value : this.name),
        avatarUrl: (avatarUrl != null ? avatarUrl.value : this.avatarUrl),
        actions: (actions != null ? actions.value : this.actions));
  }
}

@JsonSerializable(explicitToJson: true)
class ExpenseResponse {
  ExpenseResponse({
    this.id,
    this.name,
    this.creatorId,
    this.expenseType,
    this.category,
    this.dateTime,
    this.participants,
    this.expenseItems,
    this.multipliers,
  });

  factory ExpenseResponse.fromJson(Map<String, dynamic> json) =>
      _$ExpenseResponseFromJson(json);

  static const toJsonFactory = _$ExpenseResponseToJson;
  Map<String, dynamic> toJson() => _$ExpenseResponseToJson(this);

  @JsonKey(name: 'id')
  final String? id;
  @JsonKey(name: 'name')
  final String? name;
  @JsonKey(name: 'creatorId')
  final String? creatorId;
  @JsonKey(name: 'expenseType')
  final ExpenseTypeResponse? expenseType;
  @JsonKey(name: 'category')
  final ExpenseCategoryResponse? category;
  @JsonKey(name: 'dateTime')
  final String? dateTime;
  @JsonKey(name: 'participants', defaultValue: <ExpenseParticipantResponse>[])
  final List<ExpenseParticipantResponse>? participants;
  @JsonKey(name: 'expenseItems', defaultValue: <ExpenseItemResponse>[])
  final List<ExpenseItemResponse>? expenseItems;
  @JsonKey(name: 'multipliers', defaultValue: <ExpenseMultiplierResponse>[])
  final List<ExpenseMultiplierResponse>? multipliers;
  static const fromJsonFactory = _$ExpenseResponseFromJson;

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is ExpenseResponse &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.creatorId, creatorId) ||
                const DeepCollectionEquality()
                    .equals(other.creatorId, creatorId)) &&
            (identical(other.expenseType, expenseType) ||
                const DeepCollectionEquality()
                    .equals(other.expenseType, expenseType)) &&
            (identical(other.category, category) ||
                const DeepCollectionEquality()
                    .equals(other.category, category)) &&
            (identical(other.dateTime, dateTime) ||
                const DeepCollectionEquality()
                    .equals(other.dateTime, dateTime)) &&
            (identical(other.participants, participants) ||
                const DeepCollectionEquality()
                    .equals(other.participants, participants)) &&
            (identical(other.expenseItems, expenseItems) ||
                const DeepCollectionEquality()
                    .equals(other.expenseItems, expenseItems)) &&
            (identical(other.multipliers, multipliers) ||
                const DeepCollectionEquality()
                    .equals(other.multipliers, multipliers)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(creatorId) ^
      const DeepCollectionEquality().hash(expenseType) ^
      const DeepCollectionEquality().hash(category) ^
      const DeepCollectionEquality().hash(dateTime) ^
      const DeepCollectionEquality().hash(participants) ^
      const DeepCollectionEquality().hash(expenseItems) ^
      const DeepCollectionEquality().hash(multipliers) ^
      runtimeType.hashCode;
}

extension $ExpenseResponseExtension on ExpenseResponse {
  ExpenseResponse copyWith(
      {String? id,
      String? name,
      String? creatorId,
      ExpenseTypeResponse? expenseType,
      ExpenseCategoryResponse? category,
      String? dateTime,
      List<ExpenseParticipantResponse>? participants,
      List<ExpenseItemResponse>? expenseItems,
      List<ExpenseMultiplierResponse>? multipliers}) {
    return ExpenseResponse(
        id: id ?? this.id,
        name: name ?? this.name,
        creatorId: creatorId ?? this.creatorId,
        expenseType: expenseType ?? this.expenseType,
        category: category ?? this.category,
        dateTime: dateTime ?? this.dateTime,
        participants: participants ?? this.participants,
        expenseItems: expenseItems ?? this.expenseItems,
        multipliers: multipliers ?? this.multipliers);
  }

  ExpenseResponse copyWithWrapped(
      {Wrapped<String?>? id,
      Wrapped<String?>? name,
      Wrapped<String?>? creatorId,
      Wrapped<ExpenseTypeResponse?>? expenseType,
      Wrapped<ExpenseCategoryResponse?>? category,
      Wrapped<String?>? dateTime,
      Wrapped<List<ExpenseParticipantResponse>?>? participants,
      Wrapped<List<ExpenseItemResponse>?>? expenseItems,
      Wrapped<List<ExpenseMultiplierResponse>?>? multipliers}) {
    return ExpenseResponse(
        id: (id != null ? id.value : this.id),
        name: (name != null ? name.value : this.name),
        creatorId: (creatorId != null ? creatorId.value : this.creatorId),
        expenseType:
            (expenseType != null ? expenseType.value : this.expenseType),
        category: (category != null ? category.value : this.category),
        dateTime: (dateTime != null ? dateTime.value : this.dateTime),
        participants:
            (participants != null ? participants.value : this.participants),
        expenseItems:
            (expenseItems != null ? expenseItems.value : this.expenseItems),
        multipliers:
            (multipliers != null ? multipliers.value : this.multipliers));
  }
}

@JsonSerializable(explicitToJson: true)
class ExpenseResponsePagedResponse {
  ExpenseResponsePagedResponse({
    this.totalCount,
    this.firstPageUrl,
    this.lastPageUrl,
    this.nextPageUrl,
    this.data,
  });

  factory ExpenseResponsePagedResponse.fromJson(Map<String, dynamic> json) =>
      _$ExpenseResponsePagedResponseFromJson(json);

  static const toJsonFactory = _$ExpenseResponsePagedResponseToJson;
  Map<String, dynamic> toJson() => _$ExpenseResponsePagedResponseToJson(this);

  @JsonKey(name: 'totalCount')
  final int? totalCount;
  @JsonKey(name: 'firstPageUrl')
  final String? firstPageUrl;
  @JsonKey(name: 'lastPageUrl')
  final String? lastPageUrl;
  @JsonKey(name: 'nextPageUrl')
  final String? nextPageUrl;
  @JsonKey(name: 'data', defaultValue: <ExpenseResponse>[])
  final List<ExpenseResponse>? data;
  static const fromJsonFactory = _$ExpenseResponsePagedResponseFromJson;

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is ExpenseResponsePagedResponse &&
            (identical(other.totalCount, totalCount) ||
                const DeepCollectionEquality()
                    .equals(other.totalCount, totalCount)) &&
            (identical(other.firstPageUrl, firstPageUrl) ||
                const DeepCollectionEquality()
                    .equals(other.firstPageUrl, firstPageUrl)) &&
            (identical(other.lastPageUrl, lastPageUrl) ||
                const DeepCollectionEquality()
                    .equals(other.lastPageUrl, lastPageUrl)) &&
            (identical(other.nextPageUrl, nextPageUrl) ||
                const DeepCollectionEquality()
                    .equals(other.nextPageUrl, nextPageUrl)) &&
            (identical(other.data, data) ||
                const DeepCollectionEquality().equals(other.data, data)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(totalCount) ^
      const DeepCollectionEquality().hash(firstPageUrl) ^
      const DeepCollectionEquality().hash(lastPageUrl) ^
      const DeepCollectionEquality().hash(nextPageUrl) ^
      const DeepCollectionEquality().hash(data) ^
      runtimeType.hashCode;
}

extension $ExpenseResponsePagedResponseExtension
    on ExpenseResponsePagedResponse {
  ExpenseResponsePagedResponse copyWith(
      {int? totalCount,
      String? firstPageUrl,
      String? lastPageUrl,
      String? nextPageUrl,
      List<ExpenseResponse>? data}) {
    return ExpenseResponsePagedResponse(
        totalCount: totalCount ?? this.totalCount,
        firstPageUrl: firstPageUrl ?? this.firstPageUrl,
        lastPageUrl: lastPageUrl ?? this.lastPageUrl,
        nextPageUrl: nextPageUrl ?? this.nextPageUrl,
        data: data ?? this.data);
  }

  ExpenseResponsePagedResponse copyWithWrapped(
      {Wrapped<int?>? totalCount,
      Wrapped<String?>? firstPageUrl,
      Wrapped<String?>? lastPageUrl,
      Wrapped<String?>? nextPageUrl,
      Wrapped<List<ExpenseResponse>?>? data}) {
    return ExpenseResponsePagedResponse(
        totalCount: (totalCount != null ? totalCount.value : this.totalCount),
        firstPageUrl:
            (firstPageUrl != null ? firstPageUrl.value : this.firstPageUrl),
        lastPageUrl:
            (lastPageUrl != null ? lastPageUrl.value : this.lastPageUrl),
        nextPageUrl:
            (nextPageUrl != null ? nextPageUrl.value : this.nextPageUrl),
        data: (data != null ? data.value : this.data));
  }
}

@JsonSerializable(explicitToJson: true)
class ExpenseTypeResponse {
  ExpenseTypeResponse({
    this.id,
    this.name,
  });

  factory ExpenseTypeResponse.fromJson(Map<String, dynamic> json) =>
      _$ExpenseTypeResponseFromJson(json);

  static const toJsonFactory = _$ExpenseTypeResponseToJson;
  Map<String, dynamic> toJson() => _$ExpenseTypeResponseToJson(this);

  @JsonKey(
    name: 'id',
    toJson: expenseTypeIdToJson,
    fromJson: expenseTypeIdFromJson,
  )
  final enums.ExpenseTypeId? id;
  @JsonKey(name: 'name')
  final String? name;
  static const fromJsonFactory = _$ExpenseTypeResponseFromJson;

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is ExpenseTypeResponse &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(name) ^
      runtimeType.hashCode;
}

extension $ExpenseTypeResponseExtension on ExpenseTypeResponse {
  ExpenseTypeResponse copyWith({enums.ExpenseTypeId? id, String? name}) {
    return ExpenseTypeResponse(id: id ?? this.id, name: name ?? this.name);
  }

  ExpenseTypeResponse copyWithWrapped(
      {Wrapped<enums.ExpenseTypeId?>? id, Wrapped<String?>? name}) {
    return ExpenseTypeResponse(
        id: (id != null ? id.value : this.id),
        name: (name != null ? name.value : this.name));
  }
}

@JsonSerializable(explicitToJson: true)
class GroupResponse {
  GroupResponse({
    this.groupId,
    this.groupName,
    this.participants,
  });

  factory GroupResponse.fromJson(Map<String, dynamic> json) =>
      _$GroupResponseFromJson(json);

  static const toJsonFactory = _$GroupResponseToJson;
  Map<String, dynamic> toJson() => _$GroupResponseToJson(this);

  @JsonKey(name: 'groupId')
  final String? groupId;
  @JsonKey(name: 'groupName')
  final String? groupName;
  @JsonKey(name: 'participants', defaultValue: <UserFriendResponse>[])
  final List<UserFriendResponse>? participants;
  static const fromJsonFactory = _$GroupResponseFromJson;

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is GroupResponse &&
            (identical(other.groupId, groupId) ||
                const DeepCollectionEquality()
                    .equals(other.groupId, groupId)) &&
            (identical(other.groupName, groupName) ||
                const DeepCollectionEquality()
                    .equals(other.groupName, groupName)) &&
            (identical(other.participants, participants) ||
                const DeepCollectionEquality()
                    .equals(other.participants, participants)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(groupId) ^
      const DeepCollectionEquality().hash(groupName) ^
      const DeepCollectionEquality().hash(participants) ^
      runtimeType.hashCode;
}

extension $GroupResponseExtension on GroupResponse {
  GroupResponse copyWith(
      {String? groupId,
      String? groupName,
      List<UserFriendResponse>? participants}) {
    return GroupResponse(
        groupId: groupId ?? this.groupId,
        groupName: groupName ?? this.groupName,
        participants: participants ?? this.participants);
  }

  GroupResponse copyWithWrapped(
      {Wrapped<String?>? groupId,
      Wrapped<String?>? groupName,
      Wrapped<List<UserFriendResponse>?>? participants}) {
    return GroupResponse(
        groupId: (groupId != null ? groupId.value : this.groupId),
        groupName: (groupName != null ? groupName.value : this.groupName),
        participants:
            (participants != null ? participants.value : this.participants));
  }
}

@JsonSerializable(explicitToJson: true)
class GroupResponsePagedResponse {
  GroupResponsePagedResponse({
    this.totalCount,
    this.firstPageUrl,
    this.lastPageUrl,
    this.nextPageUrl,
    this.data,
  });

  factory GroupResponsePagedResponse.fromJson(Map<String, dynamic> json) =>
      _$GroupResponsePagedResponseFromJson(json);

  static const toJsonFactory = _$GroupResponsePagedResponseToJson;
  Map<String, dynamic> toJson() => _$GroupResponsePagedResponseToJson(this);

  @JsonKey(name: 'totalCount')
  final int? totalCount;
  @JsonKey(name: 'firstPageUrl')
  final String? firstPageUrl;
  @JsonKey(name: 'lastPageUrl')
  final String? lastPageUrl;
  @JsonKey(name: 'nextPageUrl')
  final String? nextPageUrl;
  @JsonKey(name: 'data', defaultValue: <GroupResponse>[])
  final List<GroupResponse>? data;
  static const fromJsonFactory = _$GroupResponsePagedResponseFromJson;

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is GroupResponsePagedResponse &&
            (identical(other.totalCount, totalCount) ||
                const DeepCollectionEquality()
                    .equals(other.totalCount, totalCount)) &&
            (identical(other.firstPageUrl, firstPageUrl) ||
                const DeepCollectionEquality()
                    .equals(other.firstPageUrl, firstPageUrl)) &&
            (identical(other.lastPageUrl, lastPageUrl) ||
                const DeepCollectionEquality()
                    .equals(other.lastPageUrl, lastPageUrl)) &&
            (identical(other.nextPageUrl, nextPageUrl) ||
                const DeepCollectionEquality()
                    .equals(other.nextPageUrl, nextPageUrl)) &&
            (identical(other.data, data) ||
                const DeepCollectionEquality().equals(other.data, data)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(totalCount) ^
      const DeepCollectionEquality().hash(firstPageUrl) ^
      const DeepCollectionEquality().hash(lastPageUrl) ^
      const DeepCollectionEquality().hash(nextPageUrl) ^
      const DeepCollectionEquality().hash(data) ^
      runtimeType.hashCode;
}

extension $GroupResponsePagedResponseExtension on GroupResponsePagedResponse {
  GroupResponsePagedResponse copyWith(
      {int? totalCount,
      String? firstPageUrl,
      String? lastPageUrl,
      String? nextPageUrl,
      List<GroupResponse>? data}) {
    return GroupResponsePagedResponse(
        totalCount: totalCount ?? this.totalCount,
        firstPageUrl: firstPageUrl ?? this.firstPageUrl,
        lastPageUrl: lastPageUrl ?? this.lastPageUrl,
        nextPageUrl: nextPageUrl ?? this.nextPageUrl,
        data: data ?? this.data);
  }

  GroupResponsePagedResponse copyWithWrapped(
      {Wrapped<int?>? totalCount,
      Wrapped<String?>? firstPageUrl,
      Wrapped<String?>? lastPageUrl,
      Wrapped<String?>? nextPageUrl,
      Wrapped<List<GroupResponse>?>? data}) {
    return GroupResponsePagedResponse(
        totalCount: (totalCount != null ? totalCount.value : this.totalCount),
        firstPageUrl:
            (firstPageUrl != null ? firstPageUrl.value : this.firstPageUrl),
        lastPageUrl:
            (lastPageUrl != null ? lastPageUrl.value : this.lastPageUrl),
        nextPageUrl:
            (nextPageUrl != null ? nextPageUrl.value : this.nextPageUrl),
        data: (data != null ? data.value : this.data));
  }
}

@JsonSerializable(explicitToJson: true)
class IconResponse {
  IconResponse({
    this.iconId,
    this.iconUrl,
  });

  factory IconResponse.fromJson(Map<String, dynamic> json) =>
      _$IconResponseFromJson(json);

  static const toJsonFactory = _$IconResponseToJson;
  Map<String, dynamic> toJson() => _$IconResponseToJson(this);

  @JsonKey(name: 'iconId')
  final String? iconId;
  @JsonKey(name: 'iconUrl')
  final String? iconUrl;
  static const fromJsonFactory = _$IconResponseFromJson;

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is IconResponse &&
            (identical(other.iconId, iconId) ||
                const DeepCollectionEquality().equals(other.iconId, iconId)) &&
            (identical(other.iconUrl, iconUrl) ||
                const DeepCollectionEquality().equals(other.iconUrl, iconUrl)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(iconId) ^
      const DeepCollectionEquality().hash(iconUrl) ^
      runtimeType.hashCode;
}

extension $IconResponseExtension on IconResponse {
  IconResponse copyWith({String? iconId, String? iconUrl}) {
    return IconResponse(
        iconId: iconId ?? this.iconId, iconUrl: iconUrl ?? this.iconUrl);
  }

  IconResponse copyWithWrapped(
      {Wrapped<String?>? iconId, Wrapped<String?>? iconUrl}) {
    return IconResponse(
        iconId: (iconId != null ? iconId.value : this.iconId),
        iconUrl: (iconUrl != null ? iconUrl.value : this.iconUrl));
  }
}

@JsonSerializable(explicitToJson: true)
class RefreshJwtTokenDto {
  RefreshJwtTokenDto({
    this.refreshToken,
  });

  factory RefreshJwtTokenDto.fromJson(Map<String, dynamic> json) =>
      _$RefreshJwtTokenDtoFromJson(json);

  static const toJsonFactory = _$RefreshJwtTokenDtoToJson;
  Map<String, dynamic> toJson() => _$RefreshJwtTokenDtoToJson(this);

  @JsonKey(name: 'refreshToken')
  final String? refreshToken;
  static const fromJsonFactory = _$RefreshJwtTokenDtoFromJson;

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is RefreshJwtTokenDto &&
            (identical(other.refreshToken, refreshToken) ||
                const DeepCollectionEquality()
                    .equals(other.refreshToken, refreshToken)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(refreshToken) ^ runtimeType.hashCode;
}

extension $RefreshJwtTokenDtoExtension on RefreshJwtTokenDto {
  RefreshJwtTokenDto copyWith({String? refreshToken}) {
    return RefreshJwtTokenDto(refreshToken: refreshToken ?? this.refreshToken);
  }

  RefreshJwtTokenDto copyWithWrapped({Wrapped<String?>? refreshToken}) {
    return RefreshJwtTokenDto(
        refreshToken:
            (refreshToken != null ? refreshToken.value : this.refreshToken));
  }
}

@JsonSerializable(explicitToJson: true)
class RelatedCustomerResponse {
  RelatedCustomerResponse({
    this.userId,
    this.userName,
    this.avatarUrl,
    this.isFriend,
  });

  factory RelatedCustomerResponse.fromJson(Map<String, dynamic> json) =>
      _$RelatedCustomerResponseFromJson(json);

  static const toJsonFactory = _$RelatedCustomerResponseToJson;
  Map<String, dynamic> toJson() => _$RelatedCustomerResponseToJson(this);

  @JsonKey(name: 'userId')
  final String? userId;
  @JsonKey(name: 'userName')
  final String? userName;
  @JsonKey(name: 'avatarUrl')
  final String? avatarUrl;
  @JsonKey(name: 'isFriend')
  final bool? isFriend;
  static const fromJsonFactory = _$RelatedCustomerResponseFromJson;

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is RelatedCustomerResponse &&
            (identical(other.userId, userId) ||
                const DeepCollectionEquality().equals(other.userId, userId)) &&
            (identical(other.userName, userName) ||
                const DeepCollectionEquality()
                    .equals(other.userName, userName)) &&
            (identical(other.avatarUrl, avatarUrl) ||
                const DeepCollectionEquality()
                    .equals(other.avatarUrl, avatarUrl)) &&
            (identical(other.isFriend, isFriend) ||
                const DeepCollectionEquality()
                    .equals(other.isFriend, isFriend)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(userId) ^
      const DeepCollectionEquality().hash(userName) ^
      const DeepCollectionEquality().hash(avatarUrl) ^
      const DeepCollectionEquality().hash(isFriend) ^
      runtimeType.hashCode;
}

extension $RelatedCustomerResponseExtension on RelatedCustomerResponse {
  RelatedCustomerResponse copyWith(
      {String? userId, String? userName, String? avatarUrl, bool? isFriend}) {
    return RelatedCustomerResponse(
        userId: userId ?? this.userId,
        userName: userName ?? this.userName,
        avatarUrl: avatarUrl ?? this.avatarUrl,
        isFriend: isFriend ?? this.isFriend);
  }

  RelatedCustomerResponse copyWithWrapped(
      {Wrapped<String?>? userId,
      Wrapped<String?>? userName,
      Wrapped<String?>? avatarUrl,
      Wrapped<bool?>? isFriend}) {
    return RelatedCustomerResponse(
        userId: (userId != null ? userId.value : this.userId),
        userName: (userName != null ? userName.value : this.userName),
        avatarUrl: (avatarUrl != null ? avatarUrl.value : this.avatarUrl),
        isFriend: (isFriend != null ? isFriend.value : this.isFriend));
  }
}

@JsonSerializable(explicitToJson: true)
class RelatedCustomerResponsePagedResponse {
  RelatedCustomerResponsePagedResponse({
    this.totalCount,
    this.firstPageUrl,
    this.lastPageUrl,
    this.nextPageUrl,
    this.data,
  });

  factory RelatedCustomerResponsePagedResponse.fromJson(
          Map<String, dynamic> json) =>
      _$RelatedCustomerResponsePagedResponseFromJson(json);

  static const toJsonFactory = _$RelatedCustomerResponsePagedResponseToJson;
  Map<String, dynamic> toJson() =>
      _$RelatedCustomerResponsePagedResponseToJson(this);

  @JsonKey(name: 'totalCount')
  final int? totalCount;
  @JsonKey(name: 'firstPageUrl')
  final String? firstPageUrl;
  @JsonKey(name: 'lastPageUrl')
  final String? lastPageUrl;
  @JsonKey(name: 'nextPageUrl')
  final String? nextPageUrl;
  @JsonKey(name: 'data', defaultValue: <RelatedCustomerResponse>[])
  final List<RelatedCustomerResponse>? data;
  static const fromJsonFactory = _$RelatedCustomerResponsePagedResponseFromJson;

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is RelatedCustomerResponsePagedResponse &&
            (identical(other.totalCount, totalCount) ||
                const DeepCollectionEquality()
                    .equals(other.totalCount, totalCount)) &&
            (identical(other.firstPageUrl, firstPageUrl) ||
                const DeepCollectionEquality()
                    .equals(other.firstPageUrl, firstPageUrl)) &&
            (identical(other.lastPageUrl, lastPageUrl) ||
                const DeepCollectionEquality()
                    .equals(other.lastPageUrl, lastPageUrl)) &&
            (identical(other.nextPageUrl, nextPageUrl) ||
                const DeepCollectionEquality()
                    .equals(other.nextPageUrl, nextPageUrl)) &&
            (identical(other.data, data) ||
                const DeepCollectionEquality().equals(other.data, data)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(totalCount) ^
      const DeepCollectionEquality().hash(firstPageUrl) ^
      const DeepCollectionEquality().hash(lastPageUrl) ^
      const DeepCollectionEquality().hash(nextPageUrl) ^
      const DeepCollectionEquality().hash(data) ^
      runtimeType.hashCode;
}

extension $RelatedCustomerResponsePagedResponseExtension
    on RelatedCustomerResponsePagedResponse {
  RelatedCustomerResponsePagedResponse copyWith(
      {int? totalCount,
      String? firstPageUrl,
      String? lastPageUrl,
      String? nextPageUrl,
      List<RelatedCustomerResponse>? data}) {
    return RelatedCustomerResponsePagedResponse(
        totalCount: totalCount ?? this.totalCount,
        firstPageUrl: firstPageUrl ?? this.firstPageUrl,
        lastPageUrl: lastPageUrl ?? this.lastPageUrl,
        nextPageUrl: nextPageUrl ?? this.nextPageUrl,
        data: data ?? this.data);
  }

  RelatedCustomerResponsePagedResponse copyWithWrapped(
      {Wrapped<int?>? totalCount,
      Wrapped<String?>? firstPageUrl,
      Wrapped<String?>? lastPageUrl,
      Wrapped<String?>? nextPageUrl,
      Wrapped<List<RelatedCustomerResponse>?>? data}) {
    return RelatedCustomerResponsePagedResponse(
        totalCount: (totalCount != null ? totalCount.value : this.totalCount),
        firstPageUrl:
            (firstPageUrl != null ? firstPageUrl.value : this.firstPageUrl),
        lastPageUrl:
            (lastPageUrl != null ? lastPageUrl.value : this.lastPageUrl),
        nextPageUrl:
            (nextPageUrl != null ? nextPageUrl.value : this.nextPageUrl),
        data: (data != null ? data.value : this.data));
  }
}

@JsonSerializable(explicitToJson: true)
class Report {
  Report({
    this.totalSpendings,
    this.expenseCount,
    this.categoriesSpendings,
  });

  factory Report.fromJson(Map<String, dynamic> json) => _$ReportFromJson(json);

  static const toJsonFactory = _$ReportToJson;
  Map<String, dynamic> toJson() => _$ReportToJson(this);

  @JsonKey(name: 'totalSpendings')
  final double? totalSpendings;
  @JsonKey(name: 'expenseCount')
  final int? expenseCount;
  @JsonKey(name: 'categoriesSpendings', defaultValue: <CategorySpend>[])
  final List<CategorySpend>? categoriesSpendings;
  static const fromJsonFactory = _$ReportFromJson;

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is Report &&
            (identical(other.totalSpendings, totalSpendings) ||
                const DeepCollectionEquality()
                    .equals(other.totalSpendings, totalSpendings)) &&
            (identical(other.expenseCount, expenseCount) ||
                const DeepCollectionEquality()
                    .equals(other.expenseCount, expenseCount)) &&
            (identical(other.categoriesSpendings, categoriesSpendings) ||
                const DeepCollectionEquality()
                    .equals(other.categoriesSpendings, categoriesSpendings)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(totalSpendings) ^
      const DeepCollectionEquality().hash(expenseCount) ^
      const DeepCollectionEquality().hash(categoriesSpendings) ^
      runtimeType.hashCode;
}

extension $ReportExtension on Report {
  Report copyWith(
      {double? totalSpendings,
      int? expenseCount,
      List<CategorySpend>? categoriesSpendings}) {
    return Report(
        totalSpendings: totalSpendings ?? this.totalSpendings,
        expenseCount: expenseCount ?? this.expenseCount,
        categoriesSpendings: categoriesSpendings ?? this.categoriesSpendings);
  }

  Report copyWithWrapped(
      {Wrapped<double?>? totalSpendings,
      Wrapped<int?>? expenseCount,
      Wrapped<List<CategorySpend>?>? categoriesSpendings}) {
    return Report(
        totalSpendings: (totalSpendings != null
            ? totalSpendings.value
            : this.totalSpendings),
        expenseCount:
            (expenseCount != null ? expenseCount.value : this.expenseCount),
        categoriesSpendings: (categoriesSpendings != null
            ? categoriesSpendings.value
            : this.categoriesSpendings));
  }
}

@JsonSerializable(explicitToJson: true)
class ShortExpenseResponse {
  ShortExpenseResponse({
    this.expenseId,
    this.amount,
    this.expenseType,
    this.category,
    this.dateTime,
  });

  factory ShortExpenseResponse.fromJson(Map<String, dynamic> json) =>
      _$ShortExpenseResponseFromJson(json);

  static const toJsonFactory = _$ShortExpenseResponseToJson;
  Map<String, dynamic> toJson() => _$ShortExpenseResponseToJson(this);

  @JsonKey(name: 'expenseId')
  final String? expenseId;
  @JsonKey(name: 'amount')
  final double? amount;
  @JsonKey(name: 'expenseType')
  final ExpenseTypeResponse? expenseType;
  @JsonKey(name: 'category')
  final ExpenseCategoryResponse? category;
  @JsonKey(name: 'dateTime')
  final String? dateTime;
  static const fromJsonFactory = _$ShortExpenseResponseFromJson;

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is ShortExpenseResponse &&
            (identical(other.expenseId, expenseId) ||
                const DeepCollectionEquality()
                    .equals(other.expenseId, expenseId)) &&
            (identical(other.amount, amount) ||
                const DeepCollectionEquality().equals(other.amount, amount)) &&
            (identical(other.expenseType, expenseType) ||
                const DeepCollectionEquality()
                    .equals(other.expenseType, expenseType)) &&
            (identical(other.category, category) ||
                const DeepCollectionEquality()
                    .equals(other.category, category)) &&
            (identical(other.dateTime, dateTime) ||
                const DeepCollectionEquality()
                    .equals(other.dateTime, dateTime)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(expenseId) ^
      const DeepCollectionEquality().hash(amount) ^
      const DeepCollectionEquality().hash(expenseType) ^
      const DeepCollectionEquality().hash(category) ^
      const DeepCollectionEquality().hash(dateTime) ^
      runtimeType.hashCode;
}

extension $ShortExpenseResponseExtension on ShortExpenseResponse {
  ShortExpenseResponse copyWith(
      {String? expenseId,
      double? amount,
      ExpenseTypeResponse? expenseType,
      ExpenseCategoryResponse? category,
      String? dateTime}) {
    return ShortExpenseResponse(
        expenseId: expenseId ?? this.expenseId,
        amount: amount ?? this.amount,
        expenseType: expenseType ?? this.expenseType,
        category: category ?? this.category,
        dateTime: dateTime ?? this.dateTime);
  }

  ShortExpenseResponse copyWithWrapped(
      {Wrapped<String?>? expenseId,
      Wrapped<double?>? amount,
      Wrapped<ExpenseTypeResponse?>? expenseType,
      Wrapped<ExpenseCategoryResponse?>? category,
      Wrapped<String?>? dateTime}) {
    return ShortExpenseResponse(
        expenseId: (expenseId != null ? expenseId.value : this.expenseId),
        amount: (amount != null ? amount.value : this.amount),
        expenseType:
            (expenseType != null ? expenseType.value : this.expenseType),
        category: (category != null ? category.value : this.category),
        dateTime: (dateTime != null ? dateTime.value : this.dateTime));
  }
}

@JsonSerializable(explicitToJson: true)
class SignInUserCredentials {
  SignInUserCredentials({
    this.username,
    this.password,
  });

  factory SignInUserCredentials.fromJson(Map<String, dynamic> json) =>
      _$SignInUserCredentialsFromJson(json);

  static const toJsonFactory = _$SignInUserCredentialsToJson;
  Map<String, dynamic> toJson() => _$SignInUserCredentialsToJson(this);

  @JsonKey(name: 'username')
  final String? username;
  @JsonKey(name: 'password')
  final String? password;
  static const fromJsonFactory = _$SignInUserCredentialsFromJson;

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is SignInUserCredentials &&
            (identical(other.username, username) ||
                const DeepCollectionEquality()
                    .equals(other.username, username)) &&
            (identical(other.password, password) ||
                const DeepCollectionEquality()
                    .equals(other.password, password)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(username) ^
      const DeepCollectionEquality().hash(password) ^
      runtimeType.hashCode;
}

extension $SignInUserCredentialsExtension on SignInUserCredentials {
  SignInUserCredentials copyWith({String? username, String? password}) {
    return SignInUserCredentials(
        username: username ?? this.username,
        password: password ?? this.password);
  }

  SignInUserCredentials copyWithWrapped(
      {Wrapped<String?>? username, Wrapped<String?>? password}) {
    return SignInUserCredentials(
        username: (username != null ? username.value : this.username),
        password: (password != null ? password.value : this.password));
  }
}

@JsonSerializable(explicitToJson: true)
class SignUpUserCredentials {
  SignUpUserCredentials({
    this.email,
    this.password,
    this.username,
  });

  factory SignUpUserCredentials.fromJson(Map<String, dynamic> json) =>
      _$SignUpUserCredentialsFromJson(json);

  static const toJsonFactory = _$SignUpUserCredentialsToJson;
  Map<String, dynamic> toJson() => _$SignUpUserCredentialsToJson(this);

  @JsonKey(name: 'email')
  final String? email;
  @JsonKey(name: 'password')
  final String? password;
  @JsonKey(name: 'username')
  final String? username;
  static const fromJsonFactory = _$SignUpUserCredentialsFromJson;

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is SignUpUserCredentials &&
            (identical(other.email, email) ||
                const DeepCollectionEquality().equals(other.email, email)) &&
            (identical(other.password, password) ||
                const DeepCollectionEquality()
                    .equals(other.password, password)) &&
            (identical(other.username, username) ||
                const DeepCollectionEquality()
                    .equals(other.username, username)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(email) ^
      const DeepCollectionEquality().hash(password) ^
      const DeepCollectionEquality().hash(username) ^
      runtimeType.hashCode;
}

extension $SignUpUserCredentialsExtension on SignUpUserCredentials {
  SignUpUserCredentials copyWith(
      {String? email, String? password, String? username}) {
    return SignUpUserCredentials(
        email: email ?? this.email,
        password: password ?? this.password,
        username: username ?? this.username);
  }

  SignUpUserCredentials copyWithWrapped(
      {Wrapped<String?>? email,
      Wrapped<String?>? password,
      Wrapped<String?>? username}) {
    return SignUpUserCredentials(
        email: (email != null ? email.value : this.email),
        password: (password != null ? password.value : this.password),
        username: (username != null ? username.value : this.username));
  }
}

@JsonSerializable(explicitToJson: true)
class UpdateExpenseCategoryRequest {
  UpdateExpenseCategoryRequest({
    this.name,
  });

  factory UpdateExpenseCategoryRequest.fromJson(Map<String, dynamic> json) =>
      _$UpdateExpenseCategoryRequestFromJson(json);

  static const toJsonFactory = _$UpdateExpenseCategoryRequestToJson;
  Map<String, dynamic> toJson() => _$UpdateExpenseCategoryRequestToJson(this);

  @JsonKey(name: 'name')
  final String? name;
  static const fromJsonFactory = _$UpdateExpenseCategoryRequestFromJson;

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is UpdateExpenseCategoryRequest &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(name) ^ runtimeType.hashCode;
}

extension $UpdateExpenseCategoryRequestExtension
    on UpdateExpenseCategoryRequest {
  UpdateExpenseCategoryRequest copyWith({String? name}) {
    return UpdateExpenseCategoryRequest(name: name ?? this.name);
  }

  UpdateExpenseCategoryRequest copyWithWrapped({Wrapped<String?>? name}) {
    return UpdateExpenseCategoryRequest(
        name: (name != null ? name.value : this.name));
  }
}

@JsonSerializable(explicitToJson: true)
class UserFriendResponse {
  UserFriendResponse({
    this.userId,
    this.userName,
    this.userAvatarUrl,
  });

  factory UserFriendResponse.fromJson(Map<String, dynamic> json) =>
      _$UserFriendResponseFromJson(json);

  static const toJsonFactory = _$UserFriendResponseToJson;
  Map<String, dynamic> toJson() => _$UserFriendResponseToJson(this);

  @JsonKey(name: 'userId')
  final String? userId;
  @JsonKey(name: 'userName')
  final String? userName;
  @JsonKey(name: 'userAvatarUrl')
  final String? userAvatarUrl;
  static const fromJsonFactory = _$UserFriendResponseFromJson;

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is UserFriendResponse &&
            (identical(other.userId, userId) ||
                const DeepCollectionEquality().equals(other.userId, userId)) &&
            (identical(other.userName, userName) ||
                const DeepCollectionEquality()
                    .equals(other.userName, userName)) &&
            (identical(other.userAvatarUrl, userAvatarUrl) ||
                const DeepCollectionEquality()
                    .equals(other.userAvatarUrl, userAvatarUrl)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(userId) ^
      const DeepCollectionEquality().hash(userName) ^
      const DeepCollectionEquality().hash(userAvatarUrl) ^
      runtimeType.hashCode;
}

extension $UserFriendResponseExtension on UserFriendResponse {
  UserFriendResponse copyWith(
      {String? userId, String? userName, String? userAvatarUrl}) {
    return UserFriendResponse(
        userId: userId ?? this.userId,
        userName: userName ?? this.userName,
        userAvatarUrl: userAvatarUrl ?? this.userAvatarUrl);
  }

  UserFriendResponse copyWithWrapped(
      {Wrapped<String?>? userId,
      Wrapped<String?>? userName,
      Wrapped<String?>? userAvatarUrl}) {
    return UserFriendResponse(
        userId: (userId != null ? userId.value : this.userId),
        userName: (userName != null ? userName.value : this.userName),
        userAvatarUrl:
            (userAvatarUrl != null ? userAvatarUrl.value : this.userAvatarUrl));
  }
}

@JsonSerializable(explicitToJson: true)
class UserFriendResponsePagedResponse {
  UserFriendResponsePagedResponse({
    this.totalCount,
    this.firstPageUrl,
    this.lastPageUrl,
    this.nextPageUrl,
    this.data,
  });

  factory UserFriendResponsePagedResponse.fromJson(Map<String, dynamic> json) =>
      _$UserFriendResponsePagedResponseFromJson(json);

  static const toJsonFactory = _$UserFriendResponsePagedResponseToJson;
  Map<String, dynamic> toJson() =>
      _$UserFriendResponsePagedResponseToJson(this);

  @JsonKey(name: 'totalCount')
  final int? totalCount;
  @JsonKey(name: 'firstPageUrl')
  final String? firstPageUrl;
  @JsonKey(name: 'lastPageUrl')
  final String? lastPageUrl;
  @JsonKey(name: 'nextPageUrl')
  final String? nextPageUrl;
  @JsonKey(name: 'data', defaultValue: <UserFriendResponse>[])
  final List<UserFriendResponse>? data;
  static const fromJsonFactory = _$UserFriendResponsePagedResponseFromJson;

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is UserFriendResponsePagedResponse &&
            (identical(other.totalCount, totalCount) ||
                const DeepCollectionEquality()
                    .equals(other.totalCount, totalCount)) &&
            (identical(other.firstPageUrl, firstPageUrl) ||
                const DeepCollectionEquality()
                    .equals(other.firstPageUrl, firstPageUrl)) &&
            (identical(other.lastPageUrl, lastPageUrl) ||
                const DeepCollectionEquality()
                    .equals(other.lastPageUrl, lastPageUrl)) &&
            (identical(other.nextPageUrl, nextPageUrl) ||
                const DeepCollectionEquality()
                    .equals(other.nextPageUrl, nextPageUrl)) &&
            (identical(other.data, data) ||
                const DeepCollectionEquality().equals(other.data, data)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(totalCount) ^
      const DeepCollectionEquality().hash(firstPageUrl) ^
      const DeepCollectionEquality().hash(lastPageUrl) ^
      const DeepCollectionEquality().hash(nextPageUrl) ^
      const DeepCollectionEquality().hash(data) ^
      runtimeType.hashCode;
}

extension $UserFriendResponsePagedResponseExtension
    on UserFriendResponsePagedResponse {
  UserFriendResponsePagedResponse copyWith(
      {int? totalCount,
      String? firstPageUrl,
      String? lastPageUrl,
      String? nextPageUrl,
      List<UserFriendResponse>? data}) {
    return UserFriendResponsePagedResponse(
        totalCount: totalCount ?? this.totalCount,
        firstPageUrl: firstPageUrl ?? this.firstPageUrl,
        lastPageUrl: lastPageUrl ?? this.lastPageUrl,
        nextPageUrl: nextPageUrl ?? this.nextPageUrl,
        data: data ?? this.data);
  }

  UserFriendResponsePagedResponse copyWithWrapped(
      {Wrapped<int?>? totalCount,
      Wrapped<String?>? firstPageUrl,
      Wrapped<String?>? lastPageUrl,
      Wrapped<String?>? nextPageUrl,
      Wrapped<List<UserFriendResponse>?>? data}) {
    return UserFriendResponsePagedResponse(
        totalCount: (totalCount != null ? totalCount.value : this.totalCount),
        firstPageUrl:
            (firstPageUrl != null ? firstPageUrl.value : this.firstPageUrl),
        lastPageUrl:
            (lastPageUrl != null ? lastPageUrl.value : this.lastPageUrl),
        nextPageUrl:
            (nextPageUrl != null ? nextPageUrl.value : this.nextPageUrl),
        data: (data != null ? data.value : this.data));
  }
}

String? expenseTypeIdToJson(enums.ExpenseTypeId? expenseTypeId) {
  return expenseTypeId?.value;
}

enums.ExpenseTypeId expenseTypeIdFromJson(
  Object? expenseTypeId, [
  enums.ExpenseTypeId? defaultValue,
]) {
  return enums.ExpenseTypeId.values
          .firstWhereOrNull((e) => e.value == expenseTypeId) ??
      defaultValue ??
      enums.ExpenseTypeId.swaggerGeneratedUnknown;
}

List<String> expenseTypeIdListToJson(List<enums.ExpenseTypeId>? expenseTypeId) {
  if (expenseTypeId == null) {
    return [];
  }

  return expenseTypeId.map((e) => e.value!).toList();
}

List<enums.ExpenseTypeId> expenseTypeIdListFromJson(
  List? expenseTypeId, [
  List<enums.ExpenseTypeId>? defaultValue,
]) {
  if (expenseTypeId == null) {
    return defaultValue ?? [];
  }

  return expenseTypeId.map((e) => expenseTypeIdFromJson(e.toString())).toList();
}

List<enums.ExpenseTypeId>? expenseTypeIdNullableListFromJson(
  List? expenseTypeId, [
  List<enums.ExpenseTypeId>? defaultValue,
]) {
  if (expenseTypeId == null) {
    return defaultValue;
  }

  return expenseTypeId.map((e) => expenseTypeIdFromJson(e.toString())).toList();
}

typedef $JsonFactory<T> = T Function(Map<String, dynamic> json);

class $CustomJsonDecoder {
  $CustomJsonDecoder(this.factories);

  final Map<Type, $JsonFactory> factories;

  dynamic decode<T>(dynamic entity) {
    if (entity is Iterable) {
      return _decodeList<T>(entity);
    }

    if (entity is T) {
      return entity;
    }

    if (isTypeOf<T, Map>()) {
      return entity;
    }

    if (isTypeOf<T, Iterable>()) {
      return entity;
    }

    if (entity is Map<String, dynamic>) {
      return _decodeMap<T>(entity);
    }

    return entity;
  }

  T _decodeMap<T>(Map<String, dynamic> values) {
    final jsonFactory = factories[T];
    if (jsonFactory == null || jsonFactory is! $JsonFactory<T>) {
      return throw "Could not find factory for type $T. Is '$T: $T.fromJsonFactory' included in the CustomJsonDecoder instance creation in bootstrapper.dart?";
    }

    return jsonFactory(values);
  }

  List<T> _decodeList<T>(Iterable values) =>
      values.where((v) => v != null).map<T>((v) => decode<T>(v) as T).toList();
}

class $JsonSerializableConverter extends chopper.JsonConverter {
  @override
  FutureOr<chopper.Response<ResultType>> convertResponse<ResultType, Item>(
      chopper.Response response) async {
    if (response.bodyString.isEmpty) {
      // In rare cases, when let's say 204 (no content) is returned -
      // we cannot decode the missing json with the result type specified
      return chopper.Response(response.base, null, error: response.error);
    }

    final jsonRes = await super.convertResponse(response);
    return jsonRes.copyWith<ResultType>(
        body: $jsonDecoder.decode<Item>(jsonRes.body) as ResultType);
  }
}

final $jsonDecoder = $CustomJsonDecoder(generatedMapping);

// ignore: unused_element
String? _dateToJson(DateTime? date) {
  if (date == null) {
    return null;
  }

  final year = date.year.toString();
  final month = date.month < 10 ? '0${date.month}' : date.month.toString();
  final day = date.day < 10 ? '0${date.day}' : date.day.toString();

  return '$year-$month-$day';
}

class Wrapped<T> {
  final T value;
  const Wrapped.value(this.value);
}
