// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'admin_user_details_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$AdminUserDetailsState {
  SpendingsDetails? get spendings => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AdminUserDetailsStateCopyWith<AdminUserDetailsState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AdminUserDetailsStateCopyWith<$Res> {
  factory $AdminUserDetailsStateCopyWith(AdminUserDetailsState value,
          $Res Function(AdminUserDetailsState) then) =
      _$AdminUserDetailsStateCopyWithImpl<$Res, AdminUserDetailsState>;
  @useResult
  $Res call({SpendingsDetails? spendings});
}

/// @nodoc
class _$AdminUserDetailsStateCopyWithImpl<$Res,
        $Val extends AdminUserDetailsState>
    implements $AdminUserDetailsStateCopyWith<$Res> {
  _$AdminUserDetailsStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? spendings = freezed,
  }) {
    return _then(_value.copyWith(
      spendings: freezed == spendings
          ? _value.spendings
          : spendings // ignore: cast_nullable_to_non_nullable
              as SpendingsDetails?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_AdminUserDetailsStateCopyWith<$Res>
    implements $AdminUserDetailsStateCopyWith<$Res> {
  factory _$$_AdminUserDetailsStateCopyWith(_$_AdminUserDetailsState value,
          $Res Function(_$_AdminUserDetailsState) then) =
      __$$_AdminUserDetailsStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({SpendingsDetails? spendings});
}

/// @nodoc
class __$$_AdminUserDetailsStateCopyWithImpl<$Res>
    extends _$AdminUserDetailsStateCopyWithImpl<$Res, _$_AdminUserDetailsState>
    implements _$$_AdminUserDetailsStateCopyWith<$Res> {
  __$$_AdminUserDetailsStateCopyWithImpl(_$_AdminUserDetailsState _value,
      $Res Function(_$_AdminUserDetailsState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? spendings = freezed,
  }) {
    return _then(_$_AdminUserDetailsState(
      spendings: freezed == spendings
          ? _value.spendings
          : spendings // ignore: cast_nullable_to_non_nullable
              as SpendingsDetails?,
    ));
  }
}

/// @nodoc

class _$_AdminUserDetailsState implements _AdminUserDetailsState {
  _$_AdminUserDetailsState({this.spendings});

  @override
  final SpendingsDetails? spendings;

  @override
  String toString() {
    return 'AdminUserDetailsState(spendings: $spendings)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AdminUserDetailsState &&
            (identical(other.spendings, spendings) ||
                other.spendings == spendings));
  }

  @override
  int get hashCode => Object.hash(runtimeType, spendings);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AdminUserDetailsStateCopyWith<_$_AdminUserDetailsState> get copyWith =>
      __$$_AdminUserDetailsStateCopyWithImpl<_$_AdminUserDetailsState>(
          this, _$identity);
}

abstract class _AdminUserDetailsState implements AdminUserDetailsState {
  factory _AdminUserDetailsState({final SpendingsDetails? spendings}) =
      _$_AdminUserDetailsState;

  @override
  SpendingsDetails? get spendings;
  @override
  @JsonKey(ignore: true)
  _$$_AdminUserDetailsStateCopyWith<_$_AdminUserDetailsState> get copyWith =>
      throw _privateConstructorUsedError;
}
