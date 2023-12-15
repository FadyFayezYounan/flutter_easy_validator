import 'package:flutter_easy_validator/flutter_easy_validator.dart';
import 'package:flutter/material.dart';

class FormExample extends StatefulWidget {
  const FormExample({super.key});

  @override
  State<FormExample> createState() => _FormExampleState();
}

class _FormExampleState extends State<FormExample> {
  final _formKey = GlobalKey<FormState>();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormField(
            decoration: const InputDecoration(
              hintText: 'name validator',
            ),
            validator: const EasyValidator.required().validate,
          ),
          TextFormField(
            decoration: const InputDecoration(
              hintText: 'email validator',
            ),
            validator: const EasyValidator.email().validate,
          ),
          TextFormField(
            controller: _passwordController,
            decoration: const InputDecoration(
              hintText: 'password validator',
            ),
            validator: const EasyValidator.compose([
              EasyValidator.required(),
              EasyValidator.minLength(8),
            ]).validate,
          ),
          TextFormField(
            decoration: const InputDecoration(
              hintText: 'confirm password validator',
            ),
            validator: (confirmPassword) {
              return EasyValidator.compose([
                EasyValidator.equalTo(
                  _passwordController.text,
                  errorMessage: 'Password does not match',
                ),
              ]).validate(confirmPassword);
            },
          ),
          const SizedBox(height: 16.0),
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
      ),
    );
  }
}
