// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'expense_list_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ExpenseListState {
  List<PaymentInfo> get details => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ExpenseListStateCopyWith<ExpenseListState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ExpenseListStateCopyWith<$Res> {
  factory $ExpenseListStateCopyWith(
          ExpenseListState value, $Res Function(ExpenseListState) then) =
      _$ExpenseListStateCopyWithImpl<$Res, ExpenseListState>;
  @useResult
  $Res call({List<PaymentInfo> details});
}

/// @nodoc
class _$ExpenseListStateCopyWithImpl<$Res, $Val extends ExpenseListState>
    implements $ExpenseListStateCopyWith<$Res> {
  _$ExpenseListStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? details = null,
  }) {
    return _then(_value.copyWith(
      details: null == details
          ? _value.details
          : details // ignore: cast_nullable_to_non_nullable
              as List<PaymentInfo>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ExpenseListStateCopyWith<$Res>
    implements $ExpenseListStateCopyWith<$Res> {
  factory _$$_ExpenseListStateCopyWith(
          _$_ExpenseListState value, $Res Function(_$_ExpenseListState) then) =
      __$$_ExpenseListStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<PaymentInfo> details});
}

/// @nodoc
class __$$_ExpenseListStateCopyWithImpl<$Res>
    extends _$ExpenseListStateCopyWithImpl<$Res, _$_ExpenseListState>
    implements _$$_ExpenseListStateCopyWith<$Res> {
  __$$_ExpenseListStateCopyWithImpl(
      _$_ExpenseListState _value, $Res Function(_$_ExpenseListState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? details = null,
  }) {
    return _then(_$_ExpenseListState(
      details: null == details
          ? _value._details
          : details // ignore: cast_nullable_to_non_nullable
              as List<PaymentInfo>,
    ));
  }
}

/// @nodoc

class _$_ExpenseListState implements _ExpenseListState {
  _$_ExpenseListState({final List<PaymentInfo> details = const []})
      : _details = details;

  final List<PaymentInfo> _details;
  @override
  @JsonKey()
  List<PaymentInfo> get details {
    if (_details is EqualUnmodifiableListView) return _details;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_details);
  }

  @override
  String toString() {
    return 'ExpenseListState(details: $details)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ExpenseListState &&
            const DeepCollectionEquality().equals(other._details, _details));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_details));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ExpenseListStateCopyWith<_$_ExpenseListState> get copyWith =>
      __$$_ExpenseListStateCopyWithImpl<_$_ExpenseListState>(this, _$identity);
}

abstract class _ExpenseListState implements ExpenseListState {
  factory _ExpenseListState({final List<PaymentInfo> details}) =
      _$_ExpenseListState;

  @override
  List<PaymentInfo> get details;
  @override
  @JsonKey(ignore: true)
  _$$_ExpenseListStateCopyWith<_$_ExpenseListState> get copyWith =>
      throw _privateConstructorUsedError;
}
