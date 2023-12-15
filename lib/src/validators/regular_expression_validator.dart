import '../easy_validator.dart';
import '../easy_validator_mixin.dart';
import '../utils/utils.dart';

final class RegularExpressionValidator extends EasyValidator
    with EasyValidatorMixin {
  /// A validator that checks if a value matches a specified regular expression.
  ///
  /// This validator is used to validate values and returns an error message if the value does not match the specified regular expression.
  ///
  /// Example usage:
  ///
  /// ```dart
  /// final validator = RegularExpressionValidator('Invalid email address', r'^[a-zA-Z\d.!#$%&’*+/=?^_`{|}~-]+@[a-zA-Z\d-]+(?:\.[a-zA-Z\d-]+)*$');
  ///
  /// String? result = validator.validate('john.doe@example');
  /// print(result); // Output: 'Invalid email address'
  ///
  /// ```
  const RegularExpressionValidator(this.regExp, [super.errorMessage]);

  /// The regular expression to match the value against.
  /// The [regExp] parameter specifies the regular expression to match the value against.
  final RegExp regExp;

  @override
  String? validate(String? value) {
    if (value is String) {
      if (!regExp.hasMatch(value)) {
        return getErrorMessage(EasyValidatorMessages.instance.regex);
      }
    }
    return null;
  }
}
