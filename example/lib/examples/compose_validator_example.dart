import 'package:flutter/material.dart';
import 'package:flutter_easy_validator/flutter_easy_validator.dart';

class ComposeValidatorExample extends StatefulWidget {
  const ComposeValidatorExample({super.key});

  @override
  State<ComposeValidatorExample> createState() =>
      _ComposeValidatorExampleState();
}

class _ComposeValidatorExampleState extends State<ComposeValidatorExample> {
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
                hintText: 'compose validator',
              ),
              validator: const EasyValidator.compose([
                EasyValidator.required(),
                EasyValidator.minLength(5),
              ]).validate,
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
