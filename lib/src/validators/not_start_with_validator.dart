import '../easy_validator.dart';
import '../easy_validator_mixin.dart';
import '../utils/utils.dart';

final class NotStartWithValidator extends EasyValidator
    with EasyValidatorMixin {
  /// A validator that checks if a value does not start with a specified string.
  /// This validator is used to validate strings and other types that have a length property.
  /// It returns an error message if the value starts with the specified string.
  /// The [notStartWith] parameter specifies the undesired string that the value should not start with.
  /// Example usage:
  /// ```dart
  /// final validator = NotStartWithValidator('Hello',errorMessage :'Value must not start with Hello');
  /// String? result = validator.validate("Hello");
  /// print(result); // Value must not start with Hello
  /// ```
  const NotStartWithValidator(
    this.notStartWith, {
    this.caseSensitive = true,
    this.useTrim = false,
    String? errorMessage,
  }) : super(errorMessage);

  /// The [notStartWith] parameter specifies the undesired string that the value should not start with.
  final String notStartWith;

  /// The [caseSensitive] parameter determines whether the comparison should be case-sensitive or not.
  final bool caseSensitive;

  /// The [useTrim] parameter determines whether the comparison should ignore string leading and trailing whitespace or not.
  final bool useTrim;
  @override
  String? validate(String? value) {
    if (value != null) {
      String notStartWithText = useTrim ? notStartWith.trim() : notStartWith;
      String text = useTrim ? value.trim() : value;
      if (!caseSensitive) {
        if (text.toLowerCase().startsWith(notStartWithText.toLowerCase())) {
          return getErrorMessage(
            EasyValidatorMessages.instance.notStartWith,
            notStartWith,
          );
        }
      } else {
        if (text.startsWith(notStartWithText)) {
          return getErrorMessage(
            EasyValidatorMessages.instance.notStartWith,
            notStartWith,
          );
        }
      }
    }

    return null;
  }

  @override
  int get hashCode => Object.hash(
        notStartWith.hashCode,
        caseSensitive.hashCode,
        useTrim.hashCode,
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is NotStartWithValidator &&
          runtimeType == other.runtimeType &&
          hashCode == other.hashCode;
}
