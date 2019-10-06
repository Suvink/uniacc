import 'package:flutter/material.dart';
import 'dashboard.dart';
import 'details.dart';

void main() => runApp(Uniacc());


class Uniacc extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return UniaccState();
  }
}

class UniaccState extends State<Uniacc> {
  int _selectedPage = 0;
  final _pageOptions = [
    dashboard(),
    dashboard(),
    details()
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'UniAcc',
      theme: ThemeData(
        fontFamily: 'TTCommons',
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        body: _pageOptions[_selectedPage],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _selectedPage,
          onTap: (int index) {
            setState(() {
              _selectedPage = index;
            });
          },
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              title: Text("Dashboard"),
              backgroundColor: Color(0xFFE93B55)
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.dashboard),
                title: Text("My Places")
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.supervised_user_circle),
                title: Text("Profile")
            )
          ],
        ),
      ),
    );
  }
}
