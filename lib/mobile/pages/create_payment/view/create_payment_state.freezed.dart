// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'create_payment_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$CreatePaymentState {
  String? get selectedCategory => throw _privateConstructorUsedError;
  String? get selectedPaymentType => throw _privateConstructorUsedError;
  List<String> get friends => throw _privateConstructorUsedError;
  List<PaymentItem> get items => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CreatePaymentStateCopyWith<CreatePaymentState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CreatePaymentStateCopyWith<$Res> {
  factory $CreatePaymentStateCopyWith(
          CreatePaymentState value, $Res Function(CreatePaymentState) then) =
      _$CreatePaymentStateCopyWithImpl<$Res, CreatePaymentState>;
  @useResult
  $Res call(
      {String? selectedCategory,
      String? selectedPaymentType,
      List<String> friends,
      List<PaymentItem> items});
}

/// @nodoc
class _$CreatePaymentStateCopyWithImpl<$Res, $Val extends CreatePaymentState>
    implements $CreatePaymentStateCopyWith<$Res> {
  _$CreatePaymentStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? selectedCategory = freezed,
    Object? selectedPaymentType = freezed,
    Object? friends = null,
    Object? items = null,
  }) {
    return _then(_value.copyWith(
      selectedCategory: freezed == selectedCategory
          ? _value.selectedCategory
          : selectedCategory // ignore: cast_nullable_to_non_nullable
              as String?,
      selectedPaymentType: freezed == selectedPaymentType
          ? _value.selectedPaymentType
          : selectedPaymentType // ignore: cast_nullable_to_non_nullable
              as String?,
      friends: null == friends
          ? _value.friends
          : friends // ignore: cast_nullable_to_non_nullable
              as List<String>,
      items: null == items
          ? _value.items
          : items // ignore: cast_nullable_to_non_nullable
              as List<PaymentItem>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_CreatePaymentStateCopyWith<$Res>
    implements $CreatePaymentStateCopyWith<$Res> {
  factory _$$_CreatePaymentStateCopyWith(_$_CreatePaymentState value,
          $Res Function(_$_CreatePaymentState) then) =
      __$$_CreatePaymentStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? selectedCategory,
      String? selectedPaymentType,
      List<String> friends,
      List<PaymentItem> items});
}

/// @nodoc
class __$$_CreatePaymentStateCopyWithImpl<$Res>
    extends _$CreatePaymentStateCopyWithImpl<$Res, _$_CreatePaymentState>
    implements _$$_CreatePaymentStateCopyWith<$Res> {
  __$$_CreatePaymentStateCopyWithImpl(
      _$_CreatePaymentState _value, $Res Function(_$_CreatePaymentState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? selectedCategory = freezed,
    Object? selectedPaymentType = freezed,
    Object? friends = null,
    Object? items = null,
  }) {
    return _then(_$_CreatePaymentState(
      selectedCategory: freezed == selectedCategory
          ? _value.selectedCategory
          : selectedCategory // ignore: cast_nullable_to_non_nullable
              as String?,
      selectedPaymentType: freezed == selectedPaymentType
          ? _value.selectedPaymentType
          : selectedPaymentType // ignore: cast_nullable_to_non_nullable
              as String?,
      friends: null == friends
          ? _value._friends
          : friends // ignore: cast_nullable_to_non_nullable
              as List<String>,
      items: null == items
          ? _value._items
          : items // ignore: cast_nullable_to_non_nullable
              as List<PaymentItem>,
    ));
  }
}

/// @nodoc

class _$_CreatePaymentState implements _CreatePaymentState {
  _$_CreatePaymentState(
      {this.selectedCategory,
      this.selectedPaymentType,
      final List<String> friends = const [],
      final List<PaymentItem> items = const []})
      : _friends = friends,
        _items = items;

  @override
  final String? selectedCategory;
  @override
  final String? selectedPaymentType;
  final List<String> _friends;
  @override
  @JsonKey()
  List<String> get friends {
    if (_friends is EqualUnmodifiableListView) return _friends;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_friends);
  }

  final List<PaymentItem> _items;
  @override
  @JsonKey()
  List<PaymentItem> get items {
    if (_items is EqualUnmodifiableListView) return _items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_items);
  }

  @override
  String toString() {
    return 'CreatePaymentState(selectedCategory: $selectedCategory, selectedPaymentType: $selectedPaymentType, friends: $friends, items: $items)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CreatePaymentState &&
            (identical(other.selectedCategory, selectedCategory) ||
                other.selectedCategory == selectedCategory) &&
            (identical(other.selectedPaymentType, selectedPaymentType) ||
                other.selectedPaymentType == selectedPaymentType) &&
            const DeepCollectionEquality().equals(other._friends, _friends) &&
            const DeepCollectionEquality().equals(other._items, _items));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      selectedCategory,
      selectedPaymentType,
      const DeepCollectionEquality().hash(_friends),
      const DeepCollectionEquality().hash(_items));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CreatePaymentStateCopyWith<_$_CreatePaymentState> get copyWith =>
      __$$_CreatePaymentStateCopyWithImpl<_$_CreatePaymentState>(
          this, _$identity);
}

abstract class _CreatePaymentState implements CreatePaymentState {
  factory _CreatePaymentState(
      {final String? selectedCategory,
      final String? selectedPaymentType,
      final List<String> friends,
      final List<PaymentItem> items}) = _$_CreatePaymentState;

  @override
  String? get selectedCategory;
  @override
  String? get selectedPaymentType;
  @override
  List<String> get friends;
  @override
  List<PaymentItem> get items;
  @override
  @JsonKey(ignore: true)
  _$$_CreatePaymentStateCopyWith<_$_CreatePaymentState> get copyWith =>
      throw _privateConstructorUsedError;
}
