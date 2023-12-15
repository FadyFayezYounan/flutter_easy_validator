/// A class that provides messages for the EasyValidator library.
///
/// This class follows the singleton design pattern, ensuring that only one instance
/// of EasyValidatorMessages is created throughout the application.
class EasyValidatorMessages {
  static EasyValidatorMessages? _instance;

  static EasyValidatorMessages get instance {
    _instance ??= EasyValidatorMessages._internal();
    return _instance!;
  }

  // Private constructor for the singleton
  EasyValidatorMessages._internal();

  /// A message indicating that a field is required.
  String required = 'This field is required';

  /// The error message displayed when an invalid email address is entered.
  ///
  /// This message is used to inform the user that the entered email address is not valid.
  String email = 'Please enter a valid email address';

  /// A message template indicating that a field must be at least a certain number of characters long.
  /// The placeholder {0} is used to indicate the minimum length value.
  String minLength = 'This field must be at least {0} characters long';

  /// A message template indicating that a field must be at most a certain number of characters long.
  /// The placeholder {0} is used to indicate where the maximum length value should be inserted.
  String maxLength = 'This field must be at most {0} characters long';

  /// A string representing the error message for an invalid field.
  String regex = 'This field is invalid';

  /// A message indicating that a field must start with a specific value.
  ///
  /// The {0} placeholder is used to indicate the expected starting value.
  String startWith = 'This field must start with {0}';

  /// A message indicating that a field must end with a specific value.
  ///
  /// The {0} placeholder is used to indicate where the specific value should be inserted.
  String endWith = 'This field must end with {0}';

  /// A message template indicating that a field must contain a specific value.
  /// The placeholder {0} can be used to indicate the expected value.
  String contains = 'This field must contain {0}';

  /// A message indicating that a field must be exactly a specified length.
  ///
  /// This message is used in the EasyValidator library to indicate that a field
  /// must have a length equal to a specified value.
  /// The `{0}` placeholder is used to represent the specified length.
  String equalLength = 'This field must be exactly {0} characters long';

  /// A message indicating that a field must contain numbers.
  ///
  String containsNumbers = 'This field must contain numbers ';

  /// A message indicating that a field must not be equal to a specific value.
  String notEqualTo = 'This field must not be equal to {0}';

  /// A message template indicating that a field must be equal to a specified value.
  String equalTo = 'This field must be equal to {0}';

  /// A message template indicating that a field must have at least a specified number of words.
  /// The placeholder {0} is used to represent the minimum word count.
  String minWordCount = 'This field must have at least {0} words';

  /// A message template indicating that a field must have at most a specified number of words.
  /// The placeholder {0} is used to indicate where the maximum word count should be inserted.
  String maxWordCount = 'This field must have at most {0} words';

  /// A message indicating that a field must not start with a specific value.
  String notStartWith = 'This field must not start with {0}';

  /// A message indicating that a field must not end with a specific value.
  ///
  /// This message is used in the EasyValidator library to provide feedback when a field ends with a specific value.
  /// The {0} placeholder is used to indicate the specific value that the field must not end with.
  String notEndWith = 'This field must not end with {0}';

  /// A message indicating that a field must not contain a specific value.
  /// The {0} placeholder is used to indicate the specific value that the field must not contain.
  String notContains = 'This field must not contain {0}';

  /// A message indicating that a field must not be exactly a specified length.
  /// The {0} placeholder is used to indicate the specific length that the field must not be.
  String notEqualLength = 'This field must not be equal to {0}';
}
