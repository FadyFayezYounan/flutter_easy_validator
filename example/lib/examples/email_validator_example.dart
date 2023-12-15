import 'package:flutter_easy_validator/flutter_easy_validator.dart';
import 'package:flutter/material.dart';

class EmailValidatorExample extends StatefulWidget {
  const EmailValidatorExample({super.key});

  @override
  State<EmailValidatorExample> createState() => _EmailValidatorExampleState();
}

class _EmailValidatorExampleState extends State<EmailValidatorExample> {
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
                hintText: 'email validator',
              ),
              validator: const EasyValidator.email(
                // set custom error message
                'Please enter a valid email address',
              ).validate,
            ),
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
