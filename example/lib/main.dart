import 'package:flutter/material.dart';

import 'examples/examples.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Easy Validator Examples',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: const SingleChildScrollView(
        padding: EdgeInsets.all(24.0),
        child: Column(
          children: <Widget>[
            RequiredValidatorExample(),
            SizedBox(height: 16.0),
            MinLengthValidatorExample(),
            SizedBox(height: 16.0),
            ComposeValidatorExample(),
            SizedBox(height: 16.0),
            CustomValidatorExample(),
            SizedBox(height: 16.0),
            EmailValidatorExample(),
            SizedBox(height: 16.0),
            FormExample(),
          ],
        ),
      ),
    );
  }
}
