import '../easy_validator.dart';
import '../easy_validator_mixin.dart';
import '../utils/utils.dart';

final class RequiredValidator extends EasyValidator with EasyValidatorMixin {
  /// A validator that checks if a value is required.
  ///
  /// The [RequiredValidator] class is a generic class that extends the [EasyValidator] class.
  /// It provides a method to validate a value and returns an error message if the value is null or empty.
  ///
  /// Example usage:
  ///
  /// ```dart
  /// final validator = RequiredValidator('Value is required');
  /// String? result = validator.validate('Hello');
  /// print(result); // null
  ///
  /// result = validator.validate('');
  /// print(result); // 'Value is required'
  /// ```
  const RequiredValidator([super.errorMessage]);

  @override
  String? validate(String? value) {
    if (value != null) {
      if (value.trim().isEmpty) {
        return getErrorMessage(EasyValidatorMessages.instance.required);
      }
    }
    return null;
  }

  @override
  int get hashCode => errorMessage.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is RequiredValidator &&
          runtimeType == other.runtimeType &&
          errorMessage == other.errorMessage;
}
