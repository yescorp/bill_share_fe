// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'create_group_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$CreateGroupState {
  List<FriendInfo> get friends => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CreateGroupStateCopyWith<CreateGroupState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CreateGroupStateCopyWith<$Res> {
  factory $CreateGroupStateCopyWith(
          CreateGroupState value, $Res Function(CreateGroupState) then) =
      _$CreateGroupStateCopyWithImpl<$Res, CreateGroupState>;
  @useResult
  $Res call({List<FriendInfo> friends});
}

/// @nodoc
class _$CreateGroupStateCopyWithImpl<$Res, $Val extends CreateGroupState>
    implements $CreateGroupStateCopyWith<$Res> {
  _$CreateGroupStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? friends = null,
  }) {
    return _then(_value.copyWith(
      friends: null == friends
          ? _value.friends
          : friends // ignore: cast_nullable_to_non_nullable
              as List<FriendInfo>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_CreateGroupStateCopyWith<$Res>
    implements $CreateGroupStateCopyWith<$Res> {
  factory _$$_CreateGroupStateCopyWith(
          _$_CreateGroupState value, $Res Function(_$_CreateGroupState) then) =
      __$$_CreateGroupStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<FriendInfo> friends});
}

/// @nodoc
class __$$_CreateGroupStateCopyWithImpl<$Res>
    extends _$CreateGroupStateCopyWithImpl<$Res, _$_CreateGroupState>
    implements _$$_CreateGroupStateCopyWith<$Res> {
  __$$_CreateGroupStateCopyWithImpl(
      _$_CreateGroupState _value, $Res Function(_$_CreateGroupState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? friends = null,
  }) {
    return _then(_$_CreateGroupState(
      friends: null == friends
          ? _value._friends
          : friends // ignore: cast_nullable_to_non_nullable
              as List<FriendInfo>,
    ));
  }
}

/// @nodoc

class _$_CreateGroupState implements _CreateGroupState {
  _$_CreateGroupState({final List<FriendInfo> friends = const []})
      : _friends = friends;

  final List<FriendInfo> _friends;
  @override
  @JsonKey()
  List<FriendInfo> get friends {
    if (_friends is EqualUnmodifiableListView) return _friends;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_friends);
  }

  @override
  String toString() {
    return 'CreateGroupState(friends: $friends)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CreateGroupState &&
            const DeepCollectionEquality().equals(other._friends, _friends));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_friends));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CreateGroupStateCopyWith<_$_CreateGroupState> get copyWith =>
      __$$_CreateGroupStateCopyWithImpl<_$_CreateGroupState>(this, _$identity);
}

abstract class _CreateGroupState implements CreateGroupState {
  factory _CreateGroupState({final List<FriendInfo> friends}) =
      _$_CreateGroupState;

  @override
  List<FriendInfo> get friends;
  @override
  @JsonKey(ignore: true)
  _$$_CreateGroupStateCopyWith<_$_CreateGroupState> get copyWith =>
      throw _privateConstructorUsedError;
}
