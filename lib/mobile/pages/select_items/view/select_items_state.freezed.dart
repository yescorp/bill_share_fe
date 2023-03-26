// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'select_items_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$SelectItemsState {
  PaymentInfo? get details => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SelectItemsStateCopyWith<SelectItemsState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SelectItemsStateCopyWith<$Res> {
  factory $SelectItemsStateCopyWith(
          SelectItemsState value, $Res Function(SelectItemsState) then) =
      _$SelectItemsStateCopyWithImpl<$Res, SelectItemsState>;
  @useResult
  $Res call({PaymentInfo? details});
}

/// @nodoc
class _$SelectItemsStateCopyWithImpl<$Res, $Val extends SelectItemsState>
    implements $SelectItemsStateCopyWith<$Res> {
  _$SelectItemsStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? details = freezed,
  }) {
    return _then(_value.copyWith(
      details: freezed == details
          ? _value.details
          : details // ignore: cast_nullable_to_non_nullable
              as PaymentInfo?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_SelectITemsStateCopyWith<$Res>
    implements $SelectItemsStateCopyWith<$Res> {
  factory _$$_SelectITemsStateCopyWith(
          _$_SelectITemsState value, $Res Function(_$_SelectITemsState) then) =
      __$$_SelectITemsStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({PaymentInfo? details});
}

/// @nodoc
class __$$_SelectITemsStateCopyWithImpl<$Res>
    extends _$SelectItemsStateCopyWithImpl<$Res, _$_SelectITemsState>
    implements _$$_SelectITemsStateCopyWith<$Res> {
  __$$_SelectITemsStateCopyWithImpl(
      _$_SelectITemsState _value, $Res Function(_$_SelectITemsState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? details = freezed,
  }) {
    return _then(_$_SelectITemsState(
      details: freezed == details
          ? _value.details
          : details // ignore: cast_nullable_to_non_nullable
              as PaymentInfo?,
    ));
  }
}

/// @nodoc

class _$_SelectITemsState implements _SelectITemsState {
  _$_SelectITemsState({this.details});

  @override
  final PaymentInfo? details;

  @override
  String toString() {
    return 'SelectItemsState(details: $details)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SelectITemsState &&
            (identical(other.details, details) || other.details == details));
  }

  @override
  int get hashCode => Object.hash(runtimeType, details);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SelectITemsStateCopyWith<_$_SelectITemsState> get copyWith =>
      __$$_SelectITemsStateCopyWithImpl<_$_SelectITemsState>(this, _$identity);
}

abstract class _SelectITemsState implements SelectItemsState {
  factory _SelectITemsState({final PaymentInfo? details}) = _$_SelectITemsState;

  @override
  PaymentInfo? get details;
  @override
  @JsonKey(ignore: true)
  _$$_SelectITemsStateCopyWith<_$_SelectITemsState> get copyWith =>
      throw _privateConstructorUsedError;
}
