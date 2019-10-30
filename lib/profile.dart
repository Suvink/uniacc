import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';
//import

class profile extends StatefulWidget {

//  final String token;
//  const profile(this.token);

  @override
  State<StatefulWidget> createState() => new _profileState();
}

class _profileState extends State<profile> {
  @override
  void initState() {
    super.initState();
  }

  //Json Links
  var jsonIndex = 0;
  Future<List<usersData>> _getJson() async {
    var data = await http.get("http://35.247.185.195/api/api.json");
    var jsonData = json.decode(data.body);

    List<usersData> users = [];

    for (var i in jsonData) {
      usersData user = usersData(
        i["name"],
        i["id"],
        i["place_address"],
        i["place_fee"],
        i["place_1_title"],
        i["place_1_payment"],
        i["place_2_title"],
        i["place_2_payment"],
        i["upcoming_title_1"],
        i["upcoming_title_2"],
        i["owner"],
      );
      users.add(user);
    }
    print(users.length);
    return users;
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

    final userRating = Container(
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("4.7",
              style: TextStyle(fontWeight: FontWeight.w500),
              textScaleFactor: 0.9,
            ),
            SizedBox(width: 5.0),
            Icon(Icons.star, color: Colors.amber,size: 15.0),
          ],
        ),
      ),
    );

    final userInfo = new Container(
      margin: EdgeInsets.only(top: 20.0),
      alignment: Alignment.center,
      child: Column(
        children: <Widget>[
          userRating,
          Text(
            "Hirusha Chamod",
            style: TextStyle(fontWeight: FontWeight.w500),
            textScaleFactor: 1.6,
          ),
          Text(
            "983260039V",
            style: TextStyle(fontWeight: FontWeight.w500),
            textScaleFactor: 1.4,
          ),
        ],
      ),
    );
//    launch('sms:' + '${widget.phone}')
    final cardTitle = Container(
      margin: EdgeInsets.only(top: 20.0),
      child: Center(
        child: Text(
          "Cards Linked to Genie",
          style: TextStyle(fontWeight: FontWeight.w900),
          textScaleFactor: 1.0,
        ),
      ),
    );

    final card = new GestureDetector(
      onTap: (){
        launch("https://play.google.com/store/apps/details?id=lk.dialog.genie");
        print("Genie");
      },
      child: Container(
        child: Image(
          image: AssetImage("assets/card.png"),
          width: 400.0,
          height: 200.0,
        ),
      ),
    );

    final returnWrapper = new ListView(
      children: <Widget>[title, userImage,userInfo,cardTitle,card],
    );

    return Scaffold(
      body: SafeArea(
        child: returnWrapper,
      ),
    );
  }
}


class usersData {
  final String name;
  final String id;
  final String placeAddress;
  final String placeFee;
  final String place1Title;
  final String place1Payment;
  final String place2Title;
  final String place2Payment;
  final String upcomingTitle1;
  final String upcomingTitle2;
  final String owner;

  usersData(
      this.name,
      this.id,
      this.placeAddress,
      this.placeFee,
      this.place1Title,
      this.place1Payment,
      this.place2Title,
      this.place2Payment,
      this.upcomingTitle1,
      this.upcomingTitle2,
      this.owner,);
}