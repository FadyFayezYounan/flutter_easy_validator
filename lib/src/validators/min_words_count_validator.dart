import '../easy_validator.dart';
import '../easy_validator_mixin.dart';
import '../utils/utils.dart';

final class MinWordCountValidator extends EasyValidator
    with EasyValidatorMixin {
  /// A validator that checks if the number of words in a value is greater than or equal to a specified minimum word count.
  ///
  /// This validator is used to validate strings and other types that have a length property.
  /// It returns an error message if the value is shorter than the specified minimum word count.
  ///
  /// Example usage:
  /// ```dart
  /// final validator = MinWordCountValidator(2, 'Value must have at least 2 words');
  /// validator.validate('hello world'); // returns null
  /// validator.validate('hi'); // returns 'Value must have at least 2 words'
  /// ```
  const MinWordCountValidator(this.minWordCount, [super.errorMessage]);

  /// The minimum word count that the value must have.
  /// The [minWordCount] is the minimum word count that the value must have.
  final int minWordCount;

  @override
  String? validate(String? value) {
    assert(minWordCount > 0, 'The minimum words count must be greater than 0');
    if (value != null && value.isNotEmpty) {
      final words = value.trim().split(' ');
      if (words.length < minWordCount) {
        return getErrorMessage(
          EasyValidatorMessages.instance.minWordCount,
          minWordCount.toString(),
        );
      }
    }
    return null;
  }
}
