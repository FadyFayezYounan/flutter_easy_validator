import '../easy_validator.dart';
import '../easy_validator_mixin.dart';
import '../utils/utils.dart';

final class StartWithValidator extends EasyValidator with EasyValidatorMixin {
  /// A validator that checks if a value starts with a specified string.
  /// This validator is used to validate strings and other types that have a length property.
  /// It returns an error message if the value does not start with the specified string.
  /// The [startWith] parameter specifies the desired string that the value should start with.
  /// Example usage:
  ///
  /// ```dart
  /// final validator = StartWithValidator('Hello','Value must start with Hello');
  /// String? result = validator.validate("test");
  /// print(result); // 'Value must start with Hello'
  /// ```
  const StartWithValidator(
    this.startWith, {
    this.caseSensitive = true,
    this.useTrim = false,
    String? errorMessage,
  }) : super(errorMessage);

  /// A validator that checks if a value starts with a specified string.
  ///
  /// The [startWith] parameter specifies the desired string that the value should start with.
  final String startWith;

  /// The [caseSensitive] parameter determines whether the comparison should be case-sensitive or not.
  final bool caseSensitive;

  /// The [useTrim] parameter determines whether the comparison should ignore string leading and trailing whitespace or not.
  final bool useTrim;

  @override
  String? validate(String? value) {
    if (value != null) {
      final startWithText = useTrim ? startWith.trim() : startWith;
      final text = useTrim ? value.trim() : value;
      if (!caseSensitive) {
        if (!text.toLowerCase().startsWith(startWithText.toLowerCase())) {
          return getErrorMessage(
            EasyValidatorMessages.instance.startWith,
            startWith,
          );
        }
      } else {
        if (!text.startsWith(startWithText)) {
          return getErrorMessage(
            EasyValidatorMessages.instance.startWith,
            startWith,
          );
        }
      }
    }
    return null;
  }

  @override
  int get hashCode => Object.hash(
        startWith.hashCode,
        caseSensitive.hashCode,
        useTrim.hashCode,
        errorMessage.hashCode,
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is StartWithValidator &&
          runtimeType == other.runtimeType &&
          hashCode == other.hashCode;
}
