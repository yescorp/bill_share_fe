// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'friends_list_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$FriendsListState {
  List<FriendInfo> get friends => throw _privateConstructorUsedError;
  List<FriendInfo> get friendshipRequests => throw _privateConstructorUsedError;
  List<GroupInfo> get groups => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $FriendsListStateCopyWith<FriendsListState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FriendsListStateCopyWith<$Res> {
  factory $FriendsListStateCopyWith(
          FriendsListState value, $Res Function(FriendsListState) then) =
      _$FriendsListStateCopyWithImpl<$Res, FriendsListState>;
  @useResult
  $Res call(
      {List<FriendInfo> friends,
      List<FriendInfo> friendshipRequests,
      List<GroupInfo> groups});
}

/// @nodoc
class _$FriendsListStateCopyWithImpl<$Res, $Val extends FriendsListState>
    implements $FriendsListStateCopyWith<$Res> {
  _$FriendsListStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? friends = null,
    Object? friendshipRequests = null,
    Object? groups = null,
  }) {
    return _then(_value.copyWith(
      friends: null == friends
          ? _value.friends
          : friends // ignore: cast_nullable_to_non_nullable
              as List<FriendInfo>,
      friendshipRequests: null == friendshipRequests
          ? _value.friendshipRequests
          : friendshipRequests // ignore: cast_nullable_to_non_nullable
              as List<FriendInfo>,
      groups: null == groups
          ? _value.groups
          : groups // ignore: cast_nullable_to_non_nullable
              as List<GroupInfo>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_FriendsListStateCopyWith<$Res>
    implements $FriendsListStateCopyWith<$Res> {
  factory _$$_FriendsListStateCopyWith(
          _$_FriendsListState value, $Res Function(_$_FriendsListState) then) =
      __$$_FriendsListStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<FriendInfo> friends,
      List<FriendInfo> friendshipRequests,
      List<GroupInfo> groups});
}

/// @nodoc
class __$$_FriendsListStateCopyWithImpl<$Res>
    extends _$FriendsListStateCopyWithImpl<$Res, _$_FriendsListState>
    implements _$$_FriendsListStateCopyWith<$Res> {
  __$$_FriendsListStateCopyWithImpl(
      _$_FriendsListState _value, $Res Function(_$_FriendsListState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? friends = null,
    Object? friendshipRequests = null,
    Object? groups = null,
  }) {
    return _then(_$_FriendsListState(
      friends: null == friends
          ? _value._friends
          : friends // ignore: cast_nullable_to_non_nullable
              as List<FriendInfo>,
      friendshipRequests: null == friendshipRequests
          ? _value._friendshipRequests
          : friendshipRequests // ignore: cast_nullable_to_non_nullable
              as List<FriendInfo>,
      groups: null == groups
          ? _value._groups
          : groups // ignore: cast_nullable_to_non_nullable
              as List<GroupInfo>,
    ));
  }
}

/// @nodoc

class _$_FriendsListState implements _FriendsListState {
  _$_FriendsListState(
      {final List<FriendInfo> friends = const [],
      final List<FriendInfo> friendshipRequests = const [],
      final List<GroupInfo> groups = const []})
      : _friends = friends,
        _friendshipRequests = friendshipRequests,
        _groups = groups;

  final List<FriendInfo> _friends;
  @override
  @JsonKey()
  List<FriendInfo> get friends {
    if (_friends is EqualUnmodifiableListView) return _friends;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_friends);
  }

  final List<FriendInfo> _friendshipRequests;
  @override
  @JsonKey()
  List<FriendInfo> get friendshipRequests {
    if (_friendshipRequests is EqualUnmodifiableListView)
      return _friendshipRequests;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_friendshipRequests);
  }

  final List<GroupInfo> _groups;
  @override
  @JsonKey()
  List<GroupInfo> get groups {
    if (_groups is EqualUnmodifiableListView) return _groups;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_groups);
  }

  @override
  String toString() {
    return 'FriendsListState(friends: $friends, friendshipRequests: $friendshipRequests, groups: $groups)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_FriendsListState &&
            const DeepCollectionEquality().equals(other._friends, _friends) &&
            const DeepCollectionEquality()
                .equals(other._friendshipRequests, _friendshipRequests) &&
            const DeepCollectionEquality().equals(other._groups, _groups));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_friends),
      const DeepCollectionEquality().hash(_friendshipRequests),
      const DeepCollectionEquality().hash(_groups));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_FriendsListStateCopyWith<_$_FriendsListState> get copyWith =>
      __$$_FriendsListStateCopyWithImpl<_$_FriendsListState>(this, _$identity);
}

abstract class _FriendsListState implements FriendsListState {
  factory _FriendsListState(
      {final List<FriendInfo> friends,
      final List<FriendInfo> friendshipRequests,
      final List<GroupInfo> groups}) = _$_FriendsListState;

  @override
  List<FriendInfo> get friends;
  @override
  List<FriendInfo> get friendshipRequests;
  @override
  List<GroupInfo> get groups;
  @override
  @JsonKey(ignore: true)
  _$$_FriendsListStateCopyWith<_$_FriendsListState> get copyWith =>
      throw _privateConstructorUsedError;
}
