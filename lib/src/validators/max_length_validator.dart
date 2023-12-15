import '../easy_validator.dart';
import '../easy_validator_mixin.dart';
import '../utils/utils.dart';

final class MaxLengthValidator extends EasyValidator with EasyValidatorMixin {
  /// A validator that checks if the length of a string value is less than or equal to a specified maximum length.
  ///
  /// This validator is used to validate string values and returns an error message if the length of the value exceeds the specified maximum length.
  ///
  /// Example usage:
  ///
  /// ```dart
  /// final validator = MaxLengthValidator('Maximum length exceeded', 10);
  ///
  /// String? result = validator.validate('Hello World');
  /// print(result); // Output: 'Maximum length exceeded'
  ///
  /// result = validator.validate('Hello');
  /// print(result); // Output: null
  /// ```
  const MaxLengthValidator(this.maxLength, [super.errorMessage]);

  /// The maximum length allowed for the value.
  /// The [maxLength] parameter specifies the maximum length allowed for the value.
  final int maxLength;

  @override
  String? validate(String? value) {
    if (value != null) {
      if (value.length > maxLength) {
        return getErrorMessage(
          EasyValidatorMessages.instance.maxLength,
          maxLength.toString(),
        );
      }
    }

    return null;
  }
}
