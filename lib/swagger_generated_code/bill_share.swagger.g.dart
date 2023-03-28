// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bill_share.swagger.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

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
