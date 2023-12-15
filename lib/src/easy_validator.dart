import 'utils/utils.dart';
import 'validators/validators.dart';

abstract class EasyValidator {
  const EasyValidator([this.errorMessage]);
  final String? errorMessage;

  /// Validates the given [value] and returns an error message if the value is invalid.
  String? validate(String? value);

  /// Composes multiple validators into a single validator.
  ///
  /// The [validators] parameter is a list of [EasyValidator] instances that will be composed together.
  /// The resulting validator will apply each of the composed validators in the order they appear in the list.
  /// If any of the composed validators fail, the composed validator will also fail.
  ///
  /// Example usage:
  /// ```dart
  /// final validator = EasyValidator.compose([
  ///   EasyValidator.required(),
  ///   EasyValidator.minLength(8),
  ///   EasyValidator.maxLength(20),
  /// ]);
  /// String? result = validator.validate("");
  /// print(result); // 'This field is required'
  /// ```
  const factory EasyValidator.compose(List<EasyValidator> validators) =
      _FormValidationCompose;

  /// A factory constructor for creating a required validator.
  ///
  /// The [errorMessage] parameter is the error message to be displayed when the value is not provided.
  /// If no [errorMessage] is provided, the default error message will be used.
  /// The default error message is 'This field is required'.
  /// Example usage:
  /// ```dart
  /// final validator = EasyValidator.required('Username is required');
  /// String? result = validator.validate("");
  /// print(result); // 'Username is required'
  /// ```
  const factory EasyValidator.required([String? errorMessage]) =
      RequiredValidator;

  /// A factory constructor for creating a [MinLengthValidator].
  ///
  /// The [errorMessage] is the error message to be displayed when the validation fails.
  /// The [minLength] is the minimum length required for the validation to pass.
  /// Example usage:
  /// ```dart
  /// final validator = EasyValidator.minLength(8,'Value must have at least 8 characters');
  /// String? result = validator.validate("test");
  /// print(result); // 'Value must have at least 8 characters'
  /// ```

  const factory EasyValidator.minLength(int minLength, [String? errorMessage]) =
      MinLengthValidator;

  /// A factory constructor for creating a [MaxLengthValidator].
  ///
  /// The [errorMessage] is the error message to be displayed when the validation fails.
  /// The [maxLength] is the maximum length allowed for the value being validated.
  /// Example usage:
  /// ```dart
  /// final validator = EasyValidator.maxLength(8,'Value must have at most 8 characters');
  /// String? result = validator.validate("test long text");
  /// print(result); // 'Value must have at most 8 characters'
  /// ```

  const factory EasyValidator.maxLength(int maxLength, [String? errorMessage]) =
      MaxLengthValidator;

  /// A factory constructor for creating a regular expression validator.
  ///
  /// The [errorMessage] parameter is the error message to be displayed when the validation fails.
  /// The [regularExpression] parameter is the regular expression pattern to be used for validation.
  /// Example usage:
  /// ```dart
  /// final validator = EasyValidator.regularExpression(RegExp(r'^[a-zA-Z0-9]+$'),'Value must contain only letters and numbers');
  /// String? result = validator.validate("test");
  /// print(result); // 'Value must contain only letters and numbers'
  /// ```
  const factory EasyValidator.regExp(RegExp regExp, [String? errorMessage]) =
      RegularExpressionValidator;

  /// A factory constructor for creating a custom validator.
  ///
  /// The [validator] parameter is a callback function that takes a value of type [T]
  /// and returns a boolean indicating whether the value is valid or not.
  ///
  /// Example usage:
  /// ```dart
  /// final validator = EasyValidator.custom((value) {
  ///   // Custom validation logic here
  ///   value?.isEmpty == true ? 'Username is required' : null
  /// });
  /// ```
  const factory EasyValidator.custom(ValidatorCallback<String> validator) =
      CustomValidator;

  /// Creates an instance of [EmailValidator] with the provided [errorMessage].
  ///
  /// The [EmailValidator] is used to validate email addresses.
  ///
  /// Example usage:
  /// ```dart
  /// final email = 'example@example';
  /// const validator = EasyValidator.email('Invalid email');
  /// String? result = validator.validate(email);
  /// print(result); // Output: 'Invalid email'
  ///
  /// ```
  const factory EasyValidator.email([String? errorMessage]) = EmailValidator;

