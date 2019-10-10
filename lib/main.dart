import 'package:flutter/material.dart';
import 'package:uniacc/myPlaces.dart';
import 'dashboard.dart';
import 'details.dart';
import 'profile.dart';
import 'myPlaces.dart';
import 'newDash.dart';
import 'login.dart';

void main() => runApp(Uniacc());


class Uniacc extends StatefulWidget{


  @override
  State<StatefulWidget> createState() {
    return UniaccState();
  }
}

class UniaccState extends State<Uniacc> {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'UniAcc',
      theme: ThemeData(
        fontFamily: 'TTCommons',
        primarySwatch: Colors.blue,
      ),
      home: login(),
    );
  }
}
