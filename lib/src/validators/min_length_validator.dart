import '../easy_validator.dart';
import '../easy_validator_mixin.dart';
import '../utils/utils.dart';

final class MinLengthValidator extends EasyValidator with EasyValidatorMixin {
  /// A validator that checks if the length of a value is greater than or equal to a specified minimum length.
  ///
  /// This validator is used to validate strings and other types that have a length property.
  /// It returns an error message if the value is shorter than the specified minimum length.
  ///
  /// Example usage:
  /// ```dart
  /// final validator = MinLengthValidator('Value must have at least 5 characters', 5);
  /// validator.validate('hello'); // returns null
  /// validator.validate('hi'); // returns 'Value must have at least 5 characters'
  /// ```
  const MinLengthValidator(this.minLength, [super.errorMessage]);

  /// The minimum length that the value must have.
  /// The [minLength] is the minimum length that the value must have.
  final int minLength;

  @override
  String? validate(String? value) {
    if (value != null) {
      if (value.length < minLength) {
        return getErrorMessage(
          EasyValidatorMessages.instance.minLength,
          minLength.toString(),
        );
      }
    }
    return null;
  }
}
