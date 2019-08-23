import 'package:flutter/material.dart';
import './myWidgets.dart';


class dashboard extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new _dashboardState();
}

class _dashboardState extends State<dashboard> {
  @override
  Widget build(BuildContext context) {
    //Viewport
    final vh = MediaQuery.of(context).size.height;
    final vw = MediaQuery.of(context).size.width;

    final welcome = Container(
      margin: EdgeInsets.only(bottom: 0.02 * vh, top: 20.0),
      child: Text(
        "Hi,\nWhere do you want to lookup?",
        style: TextStyle(fontWeight: FontWeight.w900),
        textScaleFactor: 1.6,
      ),
    );

    final mapImage = new Center(
      child: Image(
        image: AssetImage("assets/map.png"),
        width: 174.0,
        height: 174.0,
      ),
    );


    final search = Container(
        child: TextField(
      decoration: InputDecoration(
        //focusedBorder: Bor,
        hintText: 'Search for an area',
        suffixIcon: IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              debugPrint('222');
            }),
      ),
    ));

    final latest = Container(
      margin: EdgeInsets.only(top: 20.0),
      child: Text(
        "Latest Places",
        style: TextStyle(fontWeight: FontWeight.w900),
        textScaleFactor: 1.0,
      ),
    );

    final results = new Column(
      children: <Widget>[
        //ID, Address, Price, Name
        boardingCard("#1001","Sidhdhartha Mawatha, Colombo 05", "Monthly Fee: LKR 8000.00","Dinendra Bandara"),
        boardingCard("#1002","Reid Avenue, Colombo 07", "Monthly Fee: LKR 6000.00","Manul Madara"),
        boardingCard("#1003","Pannipitiya, Kottawa", "Monthly Fee: LKR 5000.00","Chenuka Madawela"),
      ],
    );


    return new Scaffold(
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.only(left: 18.0, right: 18.0),
          child: ListView(
            children: <Widget>[welcome, mapImage, search,latest,results],
          ),
        ),
      ),
    );
  }
}
