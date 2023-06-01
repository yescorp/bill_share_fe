import 'package:json_annotation/json_annotation.dart';
import 'package:collection/collection.dart';

enum ExpenseTypeId {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue('Necessary')
  necessary('Necessary'),
  @JsonValue('Unexpected')
  unexpected('Unexpected'),
  @JsonValue('SelfExpenses')
  selfexpenses('SelfExpenses');

  final String? value;

  const ExpenseTypeId(this.value);
}
