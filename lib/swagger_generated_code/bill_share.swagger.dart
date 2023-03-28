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
  ///@param friendshipRequestId
  Future<chopper.Response> friendsFriendshipRequestIdAcceptPost(
      {required String? friendshipRequestId}) {
    return _friendsFriendshipRequestIdAcceptPost(
        friendshipRequestId: friendshipRequestId);
  }

  ///
  ///@param friendshipRequestId
  @Post(
    path: '/Friends/{friendshipRequestId}/accept',
    optionalBody: true,
  )
  Future<chopper.Response> _friendsFriendshipRequestIdAcceptPost(
      {@Path('friendshipRequestId') required String? friendshipRequestId});

  ///
  ///@param friendshipRequestId
  Future<chopper.Response> friendsFriendshipRequestIdDeclinePost(
      {required String? friendshipRequestId}) {
    return _friendsFriendshipRequestIdDeclinePost(
        friendshipRequestId: friendshipRequestId);
  }

  ///
  ///@param friendshipRequestId
  @Post(
    path: '/Friends/{friendshipRequestId}/decline',
    optionalBody: true,
  )
  Future<chopper.Response> _friendsFriendshipRequestIdDeclinePost(
      {@Path('friendshipRequestId') required String? friendshipRequestId});

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
