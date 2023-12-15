import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_easy_validator/flutter_easy_validator.dart';

void main() {
  test('adds one to input values', () {
    final validator = EasyValidatorMessages.instance
      ..required = 'Required field'
      ..email = 'Please enter valid email address'
      ..minLength = 'This field must have at least {0} letters'
      ..maxLength = 'This field must have at most {0} letters';
    expect(validator.required, 'Required field');
    expect(validator.email, 'Please enter valid email address');
    expect(validator.minLength, 'This field must have at least {0} letters');
    expect(validator.maxLength, 'This field must have at most {0} letters');
  });

  test("test required validator", () {
    const validator = RequiredValidator(
      'This field is required',
    );
    String? result = validator.validate(null);
    expect(result, null);
    result = validator.validate('');
    expect(result, 'This field is required');
    result = validator.validate(' ');
    expect(result, 'This field is required');
    result = validator.validate('test');
    expect(result, null);
  });

  test("test email validator", () {
    const validator = EmailValidator(
      'Invalid email address',
    );
    String? result = validator.validate(null);
    expect(result, 'Invalid email address');
    result = validator.validate('');
    expect(result, 'Invalid email address');
    result = validator.validate(' ');
    expect(result, 'Invalid email address');
    result = validator.validate('test');
    expect(result, 'Invalid email address');
    result = validator.validate('test@');
    expect(result, 'Invalid email address');
    result = validator.validate('test@test');
    expect(result, 'Invalid email address');
    result = validator.validate('test@test.');
    expect(result, 'Invalid email address');
    result = validator.validate('test@test.c');
    expect(result, 'Invalid email address');
    result = validator.validate('test@test.com');
    expect(result, null);
  });

  test("test min length validator", () {
    const validator = MinLengthValidator(
      5,
      'Value must have at least {0} characters',
    );
    String? result = validator.validate(null);
    expect(result, null);
    result = validator.validate('');
    expect(result, 'Value must have at least 5 characters');
    result = validator.validate(' ');
    expect(result, 'Value must have at least 5 characters');
    result = validator.validate('test');
    expect(result, 'Value must have at least 5 characters');
    result = validator.validate('test1');
    expect(result, null);
  });

  test("test max length validator", () {
    const validator = MaxLengthValidator(
      5,
      'Value must have at most {0} characters',
    );
    String? result = validator.validate(null);
    expect(result, null);
    result = validator.validate('');
    expect(result, null);
    result = validator.validate(' ');
    expect(result, null);
    result = validator.validate('test');
    expect(result, null);
    result = validator.validate('test1');
    expect(result, null);
    result = validator.validate('test12');
    expect(result, 'Value must have at most 5 characters');
  });

  group(
    "test start with validator",
    () {
      test(
        "test start with validator caseSensitive is true and useTrim is false",
        () {
          const validator = StartWithValidator(
            'Hello',
            caseSensitive: true,
            useTrim: false,
            errorMessage: 'Value must start with {0}',
          );
          String? result = validator.validate(null);
          expect(result, null);
          result = validator.validate('');
          expect(result, 'Value must start with Hello');
          result = validator.validate(' ');
          expect(result, 'Value must start with Hello');
          result = validator.validate('test');
          expect(result, 'Value must start with Hello');
          result = validator.validate('Hello');
          expect(result, null);
          result = validator.validate('hello');
          expect(result, 'Value must start with Hello');
          result = validator.validate('hello world');
          expect(result, 'Value must start with Hello');
          result = validator.validate('Hello world');
          expect(result, null);
        },
      );

      test(
        "test start with validator caseSensitive is false and useTrim is false",
        () {
          const validator = StartWithValidator(
            'Hello',
            caseSensitive: false,
            useTrim: false,
            errorMessage: 'Value must start with {0}',
          );
          String? result = validator.validate(null);
          expect(result, null);
          result = validator.validate('');
          expect(result, 'Value must start with Hello');
          result = validator.validate(' ');
          expect(result, 'Value must start with Hello');
          result = validator.validate('test');
          expect(result, 'Value must start with Hello');
          result = validator.validate('Hello');
          expect(result, null);
          result = validator.validate('hello');
          expect(result, null);
          result = validator.validate('HEllo');
          expect(result, null);
          result = validator.validate('HELLO');
          expect(result, null);
        },
      );

      test(
        "test start with validator caseSensitive is true and useTrim is true",
        () {
          const validator = StartWithValidator(
            'Hello',
            caseSensitive: true,
            useTrim: true,
            errorMessage: 'Value must start with {0}',
          );
          String? result = validator.validate(null);
          expect(result, null);
          result = validator.validate('');
          expect(result, 'Value must start with Hello');
          result = validator.validate(' ');
          expect(result, 'Value must start with Hello');
          result = validator.validate('test');
          expect(result, 'Value must start with Hello');
          result = validator.validate('Hello');
          expect(result, null);
          result = validator.validate('hello');
          expect(result, 'Value must start with Hello');
          result = validator.validate('hello world');
          expect(result, 'Value must start with Hello');
          result = validator.validate('Hello world');
          expect(result, null);
          result = validator.validate('  Hello world');
          expect(result, null);
          result = validator.validate('  Hello world  ');
          expect(result, null);
        },
      );
    },
  );

  group(
    "test end with validator",
    () {
      test(
        "test end with validator caseSensitive is true and useTrim is false",
        () {
          const validator = EndWithValidator(
            'World',
            caseSensitive: true,
            useTrim: false,
            errorMessage: 'Value must end with {0}',
          );
          String? result = validator.validate(null);
          expect(result, null);
          result = validator.validate('');
          expect(result, 'Value must end with World');
          result = validator.validate(' ');
          expect(result, 'Value must end with World');
          result = validator.validate('test');
          expect(result, 'Value must end with World');
          result = validator.validate('World');
          expect(result, null);
          result = validator.validate('world');
          expect(result, 'Value must end with World');
          result = validator.validate('hello world');
          expect(result, 'Value must end with World');
          result = validator.validate('Hello world');
          expect(result, 'Value must end with World');
          result = validator.validate('Hello World');
          expect(result, null);
        },
      );

      test(
        "test end with validator caseSensitive is false and useTrim is false",
        () {
          const validator = EndWithValidator(
            'World',
            caseSensitive: false,
            useTrim: false,
            errorMessage: 'Value must end with {0}',
          );
          String? result = validator.validate(null);
          expect(result, null);
          result = validator.validate('');
          expect(result, 'Value must end with World');
          result = validator.validate(' ');
          expect(result, 'Value must end with World');
          result = validator.validate('test');
          expect(result, 'Value must end with World');
          result = validator.validate('World');
          expect(result, null);
          result = validator.validate('world');
          expect(result, null);
          result = validator.validate('wOrld');
          expect(result, null);
          result = validator.validate('WORLD');
          expect(result, null);
        },
      );

      test(
        "test end with validator caseSensitive is true and useTrim is true",
        () {
          const validator = EndWithValidator(
            'World',
            caseSensitive: true,
            useTrim: true,
            errorMessage: 'Value must end with {0}',
          );
          String? result = validator.validate(null);
          expect(result, null);
          result = validator.validate('');
          expect(result, 'Value must end with World');
          result = validator.validate(' ');
          expect(result, 'Value must end with World');
          result = validator.validate('test');
          expect(result, 'Value must end with World');
          result = validator.validate('World');
          expect(result, null);
          result = validator.validate('world');
          expect(result, 'Value must end with World');
          result = validator.validate('hello world');
          expect(result, 'Value must end with World');
          result = validator.validate('Hello world');
          expect(result, 'Value must end with World');
          result = validator.validate('Hello World');
          expect(result, null);
          result = validator.validate('Hello World  ');
          expect(result, null);
          result = validator.validate('  Hello World  ');
          expect(result, null);
        },
      );
    },
  );

  group("test equal to validator", () {
    test(
      "test equal to validator caseSensitive is true and useTrim is false",
      () {
        const validator = EqualToValidator(
          'Hello',
          caseSensitive: true,
          useTrim: false,
          errorMessage: 'Value must equal to {0}',
        );
        String? result = validator.validate(null);
        expect(result, null);
        result = validator.validate('');
        expect(result, 'Value must equal to Hello');
        result = validator.validate(' ');
        expect(result, 'Value must equal to Hello');
        result = validator.validate('test');
        expect(result, 'Value must equal to Hello');
        result = validator.validate('Hello');
        expect(result, null);
        result = validator.validate('hello');
        expect(result, 'Value must equal to Hello');
        result = validator.validate('hello world');
        expect(result, 'Value must equal to Hello');
        result = validator.validate('Hello world');
        expect(result, 'Value must equal to Hello');
        result = validator.validate('Hello World');
        expect(result, 'Value must equal to Hello');
      },
    );
    test(
      "test equal to validator caseSensitive is false and useTrim is false",
      () {
        const validator = EqualToValidator(
          'Hello',
          caseSensitive: false,
          useTrim: false,
          errorMessage: 'Value must equal to {0}',
        );
        String? result = validator.validate(null);
        expect(result, null);
        result = validator.validate('');
        expect(result, 'Value must equal to Hello');
        result = validator.validate(' ');
        expect(result, 'Value must equal to Hello');
        result = validator.validate('test');
        expect(result, 'Value must equal to Hello');
        result = validator.validate('Hello');
        expect(result, null);
        result = validator.validate('hello');
        expect(result, null);
        result = validator.validate('HEllo');
        expect(result, null);
        result = validator.validate('HELLO');
        expect(result, null);
      },
    );
    test(
      "test equal to validator caseSensitive is true and useTrim is true",
      () {
        const validator = EqualToValidator(
          'Hello',
          caseSensitive: true,
          useTrim: true,
          errorMessage: 'Value must equal to {0}',
        );
        String? result = validator.validate(null);
        expect(result, null);
        result = validator.validate('');
        expect(result, 'Value must equal to Hello');
        result = validator.validate(' ');
        expect(result, 'Value must equal to Hello');
        result = validator.validate('test');
        expect(result, 'Value must equal to Hello');
        result = validator.validate('Hello');
        expect(result, null);
        result = validator.validate('   Hello');
        expect(result, null);
        result = validator.validate('Hello   ');
        expect(result, null);
        result = validator.validate('   Hello   ');
        expect(result, null);
        result = validator.validate('hello');
        expect(result, 'Value must equal to Hello');
        result = validator.validate('hello world');
        expect(result, 'Value must equal to Hello');
        result = validator.validate('Hello world');
        expect(result, 'Value must equal to Hello');
        result = validator.validate('Hello World');
        expect(result, 'Value must equal to Hello');
      },
    );
  });

  group("test not equal to validator", () {
    test(
      "test not equal to validator caseSensitive is true and useTrim is false",
      () {
        const validator = NotEqualToValidator(
          'Hello',
          caseSensitive: true,
          useTrim: false,
          errorMessage: 'Value must not equal to {0}',
        );
        String? result = validator.validate(null);
        expect(result, null);
        result = validator.validate('');
        expect(result, null);
        result = validator.validate(' ');
        expect(result, null);
        result = validator.validate('test');
        expect(result, null);
        result = validator.validate('Hello');
        expect(result, 'Value must not equal to Hello');
        result = validator.validate('hello');
        expect(result, null);
        result = validator.validate('hello world');
        expect(result, null);
        result = validator.validate('Hello world');
        expect(result, null);
        result = validator.validate('Hello World');
        expect(result, null);
      },
    );
    test(
      "test not equal to validator caseSensitive is false and useTrim is false",
      () {
        const validator = NotEqualToValidator(
          'Hello',
          caseSensitive: false,
          useTrim: false,
          errorMessage: 'Value must not equal to {0}',
        );
        String? result = validator.validate(null);
        expect(result, null);
        result = validator.validate('');
        expect(result, null);
        result = validator.validate(' ');
        expect(result, null);
        result = validator.validate('test');
        expect(result, null);
        result = validator.validate('Hello');
        expect(result, 'Value must not equal to Hello');
        result = validator.validate('hello');
        expect(result, 'Value must not equal to Hello');
        result = validator.validate('HEllo');
        expect(result, 'Value must not equal to Hello');
        result = validator.validate('HELLO');
        expect(result, 'Value must not equal to Hello');
      },
    );
    test(
        "test not equal to validator caseSensitive is true and useTrim is true",
        () {
      const validator = NotEqualToValidator(
        'Hello',
        caseSensitive: true,
        useTrim: true,
        errorMessage: 'Value must not equal to {0}',
      );
      String? result = validator.validate(null);
      expect(result, null);
      result = validator.validate('');
      expect(result, null);
      result = validator.validate(' ');
      expect(result, null);
      result = validator.validate('test');
      expect(result, null);
      result = validator.validate('Hello');
      expect(result, 'Value must not equal to Hello');
      result = validator.validate('  Hello');
      expect(result, 'Value must not equal to Hello');
      result = validator.validate('Hello  ');
      expect(result, 'Value must not equal to Hello');
      result = validator.validate('  Hello  ');
      expect(result, 'Value must not equal to Hello');
      result = validator.validate('hello');
      expect(result, null);
      result = validator.validate('hello world');
      expect(result, null);
      result = validator.validate('Hello world');
      expect(result, null);
    });
  });

  group("test contains validator", () {
    test(
      "test contains validator and caseSensitive is true",
      () {
        const validator = ContainsValidator(
          'Hello',
          caseSensitive: true,
        );
        String? result = validator.validate(null);
        expect(result, null);
        result = validator.validate('');
        expect(result, 'This field must contain Hello');
        result = validator.validate(' ');
        expect(result, 'This field must contain Hello');
        result = validator.validate('test');
        expect(result, 'This field must contain Hello');
        result = validator.validate('Hello');
        expect(result, null);
        result = validator.validate('hello');
        expect(result, 'This field must contain Hello');
        result = validator.validate('hello world');
        expect(result, 'This field must contain Hello');
        result = validator.validate('Hello world');
        expect(result, null);
        result = validator.validate('Hello World');
        expect(result, null);
      },
    );
    test(
      "test contains validator and caseSensitive is false",
      () {
        const validator = ContainsValidator(
          'Hello',
          caseSensitive: false,
        );
        String? result = validator.validate(null);
        expect(result, null);
        result = validator.validate('');
        expect(result, 'This field must contain Hello');
        result = validator.validate(' ');
        expect(result, 'This field must contain Hello');
        result = validator.validate('test');
        expect(result, 'This field must contain Hello');
        result = validator.validate('Hello');
        expect(result, null);
        result = validator.validate('hello');
        expect(result, null);
        result = validator.validate('HEllo');
        expect(result, null);
        result = validator.validate('HELLO');
        expect(result, null);
        result = validator.validate('hello world');
        expect(result, null);
        result = validator.validate('Hello world');
        expect(result, null);
        result = validator.validate('Hello World');
        expect(result, null);
      },
    );
  });

  group("test not contains validator", () {
    test(
      "test not contains validator and caseSensitive is false",
      () {
        const validator = NotContainsValidator(
          'Hello',
          caseSensitive: false,
        );
        String? result = validator.validate(null);
        expect(result, null);
        result = validator.validate('');
        expect(result, null);
        result = validator.validate(' ');
        expect(result, null);
        result = validator.validate('test');
        expect(result, null);
        result = validator.validate('Hello');
        expect(result, 'This field must not contain Hello');
        result = validator.validate('hello');
        expect(result, 'This field must not contain Hello');
        result = validator.validate('hello world');
        expect(result, 'This field must not contain Hello');
        result = validator.validate('Hello world');
        expect(result, 'This field must not contain Hello');
        result = validator.validate('Hello World');
        expect(result, 'This field must not contain Hello');
      },
    );
    test(
      "test not contains validator and caseSensitive is true",
      () {
        const validator = NotContainsValidator(
          'Hello',
          caseSensitive: true,
        );
        String? result = validator.validate(null);
        expect(result, null);
        result = validator.validate('');
        expect(result, null);
        result = validator.validate(' ');
        expect(result, null);
        result = validator.validate('test');
        expect(result, null);
        result = validator.validate('Hello');
        expect(result, 'This field must not contain Hello');
        result = validator.validate('hello');
        expect(result, null);
        result = validator.validate('hello world');
        expect(result, null);
        result = validator.validate('Hello world');
        expect(result, 'This field must not contain Hello');
        result = validator.validate('Hello World');
        expect(result, 'This field must not contain Hello');
      },
    );
  });

  group("test min word count validator", () {
    test(
      "test min word count validator",
      () {
        const validator = MinWordCountValidator(
          2,
          'Value must have at least {0} words',
        );
        String? result = validator.validate(null);
        expect(result, null);
        result = validator.validate('');
        expect(result, null);
        result = validator.validate(' ');
        expect(result, 'Value must have at least 2 words');
        result = validator.validate('test');
        expect(result, 'Value must have at least 2 words');
        result = validator.validate('test test');
        expect(result, null);
        result = validator.validate('test test test');
        expect(result, null);
      },
    );
  });

  group("test max word count validator", () {
    test(
      "test max word count validator",
      () {
        const validator = MaxWordCountValidator(
          2,
          'Value must have at most {0} words',
        );
        String? result = validator.validate(null);
        expect(result, null);
        result = validator.validate('');
        expect(result, null);
        result = validator.validate(' ');
        expect(result, null);
        result = validator.validate('test');
        expect(result, null);
        result = validator.validate('test test');
        expect(result, null);
        result = validator.validate('test test test');
        expect(result, 'Value must have at most 2 words');
      },
    );
  });

  group("test regex validator", () {
    test(
      "test regex validator",
      () {
        final validator = RegularExpressionValidator(
          RegExp(r'^[a-zA-Z0-9]+$'),
          'This field is invalid',
        );
        String? result = validator.validate(null);
        expect(result, null);
        result = validator.validate('');
        expect(result, 'This field is invalid');
        result = validator.validate(' ');
        expect(result, 'This field is invalid');
        result = validator.validate('test');
        expect(result, null);
        result = validator.validate('test test');
        expect(result, 'This field is invalid');
        result = validator.validate('test test test');
        expect(result, 'This field is invalid');
      },
    );
  });

  group("test contains numbers validator", () {
    test(
      "test contains numbers validator",
      () {
        const validator = ContainsNumbersValidator(
          errorMessage: 'This field must contain numbers',
        );
        String? result = validator.validate(null);
        expect(result, null);
        result = validator.validate('');
        expect(result, 'This field must contain numbers');
        result = validator.validate(' ');
        expect(result, 'This field must contain numbers');
        result = validator.validate('test');
        expect(result, 'This field must contain numbers');
        result = validator.validate('test test');
        expect(result, 'This field must contain numbers');
        result = validator.validate('test test test');
        expect(result, 'This field must contain numbers');
        result = validator.validate('test1');
        expect(result, null);
        result = validator.validate('test1 test');
        expect(result, null);
        result = validator.validate('test1 test1');
        expect(result, null);
        result = validator.validate('test1 test1 test1');
        expect(result, null);
      },
    );
  });

  group("test equal length validator", () {
    test(
      "test equal length validator",
      () {
        const validator = EqualLengthValidator(
          5,
          'This field must be exactly {0} characters long',
        );
        String? result = validator.validate(null);
        expect(result, null);
        result = validator.validate('');
        expect(result, 'This field must be exactly 5 characters long');
        result = validator.validate(' ');
        expect(result, 'This field must be exactly 5 characters long');
        result = validator.validate('test');
        expect(result, 'This field must be exactly 5 characters long');
        result = validator.validate('test test');
        expect(result, 'This field must be exactly 5 characters long');
        result = validator.validate('test test test');
        expect(result, 'This field must be exactly 5 characters long');
        result = validator.validate('test1');
        expect(result, null);
        result = validator.validate('test1 test');
        expect(result, 'This field must be exactly 5 characters long');
        result = validator.validate('12345');
        expect(result, null);
        result = validator.validate('test1');
        expect(result, null);
      },
    );
  });

  group("test not equal length validator", () {
    test(
      "test not equal length validator",
      () {
        const validator = NotEqualLengthValidator(
          5,
          'This field must not be exactly {0} characters long',
        );
        String? result = validator.validate(null);
        expect(result, null);
        result = validator.validate('');
        expect(result, null);
        result = validator.validate(' ');
        expect(result, null);
        result = validator.validate('test');
        expect(result, null);
        result = validator.validate('test test');
        expect(result, null);
        result = validator.validate('test test test');
        expect(result, null);
        result = validator.validate('test1');
        expect(result, 'This field must not be exactly 5 characters long');
        result = validator.validate('test1 test');
        expect(result, null);
        result = validator.validate('12345');
        expect(result, 'This field must not be exactly 5 characters long');
        result = validator.validate('1 2 3 ');
        expect(result, 'This field must not be exactly 5 characters long');
      },
    );
  });
}
