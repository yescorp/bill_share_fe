// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'admin_dashboard_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$AdminDashboardState {
  List<DetailedUserInfo>? get users => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AdminDashboardStateCopyWith<AdminDashboardState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AdminDashboardStateCopyWith<$Res> {
  factory $AdminDashboardStateCopyWith(
          AdminDashboardState value, $Res Function(AdminDashboardState) then) =
      _$AdminDashboardStateCopyWithImpl<$Res, AdminDashboardState>;
  @useResult
  $Res call({List<DetailedUserInfo>? users});
}

/// @nodoc
class _$AdminDashboardStateCopyWithImpl<$Res, $Val extends AdminDashboardState>
    implements $AdminDashboardStateCopyWith<$Res> {
  _$AdminDashboardStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? users = freezed,
  }) {
    return _then(_value.copyWith(
      users: freezed == users
          ? _value.users
          : users // ignore: cast_nullable_to_non_nullable
              as List<DetailedUserInfo>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_AdminDashboardStateCopyWith<$Res>
    implements $AdminDashboardStateCopyWith<$Res> {
  factory _$$_AdminDashboardStateCopyWith(_$_AdminDashboardState value,
          $Res Function(_$_AdminDashboardState) then) =
      __$$_AdminDashboardStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<DetailedUserInfo>? users});
}

/// @nodoc
class __$$_AdminDashboardStateCopyWithImpl<$Res>
    extends _$AdminDashboardStateCopyWithImpl<$Res, _$_AdminDashboardState>
    implements _$$_AdminDashboardStateCopyWith<$Res> {
  __$$_AdminDashboardStateCopyWithImpl(_$_AdminDashboardState _value,
      $Res Function(_$_AdminDashboardState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? users = freezed,
  }) {
    return _then(_$_AdminDashboardState(
      users: freezed == users
          ? _value._users
          : users // ignore: cast_nullable_to_non_nullable
              as List<DetailedUserInfo>?,
    ));
  }
}

/// @nodoc

class _$_AdminDashboardState implements _AdminDashboardState {
  _$_AdminDashboardState({final List<DetailedUserInfo>? users})
      : _users = users;

  final List<DetailedUserInfo>? _users;
  @override
  List<DetailedUserInfo>? get users {
    final value = _users;
    if (value == null) return null;
    if (_users is EqualUnmodifiableListView) return _users;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'AdminDashboardState(users: $users)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AdminDashboardState &&
            const DeepCollectionEquality().equals(other._users, _users));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_users));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AdminDashboardStateCopyWith<_$_AdminDashboardState> get copyWith =>
      __$$_AdminDashboardStateCopyWithImpl<_$_AdminDashboardState>(
          this, _$identity);
}

abstract class _AdminDashboardState implements AdminDashboardState {
  factory _AdminDashboardState({final List<DetailedUserInfo>? users}) =
      _$_AdminDashboardState;

  @override
  List<DetailedUserInfo>? get users;
  @override
  @JsonKey(ignore: true)
  _$$_AdminDashboardStateCopyWith<_$_AdminDashboardState> get copyWith =>
      throw _privateConstructorUsedError;
}
