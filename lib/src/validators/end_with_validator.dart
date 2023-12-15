import '../easy_validator.dart';
import '../easy_validator_mixin.dart';
import '../utils/utils.dart';

final class EndWithValidator extends EasyValidator with EasyValidatorMixin {
  /// A validator that checks if a value ends with a specified string.
  /// This validator is used to validate strings and other types that have a length property.
  /// It returns an error message if the value does not end with the specified string.
  /// The [endWith] parameter specifies the desired string that the value should end with.
  /// Example usage:
  ///
  /// ```dart
  /// final validator = EndWithValidator('Hello','Value must end with Hello');
  /// String? result = validator.validate("test");
  /// print(result); // 'Value must end with Hello'
  /// ```
  const EndWithValidator(
    this.endWith, {
    this.caseSensitive = true,
    this.useTrim = false,
    String? errorMessage,
  }) : super(errorMessage);

  /// A validator that checks if a value ends with a specified string.
  ///
  /// The [endWith] parameter specifies the desired string that the value should end with.
  final String endWith;

  /// The [caseSensitive] parameter determines whether the comparison should be case-sensitive or not.
  final bool caseSensitive;

  /// The [useTrim] parameter determines whether the comparison should ignore string leading and trailing whitespace or not.
  final bool useTrim;

  @override
  String? validate(String? value) {
    if (value != null) {
      final endWithText = useTrim ? endWith.trim() : endWith;
      final text = useTrim ? value.trim() : value;
      if (!caseSensitive) {
        if (!text.toLowerCase().endsWith(endWithText.toLowerCase())) {
          return getErrorMessage(
            EasyValidatorMessages.instance.endWith,
            endWith,
          );
        }
      } else {
        if (!text.endsWith(endWithText)) {
          return getErrorMessage(
            EasyValidatorMessages.instance.endWith,
            endWith,
          );
        }
      }
    }
    return null;
  }

  @override
  int get hashCode => Object.hash(
        endWith.hashCode,
        caseSensitive.hashCode,
        useTrim.hashCode,
        errorMessage.hashCode,
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is EndWithValidator &&
          runtimeType == other.runtimeType &&
          hashCode == other.hashCode;
}
