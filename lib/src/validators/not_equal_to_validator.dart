import '../easy_validator.dart';
import '../easy_validator_mixin.dart';
import '../utils/utils.dart';

final class NotEqualToValidator extends EasyValidator with EasyValidatorMixin {
  /// A validator that checks if a value is not equal to another value.
  /// This validator is used to validate strings and other types that have a length property.
  /// It returns an error message if the value is equal to another value.
  /// Example usage:
  ///
  /// ```dart
  /// final validator = NotEqualToValidator('Hello',errorMessage: 'Value must not be equal to Hello');
  /// String? result = validator.validate("Hello");
  /// print(result); // 'Value must not be equal to Hello'

  /// ```
  const NotEqualToValidator(
    this.notEqualTo, {
    this.caseSensitive = true,
    this.useTrim = false,
    String? errorMessage,
  }) : super(errorMessage);

  /// The [notEqualTo] parameter specifies the string that the value being validated should not be equal to.
  final String notEqualTo;

  /// The [caseSensitive] parameter determines whether the comparison should be case-sensitive or not.
  final bool caseSensitive;

  /// The [useTrim] parameter determines whether the comparison should ignore string leading and trailing whitespace or not.
  final bool useTrim;

  @override
  String? validate(String? value) {
    if (value != null) {
      String notEqualToText = useTrim ? notEqualTo.trim() : notEqualTo;
      String text = useTrim ? value.trim() : value;
      if (!caseSensitive) {
        if (text.toLowerCase() == notEqualToText.toLowerCase()) {
          return getErrorMessage(
            EasyValidatorMessages.instance.notEqualTo,
            notEqualTo,
          );
        }
      } else {
        if (text == notEqualToText) {
          return getErrorMessage(
            EasyValidatorMessages.instance.notEqualTo,
            notEqualTo,
          );
        }
      }
    }
    return null;
  }

  @override
  int get hashCode => Object.hash(
        notEqualTo.hashCode,
        caseSensitive.hashCode,
        errorMessage.hashCode,
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is NotEqualToValidator &&
          runtimeType == other.runtimeType &&
          hashCode == other.hashCode;
}
