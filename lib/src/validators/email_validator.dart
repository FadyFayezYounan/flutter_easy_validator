import '../easy_validator.dart';
import '../easy_validator_mixin.dart';
import '../utils/utils.dart';

final class EmailValidator extends EasyValidator with EasyValidatorMixin {
  /// A validator that checks if a value is a valid email address.
  ///
  /// This validator extends the [EasyValidator] class and overrides the [validate] method.
  /// It uses a regular expression to validate the email address format.
  /// If the value is not a valid email address, it returns the [errorMessage].
  /// An example of how to use the EmailValidator class.
  ///
  /// Example:
  /// ```dart
  /// final email = 'example@example';
  /// final validator = EmailValidator('Invalid email address');
  /// String? result = validator.validate(email);
  /// print(result); // Output: 'Invalid email address'
  /// ```

  const EmailValidator([super.errorMessage]);

  @override
  String? validate(String? value) {
    if (value == null) {
      return getErrorMessage(EasyValidatorMessages.instance.email);
    } else {
      final regex = RegExp(kEmailRegEx);
      if (!regex.hasMatch(value)) {
        return getErrorMessage(EasyValidatorMessages.instance.email);
      }
    }
    return null;
  }

  @override
  int get hashCode => errorMessage.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is EmailValidator &&
          runtimeType == other.runtimeType &&
          errorMessage == other.errorMessage;
}