  /// A factory constructor for creating an [EqualLengthValidator].
  ///
  /// The [EqualLengthValidator] validates that a given input has a length equal to the specified [length].
  /// An optional [errorMessage] can be provided to customize the error message.
  ///
  /// Example usage:
  /// ```dart
  /// final validator = EasyValidator.equalLength(10,'Value must be equal to 10');
  /// String? result = validator.validate("test");
  /// print(result); // 'Value must be equal to 10'
  /// ```
  const factory EasyValidator.equalLength(int length, [String? errorMessage]) =
      EqualLengthValidator;

  /// A factory constructor for creating a [StartWithValidator].
  ///
  /// The [startWith] parameter specifies the string that the value being validated should start with.
  /// The [errorMessage] parameter is an optional error message to be displayed if the validation fails.
  ///
  /// Example usage:
  /// ```dart
  /// final validator = EasyValidator.startWith('Hello','Value must start with Hello');
  /// String? result = validator.validate("test");
  /// print(result); // 'Value must start with Hello'
  const factory EasyValidator.startWith(
    String startWith, {
    bool caseSensitive,
    bool useTrim,
    String? errorMessage,
  }) = StartWithValidator;

  /// A factory constructor for creating an [EndWithValidator].
  /// The [endWith] parameter specifies the string that the value being validated should end with.
  /// The [errorMessage] parameter is an optional error message to be displayed if the validation fails.
  /// Example usage:
  /// ```dart
  /// final validator = EasyValidator.endWith('Hello','Value must end with Hello');
  /// String? result = validator.validate("test");
  /// print(result); // 'Value must end with Hello'
  /// ```
  const factory EasyValidator.endWith(
    String endWith, {
    bool caseSensitive,
    bool useTrim,
    String? errorMessage,
  }) = EndWithValidator;

  /// A factory constructor for creating a [ContainsValidator].
  /// The [contains] parameter specifies the string that the value being validated should contain.
  /// The [errorMessage] parameter is an optional error message to be displayed if the validation fails.
  /// Example usage:
  /// ```dart
  /// final validator = EasyValidator.contains('Hello','Value must contain Hello');
  /// String? result = validator.validate("test");
  /// print(result); // 'Value must contain Hello'
  /// ```
  const factory EasyValidator.contains(
    String contains, {
    bool caseSensitive,
    String? errorMessage,
  }) = ContainsValidator;

  /// A factory constructor for creating a [ContainsNumbersValidator].
  /// The [containsNumbers] parameter specifies the string that the value being validated should contain.
  /// The [errorMessage] parameter is an optional error message to be displayed if the validation fails.
  /// Example usage:
  /// ```dart
  /// final validator = EasyValidator.containsNumbers('Hello','Value must contain Hello');
  /// String? result = validator.validate("test");
  /// print(result); // 'Value must contain Hello'
  /// ```
  const factory EasyValidator.containsNumbers({
    RegExp? regExp,
    String? errorMessage,
  }) = ContainsNumbersValidator;

  /// A factory constructor for creating a [NotEqualToValidator].
  /// The [notEqualTo] parameter specifies the string that the value being validated should not be equal to.
  /// The [errorMessage] parameter is an optional error message to be displayed if the validation fails.
  /// Example usage:
  /// ```dart
  /// final validator = EasyValidator.notEqualTo('Hello',errorMessage: 'Value must not be equal to Hello');
  /// String? result = validator.validate("Hello");
  /// print(result); // 'Value must not be equal to Hello'
  /// ```
  const factory EasyValidator.notEqualTo(
    String notEqualTo, {
    bool caseSensitive,
    bool useTrim,
    String? errorMessage,
  }) = NotEqualToValidator;

  /// A factory constructor for creating an [EqualToValidator].
  /// The [equalTo] parameter specifies the string that the value being validated should be equal to.
  /// The [errorMessage] parameter is an optional error message to be displayed if the validation fails.
  /// Example usage:
  /// ```dart
  /// final validator = EasyValidator.equalTo('Hello', errorMessage: 'Value must be equal to Hello');
  /// String? result = validator.validate("test");
  /// print(result); // 'Value must be equal to Hello'
  /// ```
  const factory EasyValidator.equalTo(
    String equalTo, {
    bool caseSensitive,
    bool useTrim,
    String? errorMessage,
  }) = EqualToValidator;

