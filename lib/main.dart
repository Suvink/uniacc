import 'package:flutter/material.dart';
import 'dashboard.dart';
import 'details.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'UniAcc',
      theme: ThemeData(
        fontFamily: 'TTCommons',
        primarySwatch: Colors.blue,
      ),
      home: dashboard(),
    );
  }
}
