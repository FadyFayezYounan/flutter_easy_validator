# FlutterEasyValidator

<a href="https://pub.dev/packages/flutter_easy_validator"><img src="https://img.shields.io/pub/v/flutter_easy_validator.svg" alt="Pub"></a>
<a href="https://pub.dev/packages/flutter_easy_validator/score"><img src="https://img.shields.io/pub/likes/flutter_easy_validator?logo=flutter" alt="Pub likes"></a>
<a href="https://pub.dev/packages/flutter_easy_validator/score"><img src="https://img.shields.io/pub/popularity/flutter_easy_validator?logo=flutter" alt="Pub popularity"></a>
<a href="https://pub.dev/packages/flutter_easy_validator/score"><img src="https://img.shields.io/pub/points/flutter_easy_validator?logo=flutter" alt="Pub points"></a>

`FlutterEasyValidator` is a package designed to simplify the process of validating strings in your applications. It provides a set of predefined validators for common use cases, such as email validation, number validation, and more.

## Key Features:

- **Predefined Validators**:`EasyValidator` comes with a set of predefined validators for common use cases, such as email validation, number validation, password strength checking, and more.
- **Custom Validators**: You can easily create your own custom validators by extending the `EasyValidator` class and implementing the validate method.
- **Composable Validators**: `EasyValidator` allows you to compose multiple validators together using the compose method, enabling complex validation logic.
- **Custom Error Messages**: Each validator can have a custom error message that will be returned when the validation fails.

This package is perfect for any Dart or Flutter developer looking to implement robust data validation in their applications with minimal effort.

## How To Use `EasyValidator`

Import the following package in your dart file

```dart
import 'package:flutter_easy_validator/flutter_easy_validator.dart';
```

## Usage

```dart
    TextFormField(
        decoration: const InputDecoration(
            hintText: 'required validator',
        ),
        validator: const EasyValidator.required().validate,
    ),
```

# Available Validators

| EasyValidator   | Parameters                                                                    | Description                                                                            |
| --------------- | ----------------------------------------------------------------------------- | -------------------------------------------------------------------------------------- |
| maxLength       | int maxLength, [String? errorMessage]                                         | Validates that the length of the value is not greater than the specified maxLength.    |
| regExp          | RegExp regExp, [String? errorMessage]                                         | Validates that the value matches the specified regular expression pattern.             |
| custom          | ValidatorCallback<String> validator                                           | Validates the value using a custom validation logic provided by the callback function. |
| email           | [String? errorMessage]                                                        | Validates that the value is a valid email address.                                     |
| equalLength     | int length, [String? errorMessage]                                            | Validates that the length of the value is equal to the specified length.               |
| startWith       | String startWith, {bool caseSensitive, bool useTrim, String? errorMessage}    | Validates that the value starts with the specified string.                             |
| endWith         | String endWith, {bool caseSensitive, bool useTrim, String? errorMessage}      | Validates that the value ends with the specified string.                               |
| contains        | String contains, {bool caseSensitive, String? errorMessage}                   | Validates that the value contains the specified string.                                |
| containsNumbers | {RegExp? regExp, String? errorMessage}                                        | Validates that the value contains numbers.                                             |
| notEqualTo      | String notEqualTo, {bool caseSensitive, bool useTrim, String? errorMessage}   | Validates that the value is not equal to the specified string.                         |
| equalTo         | String equalTo, {bool caseSensitive, bool useTrim, String? errorMessage}      | Validates that the value is equal to the specified string.                             |
| minWordCount    | int minWordCount, [String? errorMessage]                                      | Validates that the value has at least the specified number of words.                   |
| maxWordCount    | int maxWordCount, [String? errorMessage]                                      | Validates that the value has at most the specified number of words.                    |
| notStartWith    | String notStartWith, {bool caseSensitive, bool useTrim, String? errorMessage} | Validates that the value does not start with the specified string.                     |
| notEndWith      | String notEndWith, {bool caseSensitive, bool useTrim, String? errorMessage}   | Validates that the value does not end with the specified string.                       |
| notContains     | String notContains, {bool caseSensitive, String? errorMessage}                | Validates that the value does not contain the specified string.                        |
| notEqualLength  | int length, [String? errorMessage]                                            |
| compose         | List<EasyValidator> validators                                                | Composes multiple validators into a single validator.                                  |

