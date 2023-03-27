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
  List<String> get selectedItemIds => throw _privateConstructorUsedError;

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
  $Res call({PaymentInfo? details, List<String> selectedItemIds});
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
    Object? selectedItemIds = null,
  }) {
    return _then(_value.copyWith(
      details: freezed == details
          ? _value.details
          : details // ignore: cast_nullable_to_non_nullable
              as PaymentInfo?,
      selectedItemIds: null == selectedItemIds
          ? _value.selectedItemIds
          : selectedItemIds // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_SelectItemsStateCopyWith<$Res>
    implements $SelectItemsStateCopyWith<$Res> {
  factory _$$_SelectItemsStateCopyWith(
          _$_SelectItemsState value, $Res Function(_$_SelectItemsState) then) =
      __$$_SelectItemsStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({PaymentInfo? details, List<String> selectedItemIds});
}

/// @nodoc
class __$$_SelectItemsStateCopyWithImpl<$Res>
    extends _$SelectItemsStateCopyWithImpl<$Res, _$_SelectItemsState>
    implements _$$_SelectItemsStateCopyWith<$Res> {
  __$$_SelectItemsStateCopyWithImpl(
      _$_SelectItemsState _value, $Res Function(_$_SelectItemsState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? details = freezed,
    Object? selectedItemIds = null,
  }) {
    return _then(_$_SelectItemsState(
      details: freezed == details
          ? _value.details
          : details // ignore: cast_nullable_to_non_nullable
              as PaymentInfo?,
      selectedItemIds: null == selectedItemIds
          ? _value._selectedItemIds
          : selectedItemIds // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc

class _$_SelectItemsState implements _SelectItemsState {
  _$_SelectItemsState(
      {this.details, final List<String> selectedItemIds = const []})
      : _selectedItemIds = selectedItemIds;

  @override
  final PaymentInfo? details;
  final List<String> _selectedItemIds;
  @override
  @JsonKey()
  List<String> get selectedItemIds {
    if (_selectedItemIds is EqualUnmodifiableListView) return _selectedItemIds;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_selectedItemIds);
  }

  @override
  String toString() {
    return 'SelectItemsState(details: $details, selectedItemIds: $selectedItemIds)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SelectItemsState &&
            (identical(other.details, details) || other.details == details) &&
            const DeepCollectionEquality()
                .equals(other._selectedItemIds, _selectedItemIds));
  }

  @override
  int get hashCode => Object.hash(runtimeType, details,
      const DeepCollectionEquality().hash(_selectedItemIds));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SelectItemsStateCopyWith<_$_SelectItemsState> get copyWith =>
      __$$_SelectItemsStateCopyWithImpl<_$_SelectItemsState>(this, _$identity);
}

abstract class _SelectItemsState implements SelectItemsState {
  factory _SelectItemsState(
      {final PaymentInfo? details,
      final List<String> selectedItemIds}) = _$_SelectItemsState;

  @override
  PaymentInfo? get details;
  @override
  List<String> get selectedItemIds;
  @override
  @JsonKey(ignore: true)
  _$$_SelectItemsStateCopyWith<_$_SelectItemsState> get copyWith =>
      throw _privateConstructorUsedError;
}
