import 'package:flutter/material.dart';

class profile extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new _profileState();
}

class _profileState extends State<profile> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    //Viewport
    final vh = MediaQuery.of(context).size.height;
    final vw = MediaQuery.of(context).size.width;

    final title = Container(
      alignment: Alignment.center,
      margin: EdgeInsets.only(bottom: 0.02 * vh, top: 20.0),
      child: Text(
        "Profile",
        style: TextStyle(fontWeight: FontWeight.w900),
        textScaleFactor: 1.8,
      ),
    );

    final userImage = new Container(
      child: Image(
        image: AssetImage("assets/dp.png"),
        width: 150.0,
        height: 150.0,
      )
    );

    final userInfo = new Container(
      margin: EdgeInsets.only(top: 20.0),
      alignment: Alignment.center,
      child: Column(
        children: <Widget>[
          Text(
            "Hirusha Chamod",
            style: TextStyle(fontWeight: FontWeight.w500),
            textScaleFactor: 1.6,
          ),
          Text(
            "983260039V",
            style: TextStyle(fontWeight: FontWeight.w500),
            textScaleFactor: 1.4,
          )
        ],
      ),
    );


    final returnWrapper = new ListView(
      children: <Widget>[title, userImage, userInfo],
    );

    return Scaffold(
      body: SafeArea(
        child: returnWrapper,
      ),
    );
  }
}
