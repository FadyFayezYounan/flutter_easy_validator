import '../easy_validator.dart';
import '../easy_validator_mixin.dart';
import '../utils/utils.dart';

final class NotEndWithValidator extends EasyValidator with EasyValidatorMixin {
  /// A validator that checks if a value does not end with a specified string.
  /// This validator is used to validate strings and other types that have a length property.
  /// It returns an error message if the value ends with the specified string.
  /// The [notEndWith] parameter specifies the desired string that the value should not end with.
  /// Example usage:
  /// ```dart
  /// final validator = NotEndWithValidator('Hello',errorMessage :'Value must not end with Hello');
  /// String? result = validator.validate("Hello");
  /// print(result); // Value must not end with Hello
  /// ```
  const NotEndWithValidator(
    this.notEndWith, {
    this.caseSensitive = true,
    this.useTrim = true,
    String? errorMessage,
  }) : super(errorMessage);

  /// The [notEndWith] parameter specifies the desired string that the value should not end with.
  final String notEndWith;

  /// The [caseSensitive] parameter determines whether the comparison should be case-sensitive or not.
  final bool caseSensitive;

  /// The [useTrim] parameter determines whether the comparison should ignore string leading and trailing whitespace or not.
  final bool useTrim;

  @override
  String? validate(String? value) {
    if (value != null) {
      String notEndWithText = useTrim ? notEndWith.trim() : notEndWith;
      String text = useTrim ? value.trim() : value;
      if (!caseSensitive) {
        if (text.toLowerCase().endsWith(notEndWithText.toLowerCase())) {
          return getErrorMessage(
            EasyValidatorMessages.instance.notEndWith,
            notEndWith,
          );
        }
      } else {
        if (text.endsWith(notEndWithText)) {
          return getErrorMessage(
            EasyValidatorMessages.instance.notEndWith,
            notEndWith,
          );
        }
      }
    }

    return null;
  }
}
