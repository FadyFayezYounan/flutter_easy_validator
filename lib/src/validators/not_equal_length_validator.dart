import '../easy_validator.dart';
import '../easy_validator_mixin.dart';
import '../utils/utils.dart';

final class NotEqualLengthValidator extends EasyValidator
    with EasyValidatorMixin {
  /// A validator that checks if a value does not have a specified length.
  /// This validator is used to validate strings and other types that have a length property.
  /// It returns an error message if the value has the specified length.
  /// The [length] parameter specifies the desired length that the value should not have.
  /// Example usage:
  /// ```dart
  /// final validator = NotEqualLengthValidator(5,'Value must not have a length of 5');
  /// String? result = validator.validate("Hello");
  /// print(result); // Value must not have a length of 5
  /// ```
  const NotEqualLengthValidator(this.length, [super.customMessage]);

  /// [length] is the length of the string to compare with
  final int length;

  @override
  String? validate(String? value) {
    if (value == null) return null;
    if (value.trim().length == length) {
      return getErrorMessage(
        EasyValidatorMessages.instance.notEqualLength,
        length.toString(),
      );
    }
    return null;
  }
}
