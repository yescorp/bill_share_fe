// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'select_friends_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$SelectFriendsState {
  List<FriendInfo> get friends => throw _privateConstructorUsedError;
  List<FriendInfo> get selectedFriends => throw _privateConstructorUsedError;
  List<GroupInfo> get groups => throw _privateConstructorUsedError;
  List<GroupInfo> get selectedGroups => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SelectFriendsStateCopyWith<SelectFriendsState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SelectFriendsStateCopyWith<$Res> {
  factory $SelectFriendsStateCopyWith(
          SelectFriendsState value, $Res Function(SelectFriendsState) then) =
      _$SelectFriendsStateCopyWithImpl<$Res, SelectFriendsState>;
  @useResult
  $Res call(
      {List<FriendInfo> friends,
      List<FriendInfo> selectedFriends,
      List<GroupInfo> groups,
      List<GroupInfo> selectedGroups});
}

/// @nodoc
class _$SelectFriendsStateCopyWithImpl<$Res, $Val extends SelectFriendsState>
    implements $SelectFriendsStateCopyWith<$Res> {
  _$SelectFriendsStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? friends = null,
    Object? selectedFriends = null,
    Object? groups = null,
    Object? selectedGroups = null,
  }) {
    return _then(_value.copyWith(
      friends: null == friends
          ? _value.friends
          : friends // ignore: cast_nullable_to_non_nullable
              as List<FriendInfo>,
      selectedFriends: null == selectedFriends
          ? _value.selectedFriends
          : selectedFriends // ignore: cast_nullable_to_non_nullable
              as List<FriendInfo>,
      groups: null == groups
          ? _value.groups
          : groups // ignore: cast_nullable_to_non_nullable
              as List<GroupInfo>,
      selectedGroups: null == selectedGroups
          ? _value.selectedGroups
          : selectedGroups // ignore: cast_nullable_to_non_nullable
              as List<GroupInfo>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_SelectFriendsStateCopyWith<$Res>
    implements $SelectFriendsStateCopyWith<$Res> {
  factory _$$_SelectFriendsStateCopyWith(_$_SelectFriendsState value,
          $Res Function(_$_SelectFriendsState) then) =
      __$$_SelectFriendsStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<FriendInfo> friends,
      List<FriendInfo> selectedFriends,
      List<GroupInfo> groups,
      List<GroupInfo> selectedGroups});
}

/// @nodoc
class __$$_SelectFriendsStateCopyWithImpl<$Res>
    extends _$SelectFriendsStateCopyWithImpl<$Res, _$_SelectFriendsState>
    implements _$$_SelectFriendsStateCopyWith<$Res> {
  __$$_SelectFriendsStateCopyWithImpl(
      _$_SelectFriendsState _value, $Res Function(_$_SelectFriendsState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? friends = null,
    Object? selectedFriends = null,
    Object? groups = null,
    Object? selectedGroups = null,
  }) {
    return _then(_$_SelectFriendsState(
      friends: null == friends
          ? _value._friends
          : friends // ignore: cast_nullable_to_non_nullable
              as List<FriendInfo>,
      selectedFriends: null == selectedFriends
          ? _value._selectedFriends
          : selectedFriends // ignore: cast_nullable_to_non_nullable
              as List<FriendInfo>,
      groups: null == groups
          ? _value._groups
          : groups // ignore: cast_nullable_to_non_nullable
              as List<GroupInfo>,
      selectedGroups: null == selectedGroups
          ? _value._selectedGroups
          : selectedGroups // ignore: cast_nullable_to_non_nullable
              as List<GroupInfo>,
    ));
  }
}

/// @nodoc

class _$_SelectFriendsState implements _SelectFriendsState {
  _$_SelectFriendsState(
      {final List<FriendInfo> friends = const [],
      final List<FriendInfo> selectedFriends = const [],
      final List<GroupInfo> groups = const [],
      final List<GroupInfo> selectedGroups = const []})
      : _friends = friends,
        _selectedFriends = selectedFriends,
        _groups = groups,
        _selectedGroups = selectedGroups;

  final List<FriendInfo> _friends;
  @override
  @JsonKey()
  List<FriendInfo> get friends {
    if (_friends is EqualUnmodifiableListView) return _friends;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_friends);
  }

  final List<FriendInfo> _selectedFriends;
  @override
  @JsonKey()
  List<FriendInfo> get selectedFriends {
    if (_selectedFriends is EqualUnmodifiableListView) return _selectedFriends;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_selectedFriends);
  }

  final List<GroupInfo> _groups;
  @override
  @JsonKey()
  List<GroupInfo> get groups {
    if (_groups is EqualUnmodifiableListView) return _groups;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_groups);
  }

  final List<GroupInfo> _selectedGroups;
  @override
  @JsonKey()
  List<GroupInfo> get selectedGroups {
    if (_selectedGroups is EqualUnmodifiableListView) return _selectedGroups;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_selectedGroups);
  }

  @override
  String toString() {
    return 'SelectFriendsState(friends: $friends, selectedFriends: $selectedFriends, groups: $groups, selectedGroups: $selectedGroups)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SelectFriendsState &&
            const DeepCollectionEquality().equals(other._friends, _friends) &&
            const DeepCollectionEquality()
                .equals(other._selectedFriends, _selectedFriends) &&
            const DeepCollectionEquality().equals(other._groups, _groups) &&
            const DeepCollectionEquality()
                .equals(other._selectedGroups, _selectedGroups));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_friends),
      const DeepCollectionEquality().hash(_selectedFriends),
      const DeepCollectionEquality().hash(_groups),
      const DeepCollectionEquality().hash(_selectedGroups));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SelectFriendsStateCopyWith<_$_SelectFriendsState> get copyWith =>
      __$$_SelectFriendsStateCopyWithImpl<_$_SelectFriendsState>(
          this, _$identity);
}

abstract class _SelectFriendsState implements SelectFriendsState {
  factory _SelectFriendsState(
      {final List<FriendInfo> friends,
      final List<FriendInfo> selectedFriends,
      final List<GroupInfo> groups,
      final List<GroupInfo> selectedGroups}) = _$_SelectFriendsState;

  @override
  List<FriendInfo> get friends;
  @override
  List<FriendInfo> get selectedFriends;
  @override
  List<GroupInfo> get groups;
  @override
  List<GroupInfo> get selectedGroups;
  @override
  @JsonKey(ignore: true)
  _$$_SelectFriendsStateCopyWith<_$_SelectFriendsState> get copyWith =>
      throw _privateConstructorUsedError;
}
