import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';
//import

class review extends StatefulWidget {
//  final String token;
//  const profile(this.token);

  @override
  State<StatefulWidget> createState() => new _reviewState();
}

class _reviewState extends State<review> {
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

    final back =  GestureDetector(
      onTap: (){
        Navigator.pop(context,false);
      },
      child: Container(
        margin: EdgeInsets.only(top: 20.0,left: 25.0),
        child: Text(
          "< Back",
          style: TextStyle(fontWeight: FontWeight.w900),
          textScaleFactor: 1.0,
        ),
      ),
    );

    final title = Container(
      alignment: Alignment.center,
      margin: EdgeInsets.only(bottom: 0.02 * vh, top: 20.0),
      child: Text(
        "Reviews",
        style: TextStyle(fontWeight: FontWeight.w900),
        textScaleFactor: 1.8,
      ),
    );

    final placeCard = Container(
      margin: EdgeInsets.all(20.0),
      padding: EdgeInsets.all(10.0),
      height: 155.0,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(15.0)),
          color: Color(0xFFE93B55)),
      child: ListView(
        children: <Widget>[
          Text(
            "#1001",
            style: TextStyle(fontWeight: FontWeight.w900, color: Colors.white),
            textScaleFactor: 1.0,
          ),
          Center(
            child: Icon(
              Icons.verified_user,
              color: Colors.white,
              size: 40.0,
            ),
          ),
          Center(
            child: Text(
              "Sidhdhartha Mawatha, Colombo 05",
              style:
                  TextStyle(fontWeight: FontWeight.w300, color: Colors.white),
              textScaleFactor: 1.0,
            ),
          ),
          Center(
            child: Text(
              "Monthly Fee: LKR 8000.00",
              style:
                  TextStyle(fontWeight: FontWeight.w300, color: Colors.white),
              textScaleFactor: 1.4,
            ),
          ),
          Row(
            children: <Widget>[
              SizedBox(height: 40.0),
              Icon(
                Icons.account_circle,
                color: Colors.white,
              ),
              SizedBox(width: 5.0),
              Text(
                "Daddy Cool",
                style:
                    TextStyle(fontWeight: FontWeight.w900, color: Colors.white),
                textScaleFactor: 0.9,
              ),
            ],
          )
        ],
      ),
    );

    final reviewCard = Container(
      margin: EdgeInsets.only(left: 20.0, right: 20.0, bottom: 20.0),
      child: Column(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(15.0),
                  topLeft: Radius.circular(15.0)),
              color: Color(0xFFE93B55),
            ),
            height: 30.0,
            padding: EdgeInsets.all(5.0),
            child: Row(
              children: <Widget>[
                Icon(
                  Icons.account_circle,
                  color: Colors.white,
                  size: 20.0,
                ),
                SizedBox(
                  width: 10.0,
                ),
                Text("Dinendra Bandara",
                    style: TextStyle(color: Colors.white), textScaleFactor: 0.9),
                SizedBox(width: 20.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Text("4.7",
                      style: TextStyle(fontWeight: FontWeight.w500,color: Colors.white),
                      textScaleFactor: 0.8,
                    ),
                    SizedBox(width: 5.0),
                    Icon(Icons.star, color: Colors.white,size: 12.0),
                  ],
                )
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top:10.0),
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Icon(Icons.star, color: Colors.amber,size: 20.0),
                  Icon(Icons.star,color: Colors.amber, size: 20.0),
                  Icon(Icons.star,color: Colors.amber, size: 20.0),
                  Icon(Icons.star_border,color: Colors.amber, size: 20.0),
                  Icon(Icons.star_border,color: Colors.amber, size: 20.0),
                ],
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top:10.0),
            child: Text(
                "Lockers were a bit small to fit everything in. Good party vibe but as everyone’s drinking all the time not many people do much during the day. I should have expected this, it being a party hostel but otherwise I had a good stay. The staff were all great in particular. Not sure I’d stay there again but I don’t regret the stay either. Maybe I’m just getting too old for party hostels.",
                style: TextStyle()),
          )
        ],
      ),
    );

    final reviewList = ListView(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      children: <Widget>[
        reviewCard, reviewCard
      ],
    );

    final returnWrapper = new ListView(
      children: <Widget>[back,title, placeCard, reviewList],
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
    this.owner,
  );
}
