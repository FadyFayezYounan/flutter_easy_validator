import '../easy_validator.dart';
import '../easy_validator_mixin.dart';
import '../utils/utils.dart';

final class MaxWordCountValidator extends EasyValidator
    with EasyValidatorMixin {
  /// A validator that checks if the number of words in a value is less than or equal to a specified maximum word count.
  ///
  /// This validator is used to validate strings and other types that have a length property.
  /// It returns an error message if the value is longer than the specified maximum word count.
  ///
  /// Example usage:
  /// ```dart
  /// final validator = MaxWordCountValidator(2,'Value must have at most 2 words');
  /// validator.validate('hello world'); // returns null
  /// validator.validate('hello world hello'); // returns 'Value must have at most 2 words'
  /// ```
  const MaxWordCountValidator(this.maxWordCount, [super.errorMessage]);

  /// The maximum word count that the value must have.
  /// The [maxWordCount] is the maximum word count that the value must have.
  final int maxWordCount;

  @override
  String? validate(String? value) {
    assert(maxWordCount > 0, 'The maximum words count must be greater than 0');
    if (value != null && value.isNotEmpty) {
      final words = value.trim().split(' ');
      if (words.length > maxWordCount) {
        return getErrorMessage(
          EasyValidatorMessages.instance.maxWordCount,
          maxWordCount.toString(),
        );
      }
    }
    return null;
  }
}