  /// A factory constructor for creating a [MinWordCountValidator].
  /// The [minWordCount] parameter specifies the minimum number of words that the value being validated should have.
  /// The [errorMessage] parameter is an optional error message to be displayed if the validation fails.
  /// Example usage:
  /// ```dart
  /// final validator = EasyValidator.minWordCount(2,'Value must have at least 2 words');
  /// String? result = validator.validate("test");
  /// print(result); // 'Value must have at least 2 words'
  /// ```
  const factory EasyValidator.minWordCount(int minWordCount,
      [String? errorMessage]) = MinWordCountValidator;

  /// A factory constructor for creating a [MaxWordCountValidator].
  /// The [maxWordCount] parameter specifies the maximum number of words that the value being validated should have.
  /// The [errorMessage] parameter is an optional error message to be displayed if the validation fails.
  /// Example usage:
  /// ```dart
  /// final validator = EasyValidator.maxWordCount(2,'Value must have at most 2 words');
  /// String? result = validator.validate("test long text");
  /// print(result); // 'Value must have at most 2 words'
  /// ```
  const factory EasyValidator.maxWordCount(int maxWordCount,
      [String? errorMessage]) = MaxWordCountValidator;

  /// A factory constructor for creating a [NotStartWithValidator].
  /// The [notStartWith] parameter specifies the string that the value being validated should not start with.
  /// The [errorMessage] parameter is an optional error message to be displayed if the validation fails.
  /// Example usage:
  /// ```dart
  /// final validator = EasyValidator.notStartWith('Hello',errorMessage: 'Value must not start with Hello');
  /// String? result = validator.validate("Hello");
  /// print(result); // 'Value must not start with Hello'
  /// ```
  const factory EasyValidator.notStartWith(
    String notStartWith, {
    bool caseSensitive,
    bool useTrim,
    String? errorMessage,
  }) = NotStartWithValidator;

  /// A factory constructor for creating a [NotEndWithValidator].
  /// The [notEndWith] parameter specifies the string that the value being validated should not end with.
  /// The [errorMessage] parameter is an optional error message to be displayed if the validation fails.
  /// Example usage:
  /// ```dart
  /// final validator = EasyValidator.notEndWith('Hello',errorMessage: 'Value must not end with Hello');
  /// String? result = validator.validate("Hello");
  /// print(result); // 'Value must not end with Hello'
  /// ```
  const factory EasyValidator.notEndWith(
    String notEndWith, {
    bool caseSensitive,
    bool useTrim,
    String? errorMessage,
  }) = NotEndWithValidator;

  /// A factory constructor for creating a [NotContainsValidator].
  /// The [notContains] parameter specifies the string that the value being validated should not contain.
  /// The [errorMessage] parameter is an optional error message to be displayed if the validation fails.
  /// Example usage:
  /// ```dart
  /// final validator = EasyValidator.notContains('Hello','Value must not contain Hello');
  /// String? result = validator.validate("Hello");
  /// print(result); // 'Value must not contain Hello'
  /// ```
  const factory EasyValidator.notContains(
    String notContains, {
    bool caseSensitive,
    String? errorMessage,
  }) = NotContainsValidator;

  /// A factory constructor for creating a [NotEqualLengthValidator].
  /// The [length] parameter specifies the length that the value being validated should not have.
  /// The [errorMessage] parameter is an optional error message to be displayed if the validation fails.
  /// Example usage:
  /// ```dart
  /// final validator = NotEqualLengthValidator(5,'Value must not have a length of 5');
  /// String? result = validator.validate("Hello");
  /// print(result); // 'Value must not have a length of 5'
  /// ```
  const factory EasyValidator.notEqualLength(int length,
      [String? errorMessage]) = NotEqualLengthValidator;
}

final class _FormValidationCompose extends EasyValidator {
  const _FormValidationCompose(this.validators) : super(null);
  final List<EasyValidator> validators;

  @override
  String? validate(String? value) {
    for (final validator in validators) {
      final error = validator.validate(value);
      if (error != null) {
        return error;
      }
    }
    return null;
  }
}
