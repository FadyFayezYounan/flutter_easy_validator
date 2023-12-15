import 'package:flutter_easy_validator/flutter_easy_validator.dart';
import 'package:flutter/material.dart';

class RequiredValidatorExample extends StatefulWidget {
  const RequiredValidatorExample({super.key});

  @override
  State<RequiredValidatorExample> createState() =>
      _RequiredValidatorExampleState();
}

class _RequiredValidatorExampleState extends State<RequiredValidatorExample> {
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
                hintText: 'required validator',
              ),
              validator: const EasyValidator.required().validate,
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
