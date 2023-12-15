import 'package:flutter_easy_validator/flutter_easy_validator.dart';
import 'package:flutter/material.dart';

class MinLengthValidatorExample extends StatefulWidget {
  const MinLengthValidatorExample({super.key});

  @override
  State<MinLengthValidatorExample> createState() =>
      _MinLengthValidatorExampleState();
}

class _MinLengthValidatorExampleState extends State<MinLengthValidatorExample> {
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
                hintText: 'min length validator',
              ),
              validator: const EasyValidator.minLength(5).validate,
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
