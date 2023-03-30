// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bill_share.swagger.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddExpenseItemRequest _$AddExpenseItemRequestFromJson(
        Map<String, dynamic> json) =>
    AddExpenseItemRequest(
      name: json['name'] as String?,
      count: json['count'] as int?,
      amount: (json['amount'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$AddExpenseItemRequestToJson(
        AddExpenseItemRequest instance) =>
    <String, dynamic>{
      'name': instance.name,
      'count': instance.count,
      'amount': instance.amount,
    };

AddExpenseParticipantRequest _$AddExpenseParticipantRequestFromJson(
        Map<String, dynamic> json) =>
    AddExpenseParticipantRequest(
      userId: json['userId'] as String?,
    );

Map<String, dynamic> _$AddExpenseParticipantRequestToJson(
        AddExpenseParticipantRequest instance) =>
    <String, dynamic>{
      'userId': instance.userId,
    };

AuthenticationToken _$AuthenticationTokenFromJson(Map<String, dynamic> json) =>
    AuthenticationToken(
      accessToken: json['accessToken'] as String?,
      refreshToken: json['refreshToken'] as String?,
    );

Map<String, dynamic> _$AuthenticationTokenToJson(
        AuthenticationToken instance) =>
    <String, dynamic>{
      'accessToken': instance.accessToken,
      'refreshToken': instance.refreshToken,
    };

CreateExpenseCategoryRequest _$CreateExpenseCategoryRequestFromJson(
        Map<String, dynamic> json) =>
    CreateExpenseCategoryRequest(
      categoryName: json['categoryName'] as String?,
      iconId: json['iconId'] as String?,
    );

Map<String, dynamic> _$CreateExpenseCategoryRequestToJson(
        CreateExpenseCategoryRequest instance) =>
    <String, dynamic>{
      'categoryName': instance.categoryName,
      'iconId': instance.iconId,
    };

CreateExpenseMultiplierRequest _$CreateExpenseMultiplierRequestFromJson(
        Map<String, dynamic> json) =>
    CreateExpenseMultiplierRequest(
      name: json['name'] as String?,
      costMultiplierPercent: json['costMultiplierPercent'] as int?,
    );

Map<String, dynamic> _$CreateExpenseMultiplierRequestToJson(
        CreateExpenseMultiplierRequest instance) =>
    <String, dynamic>{
      'name': instance.name,
      'costMultiplierPercent': instance.costMultiplierPercent,
    };

CreateExpenseRequest _$CreateExpenseRequestFromJson(
        Map<String, dynamic> json) =>
    CreateExpenseRequest(
      expenseTypeId: expenseTypeIdFromJson(json['expenseTypeId']),
      categoryId: json['categoryId'] as String?,
      accountId: json['accountId'] as String?,
      amount: json['amount'] as int?,
      participants: (json['participants'] as List<dynamic>?)
              ?.map((e) => AddExpenseParticipantRequest.fromJson(
                  e as Map<String, dynamic>))
              .toList() ??
          [],
      items: (json['items'] as List<dynamic>?)
              ?.map((e) =>
                  AddExpenseItemRequest.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      multipliers: (json['multipliers'] as List<dynamic>?)
              ?.map((e) => CreateExpenseMultiplierRequest.fromJson(
                  e as Map<String, dynamic>))
              .toList() ??
          [],
    );

Map<String, dynamic> _$CreateExpenseRequestToJson(
        CreateExpenseRequest instance) =>
    <String, dynamic>{
      'expenseTypeId': expenseTypeIdToJson(instance.expenseTypeId),
      'categoryId': instance.categoryId,
      'accountId': instance.accountId,
      'amount': instance.amount,
      'participants': instance.participants?.map((e) => e.toJson()).toList(),
      'items': instance.items?.map((e) => e.toJson()).toList(),
      'multipliers': instance.multipliers?.map((e) => e.toJson()).toList(),
    };

CreateFriendshipRequestDto _$CreateFriendshipRequestDtoFromJson(
        Map<String, dynamic> json) =>
    CreateFriendshipRequestDto(
      userId: json['userId'] as String?,
    );

Map<String, dynamic> _$CreateFriendshipRequestDtoToJson(
        CreateFriendshipRequestDto instance) =>
    <String, dynamic>{
      'userId': instance.userId,
    };

CreateIconDto _$CreateIconDtoFromJson(Map<String, dynamic> json) =>
    CreateIconDto(
      iconImageData: json['iconImageData'] as String?,
      extension: json['extension'] as String?,
    );

Map<String, dynamic> _$CreateIconDtoToJson(CreateIconDto instance) =>
    <String, dynamic>{
      'iconImageData': instance.iconImageData,
      'extension': instance.extension,
    };

CustomerResponse _$CustomerResponseFromJson(Map<String, dynamic> json) =>
    CustomerResponse(
      id: json['id'] as String?,
      email: json['email'] as String?,
      name: json['name'] as String?,
      avatarUrl: json['avatarUrl'] as String?,
    );

Map<String, dynamic> _$CustomerResponseToJson(CustomerResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'email': instance.email,
      'name': instance.name,
      'avatarUrl': instance.avatarUrl,
    };

ExpenseCategoryResponse _$ExpenseCategoryResponseFromJson(
        Map<String, dynamic> json) =>
    ExpenseCategoryResponse(
      id: json['id'] as String?,
      name: json['name'] as String?,
      iconUrl: json['iconUrl'] as String?,
    );

Map<String, dynamic> _$ExpenseCategoryResponseToJson(
        ExpenseCategoryResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'iconUrl': instance.iconUrl,
    };

ExpenseItemActionResponse _$ExpenseItemActionResponseFromJson(
        Map<String, dynamic> json) =>
    ExpenseItemActionResponse(
      selectItemUrl: json['selectItemUrl'] as String?,
      unselectItemUrl: json['unselectItemUrl'] as String?,
      deleteItemUrl: json['deleteItemUrl'] as String?,
    );

Map<String, dynamic> _$ExpenseItemActionResponseToJson(
        ExpenseItemActionResponse instance) =>
    <String, dynamic>{
      'selectItemUrl': instance.selectItemUrl,
      'unselectItemUrl': instance.unselectItemUrl,
      'deleteItemUrl': instance.deleteItemUrl,
    };

ExpenseItemResponse _$ExpenseItemResponseFromJson(Map<String, dynamic> json) =>
    ExpenseItemResponse(
      id: json['id'] as String?,
      name: json['name'] as String?,
      count: json['count'] as int?,
      amount: json['amount'] as int?,
      selectedByParticipants: (json['selectedByParticipants'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          [],
      actions: json['actions'] == null
          ? null
          : ExpenseItemActionResponse.fromJson(
              json['actions'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ExpenseItemResponseToJson(
        ExpenseItemResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'count': instance.count,
      'amount': instance.amount,
      'selectedByParticipants': instance.selectedByParticipants,
      'actions': instance.actions?.toJson(),
    };

ExpenseMultiplierResponse _$ExpenseMultiplierResponseFromJson(
        Map<String, dynamic> json) =>
    ExpenseMultiplierResponse(
      id: json['id'] as String?,
      name: json['name'] as String?,
      costMultiplierPercent: json['costMultiplierPercent'] as int?,
    );

Map<String, dynamic> _$ExpenseMultiplierResponseToJson(
        ExpenseMultiplierResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'costMultiplierPercent': instance.costMultiplierPercent,
    };

ExpenseParticipantActionResponse _$ExpenseParticipantActionResponseFromJson(
        Map<String, dynamic> json) =>
    ExpenseParticipantActionResponse(
      removeParticipantUrl: json['removeParticipantUrl'] as String?,
    );

Map<String, dynamic> _$ExpenseParticipantActionResponseToJson(
        ExpenseParticipantActionResponse instance) =>
    <String, dynamic>{
      'removeParticipantUrl': instance.removeParticipantUrl,
    };

ExpenseParticipantResponse _$ExpenseParticipantResponseFromJson(
        Map<String, dynamic> json) =>
    ExpenseParticipantResponse(
      participantId: json['participantId'] as String?,
      userId: json['userId'] as String?,
      name: json['name'] as String?,
      avatarUrl: json['avatarUrl'] as String?,
      actions: json['actions'] == null
          ? null
          : ExpenseParticipantActionResponse.fromJson(
              json['actions'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ExpenseParticipantResponseToJson(
        ExpenseParticipantResponse instance) =>
    <String, dynamic>{
      'participantId': instance.participantId,
      'userId': instance.userId,
      'name': instance.name,
      'avatarUrl': instance.avatarUrl,
      'actions': instance.actions?.toJson(),
    };

ExpenseResponse _$ExpenseResponseFromJson(Map<String, dynamic> json) =>
    ExpenseResponse(
      id: json['id'] as String?,
      creatorId: json['creatorId'] as String?,
      expenseType: json['expenseType'] == null
          ? null
          : ExpenseTypeResponse.fromJson(
              json['expenseType'] as Map<String, dynamic>),
      category: json['category'] == null
          ? null
          : ExpenseCategoryResponse.fromJson(
              json['category'] as Map<String, dynamic>),
      dateTime: json['dateTime'] as String?,
      participants: (json['participants'] as List<dynamic>?)
              ?.map((e) => ExpenseParticipantResponse.fromJson(
                  e as Map<String, dynamic>))
              .toList() ??
          [],
      expenseItems: (json['expenseItems'] as List<dynamic>?)
              ?.map((e) =>
                  ExpenseItemResponse.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      multipliers: (json['multipliers'] as List<dynamic>?)
              ?.map((e) =>
                  ExpenseMultiplierResponse.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
    );

Map<String, dynamic> _$ExpenseResponseToJson(ExpenseResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'creatorId': instance.creatorId,
      'expenseType': instance.expenseType?.toJson(),
      'category': instance.category?.toJson(),
      'dateTime': instance.dateTime,
      'participants': instance.participants?.map((e) => e.toJson()).toList(),
      'expenseItems': instance.expenseItems?.map((e) => e.toJson()).toList(),
      'multipliers': instance.multipliers?.map((e) => e.toJson()).toList(),
    };

ExpenseResponsePagedResponse _$ExpenseResponsePagedResponseFromJson(
        Map<String, dynamic> json) =>
    ExpenseResponsePagedResponse(
      totalCount: json['totalCount'] as int?,
      firstPageUrl: json['firstPageUrl'] as String?,
      lastPageUrl: json['lastPageUrl'] as String?,
      nextPageUrl: json['nextPageUrl'] as String?,
      data: (json['data'] as List<dynamic>?)
              ?.map((e) => ExpenseResponse.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
    );

Map<String, dynamic> _$ExpenseResponsePagedResponseToJson(
        ExpenseResponsePagedResponse instance) =>
    <String, dynamic>{
      'totalCount': instance.totalCount,
      'firstPageUrl': instance.firstPageUrl,
      'lastPageUrl': instance.lastPageUrl,
      'nextPageUrl': instance.nextPageUrl,
      'data': instance.data?.map((e) => e.toJson()).toList(),
    };

ExpenseTypeResponse _$ExpenseTypeResponseFromJson(Map<String, dynamic> json) =>
    ExpenseTypeResponse(
      id: expenseTypeIdFromJson(json['id']),
      name: json['name'] as String?,
    );

Map<String, dynamic> _$ExpenseTypeResponseToJson(
        ExpenseTypeResponse instance) =>
    <String, dynamic>{
      'id': expenseTypeIdToJson(instance.id),
      'name': instance.name,
    };

IconResponse _$IconResponseFromJson(Map<String, dynamic> json) => IconResponse(
      iconId: json['iconId'] as String?,
      iconUrl: json['iconUrl'] as String?,
    );

Map<String, dynamic> _$IconResponseToJson(IconResponse instance) =>
    <String, dynamic>{
      'iconId': instance.iconId,
      'iconUrl': instance.iconUrl,
    };

RefreshJwtTokenDto _$RefreshJwtTokenDtoFromJson(Map<String, dynamic> json) =>
    RefreshJwtTokenDto(
      refreshToken: json['refreshToken'] as String?,
    );

Map<String, dynamic> _$RefreshJwtTokenDtoToJson(RefreshJwtTokenDto instance) =>
    <String, dynamic>{
      'refreshToken': instance.refreshToken,
    };

RelatedCustomerResponse _$RelatedCustomerResponseFromJson(
        Map<String, dynamic> json) =>
    RelatedCustomerResponse(
      userId: json['userId'] as String?,
      userName: json['userName'] as String?,
      avatarUrl: json['avatarUrl'] as String?,
      isFriend: json['isFriend'] as bool?,
    );

Map<String, dynamic> _$RelatedCustomerResponseToJson(
        RelatedCustomerResponse instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'userName': instance.userName,
      'avatarUrl': instance.avatarUrl,
      'isFriend': instance.isFriend,
    };

RelatedCustomerResponsePagedResponse
    _$RelatedCustomerResponsePagedResponseFromJson(Map<String, dynamic> json) =>
        RelatedCustomerResponsePagedResponse(
          totalCount: json['totalCount'] as int?,
          firstPageUrl: json['firstPageUrl'] as String?,
          lastPageUrl: json['lastPageUrl'] as String?,
          nextPageUrl: json['nextPageUrl'] as String?,
          data: (json['data'] as List<dynamic>?)
                  ?.map((e) => RelatedCustomerResponse.fromJson(
                      e as Map<String, dynamic>))
                  .toList() ??
              [],
        );

Map<String, dynamic> _$RelatedCustomerResponsePagedResponseToJson(
        RelatedCustomerResponsePagedResponse instance) =>
    <String, dynamic>{
      'totalCount': instance.totalCount,
      'firstPageUrl': instance.firstPageUrl,
      'lastPageUrl': instance.lastPageUrl,
      'nextPageUrl': instance.nextPageUrl,
      'data': instance.data?.map((e) => e.toJson()).toList(),
    };

SignInUserCredentials _$SignInUserCredentialsFromJson(
        Map<String, dynamic> json) =>
    SignInUserCredentials(
      username: json['username'] as String?,
      password: json['password'] as String?,
    );

Map<String, dynamic> _$SignInUserCredentialsToJson(
        SignInUserCredentials instance) =>
    <String, dynamic>{
      'username': instance.username,
      'password': instance.password,
    };

SignUpUserCredentials _$SignUpUserCredentialsFromJson(
        Map<String, dynamic> json) =>
    SignUpUserCredentials(
      email: json['email'] as String?,
      password: json['password'] as String?,
      username: json['username'] as String?,
    );

Map<String, dynamic> _$SignUpUserCredentialsToJson(
        SignUpUserCredentials instance) =>
    <String, dynamic>{
      'email': instance.email,
      'password': instance.password,
      'username': instance.username,
    };

UpdateExpenseCategoryRequest _$UpdateExpenseCategoryRequestFromJson(
        Map<String, dynamic> json) =>
    UpdateExpenseCategoryRequest(
      name: json['name'] as String?,
    );

Map<String, dynamic> _$UpdateExpenseCategoryRequestToJson(
        UpdateExpenseCategoryRequest instance) =>
    <String, dynamic>{
      'name': instance.name,
    };

UserFriendResponse _$UserFriendResponseFromJson(Map<String, dynamic> json) =>
    UserFriendResponse(
      userId: json['userId'] as String?,
      userName: json['userName'] as String?,
      userAvatarUrl: json['userAvatarUrl'] as String?,
    );

Map<String, dynamic> _$UserFriendResponseToJson(UserFriendResponse instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'userName': instance.userName,
      'userAvatarUrl': instance.userAvatarUrl,
    };

UserFriendResponsePagedResponse _$UserFriendResponsePagedResponseFromJson(
        Map<String, dynamic> json) =>
    UserFriendResponsePagedResponse(
      totalCount: json['totalCount'] as int?,
      firstPageUrl: json['firstPageUrl'] as String?,
      lastPageUrl: json['lastPageUrl'] as String?,
      nextPageUrl: json['nextPageUrl'] as String?,
      data: (json['data'] as List<dynamic>?)
              ?.map(
                  (e) => UserFriendResponse.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
    );

Map<String, dynamic> _$UserFriendResponsePagedResponseToJson(
        UserFriendResponsePagedResponse instance) =>
    <String, dynamic>{
      'totalCount': instance.totalCount,
      'firstPageUrl': instance.firstPageUrl,
      'lastPageUrl': instance.lastPageUrl,
      'nextPageUrl': instance.nextPageUrl,
      'data': instance.data?.map((e) => e.toJson()).toList(),
    };
