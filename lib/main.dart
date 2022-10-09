import 'package:flutter/material.dart';
import 'package:states/inherited_widget.dart';
import 'package:states/scoped_model.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyScopedModel(),
    );
  }
}

