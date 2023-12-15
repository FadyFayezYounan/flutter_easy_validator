import '../easy_validator.dart';
import '../easy_validator_mixin.dart';
import '../utils/utils.dart';

final class EqualLengthValidator extends EasyValidator with EasyValidatorMixin {
  /// A validator that checks if the length of a value is equal to a specified length.
  /// This validator is used to validate strings and other types that have a length property.
  /// It returns an error message if the value is not equal to the specified length.
  /// The [length] parameter specifies the desired length that the value should have.
  /// Example usage:
  ///
  /// ```dart
  /// final validator = EqualLengthValidator(10,'Value must be equal to 10');
  /// String? result = validator.validate("test");
  /// print(result); // 'Value must be equal to 10'
  /// ```
  const EqualLengthValidator(this.length, [super.errorMessage]);

  /// A validator that checks if the length of a value is equal to a specified length.
  ///
  /// The [length] parameter specifies the desired length that the value should have.
  final int length;

  @override
  String? validate(String? value) {
    if (value != null) {
      if (value.length != length) {
        return getErrorMessage(
          EasyValidatorMessages.instance.equalLength,
          length.toString(),
        );
      }
    }
    return null;
  }
}
