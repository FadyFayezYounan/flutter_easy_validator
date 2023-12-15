import '../easy_validator.dart';
import '../easy_validator_mixin.dart';
import '../utils/utils.dart';

final class EqualToValidator extends EasyValidator with EasyValidatorMixin {
  /// A validator that checks if a value is equal to another value.
  /// This validator is used to validate strings and other types that have a length property.
  /// It returns an error message if the value is not equal to another value.
  /// Example usage:
  ///
  /// ```dart
  /// final validator = EqualToValidator('Hello', errorMessage: 'Value must be equal to Hello');
  /// String? result = validator.validate("test");
  /// print(result); // 'Value must be equal to Hello'
  /// ```
  const EqualToValidator(
    this.equalTo, {
    this.caseSensitive = true,
    this.useTrim = false,
    String? errorMessage,
  }) : super(errorMessage);

  /// The [equalTo] parameter specifies the string that the value being validated should be equal to.
  final String equalTo;

  /// The [caseSensitive] parameter determines whether the comparison should be case-sensitive or not.
  final bool caseSensitive;

  /// The [useTrim] parameter determines whether the comparison should ignore string leading and trailing whitespace or not.
  final bool useTrim;

  @override
  String? validate(String? value) {
    if (value == null) _getErrorMessage();
    if (value != null) {
      String? equalToText = useTrim ? equalTo.trim() : equalTo;
      String? text = useTrim ? value.trim() : value;
      if (!caseSensitive) {
        if (text.toLowerCase() != equalToText.toLowerCase()) {
          return _getErrorMessage();
        }
      } else {
        if (text != equalToText) {
          return _getErrorMessage();
        }
      }
    }
    return null;
  }

  String _getErrorMessage() {
    return getErrorMessage(
      EasyValidatorMessages.instance.equalTo,
      equalTo,
    );
  }

  @override
  int get hashCode => Object.hash(
        equalTo.hashCode,
        caseSensitive.hashCode,
        useTrim.hashCode,
        errorMessage.hashCode,
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is EqualToValidator &&
          runtimeType == other.runtimeType &&
          hashCode == other.hashCode;
}