## Compose validator:

Composes multiple validators into a single validator.

The [validators] parameter is a list of [`EasyValidator`] that will be composed together.
The resulting validator will apply each of the composed validators in the order they appear in the list.
If any of the composed validators fail, the composed validator will also fail.
Example usage:

```dart
    TextFormField(
      decoration: const InputDecoration(
        hintText: 'compose validator',
      ),
      validator: const EasyValidator.compose([
        EasyValidator.required(),
        EasyValidator.minLength(5),
        EasyValidator.maxLength(10),
      ]).validate,
    )
```

## Custom Validator:

You can easily create your own custom validators by extending the `EasyValidator` class and implementing the validate method.

```dart
class MyCustomValidator extends EasyValidator {
  MyCustomValidator() : super(errorMessage: 'custom validator error message');

  @override
  String? validate(String? value) {
    if (value == null || value.isEmpty) {
      return errorMessage;
    }
    return null;
  }
}
// usage:
TextFormField(
      decoration: const InputDecoration(
        hintText: 'custom validator',
      ),
      validator: const MyCustomValidator().validate,
    )
// OR
TextFormField(
      decoration: const InputDecoration(
        hintText: 'custom validator',
      ),
      validator: EasyValidator.compose([
        EasyValidator.required(),
        MyCustomValidator(),
      ]).validate,
    )
// OR use EasyValidator.custom
TextFormField(
      decoration: const InputDecoration(
        hintText: 'custom validator',
      ),
      validator: EasyValidator.compose([
        EasyValidator.required(),
        EasyValidator.custom((value) {
          if (value == null || value.isEmpty) {
            return 'custom validator error message';
          }
          return null;
        }),
      ]).validate,
    )
```

## Custom Error Message:

Each validator can have a custom error message that will be returned when the validation fails.

```dart
TextFormField(
      decoration: const InputDecoration(
        hintText: 'custom error message',
      ),
      validator: EasyValidator.compose([
        EasyValidator.required(errorMessage: 'required error message'),
        EasyValidator.minLength(5, errorMessage: 'min length error message'),
        EasyValidator.maxLength(10, errorMessage: 'max length error message'),
      ]).validate,
    )
```

## Email Validator:

```dart
TextFormField(
      decoration: const InputDecoration(
        hintText: 'email validator',
      ),
      validator: EasyValidator.email().validate,
    )
```

## Compose with Regex Validator:

```dart
TextFormField(
      decoration: const InputDecoration(
        hintText: 'compose with regex validator',
      ),
      validator: EasyValidator.compose([
        EasyValidator.required(),
        EasyValidator.regExp(RegExp(r'^[a-zA-Z0-9]+$')),
      ]).validate,
    )
```

## Set Error Messages Globally:

use `EasyValidatorMessages` to set error messages globally, this will override the default error messages.

> **NOTE:**
> you can set error messages globally in the main function of your app or in any other place before using the validators.

```dart
void main() {
  EasyValidatorMessages.instance
  ..required = 'required error message'
  ..minLength = 'min length error message'
  ..maxLength = 'max length error message'
  ..email = 'email error message'
  ..regExp = 'regExp error message'
  ..equalLength = 'equal length error message'
  ..startWith = 'start with error message'.
  .endWith = 'end with error message'
  ..contains = 'contains error message'
  ..containsNumbers = 'contains numbers error message'
  ..notEqualTo = 'not equal to error message'
  ..equalTo = 'equal to error message'
  ..minWordCount = 'min word count error message'
  ..maxWordCount = 'max word count error message'
  ..notStartWith = 'not start with error message'
  ..notEndWith = 'not end with error message'
  ..notContains = 'not contains error message'
  ..notEqualLength = 'not equal length error message' ;
  runApp(MyApp());
}
```

## Contributing

feel free to suggest any new validators or features.

## Author

- [Fady Fayez](https://github.com/FadyFayezYounan)
