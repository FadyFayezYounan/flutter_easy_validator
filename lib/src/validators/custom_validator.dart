import '../easy_validator.dart';
import '../utils/utils.dart';

final class CustomValidator extends EasyValidator {
  /// A validator that checks if a value matches a specified regular expression.
  ///
  /// This validator is used to validate values and returns an error message if the value does not match the specified regular expression.
  ///
  /// Example usage:
  ///
  /// ```dart
  /// final validator = CustomValidator((value) => value.contains('@'));
  ///
  /// String? result = validator.validate('john.doe@example');
  /// print(result); // Output: 'Invalid email address'
  ///
  /// ```
  const CustomValidator(this.validator) : super(null);

  /// The custom validation function to use.
  /// The [validator] parameter specifies the custom validation function to use.
  final ValidatorCallback<String> validator;

  @override
  String? validate(String? value) {
    if (value == null) {
      return null;
    }
    return validator(value);
  }
}
