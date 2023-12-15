import '../easy_validator.dart';
import '../easy_validator_mixin.dart';
import '../utils/utils.dart';

final class ContainsValidator extends EasyValidator with EasyValidatorMixin {
  /// A validator that checks if a value contains a specified string.
  /// This validator is used to validate strings and other types that have a length property.
  /// It returns an error message if the value does not contain the specified string.
  /// The [contains] parameter specifies the desired string that the value should contain.
  /// Example usage:
  ///
  /// ```dart
  /// final validator = ContainsValidator('Hello','Value must contain Hello');
  /// String? result = validator.validate("test");
  /// print(result); // 'Value must contain Hello'
  /// ```
  const ContainsValidator(
    this.contains, {
    this.caseSensitive = true,
    String? errorMessage,
  }) : super(errorMessage);

  /// A validator that checks if a value contains a specified string.
  ///
  /// The [contains] parameter specifies the desired string that the value should contain.
  final String contains;

  /// The [caseSensitive] parameter determines whether the comparison should be case-sensitive or not.
  final bool caseSensitive;

  @override
  String? validate(String? value) {
    if (value != null) {
      if (caseSensitive) {
        if (!value.contains(contains)) {
          return getErrorMessage(
            EasyValidatorMessages.instance.contains,
            contains,
          );
        }
      } else {
        if (!value.toLowerCase().contains(contains.toLowerCase())) {
          return getErrorMessage(
            EasyValidatorMessages.instance.contains,
            contains,
          );
        }
      }
    }
    return null;
  }

  @override
  int get hashCode => Object.hash(
        contains.hashCode,
        caseSensitive.hashCode,
        errorMessage.hashCode,
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ContainsValidator &&
          runtimeType == other.runtimeType &&
          hashCode == other.hashCode;
}
