import '../easy_validator.dart';
import '../easy_validator_mixin.dart';
import '../utils/utils.dart';

/// A validator that checks if a string does not contain a specified substring.
class NotContainsValidator extends EasyValidator with EasyValidatorMixin {
  /// The substring that the value should not contain.
  final String notContains;

  /// The [caseSensitive] parameter determines whether the comparison should be case-sensitive or not.
  final bool caseSensitive;

  /// Creates a [NotContainsValidator] instance.
  ///
  /// The [notContains] parameter specifies the substring that the value should not contain.
  /// The [errorMessage] parameter specifies the error message to be returned if the validation fails.
  /// The default error message is 'Value cannot contain {0}'.
  ///
  /// Example:
  /// ```dart
  /// final validator = NotContainsValidator('test', 'Value cannot contain test');
  /// print(validator.validate('test')); // Value cannot contain test
  /// ```
  const NotContainsValidator(
    this.notContains, {
    this.caseSensitive = true,
    String? errorMessage,
  }) : super(errorMessage);

  @override
  String? validate(String? value) {
    if (value != null) {
      if (caseSensitive) {
        if (value.contains(notContains)) {
          return getErrorMessage(
            EasyValidatorMessages.instance.notContains,
            notContains,
          );
        }
      } else {
        if (value.toLowerCase().contains(notContains.toLowerCase())) {
          return getErrorMessage(
            EasyValidatorMessages.instance.notContains,
            notContains,
          );
        }
      }
    }
    return null;
  }
}
