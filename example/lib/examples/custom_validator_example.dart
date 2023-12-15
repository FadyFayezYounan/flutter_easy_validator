import 'package:flutter_easy_validator/flutter_easy_validator.dart';
import 'package:flutter/material.dart';

class CustomValidatorExample extends StatefulWidget {
  const CustomValidatorExample({super.key});

  @override
  State<CustomValidatorExample> createState() => _CustomValidatorExampleState();
}

class _CustomValidatorExampleState extends State<CustomValidatorExample> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Form(
            key: _formKey,
            child: TextFormField(
                decoration: const InputDecoration(
                  hintText: 'custom validator',
                ),
                validator: EasyValidator.compose([
                  const EasyValidator.required(),
                  EasyValidator.custom((value) {
                    if (value == 'test') {
                      return 'value cannot be test';
                    }
                    return null;
                  }),
                  // OR
                  const MyCustomValidation(),
                  const EasyValidator.minLength(7),
                ]).validate),
          ),
        ),
        const SizedBox(width: 16.0),
        ElevatedButton(
          onPressed: () {
            if (_formKey.currentState!.validate()) {
              ScaffoldMessenger.of(context)
                ..hideCurrentSnackBar()
                ..showSnackBar(
                  const SnackBar(content: Text('valid Data')),
                );
            }
          },
          child: const Text('Submit'),
        ),
      ],
    );
  }
}

class MyCustomValidation extends EasyValidator {
  const MyCustomValidation();

  @override
  String? validate(String? value) {
    if (value != null) {
      if (value.length == 5) {
        return ' value cannot be 5 characters long';
      }
    }
    return null;
  }
}
