import '../easy_validator.dart';
import '../easy_validator_mixin.dart';
import '../utils/utils.dart';

final class ContainsNumbersValidator extends EasyValidator
    with EasyValidatorMixin {
  /// A validator that checks if a value contains numbers.
  /// This validator is used to validate strings and other types that have a length property.
  /// It returns an error message if the value does not contain numbers.
  /// Example usage:
  ///
  /// ```dart
  /// final validator = ContainsNumbersValidator('Value must contain numbers');
  /// String? result = validator.validate("test");
  /// print(result); // 'Value must contain numbers'
  /// ```
  const ContainsNumbersValidator({this.regExp, String? errorMessage})
      : super(errorMessage);

  final RegExp? regExp;

  @override
  String? validate(String? value) {
    if (value != null) {
      if (!value.contains(regExp ?? RegExp(kDigitRegEx))) {
        return getErrorMessage(EasyValidatorMessages.instance.containsNumbers);
      }
    }
    return null;
  }

  @override
  int get hashCode => Object.hash(regExp.hashCode, errorMessage.hashCode);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ContainsNumbersValidator &&
          runtimeType == other.runtimeType &&
          hashCode == other.hashCode;
}
