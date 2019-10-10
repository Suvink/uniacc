import 'package:flutter/material.dart';
import 'package:timeline/model/timeline_model.dart';
import 'package:timeline/timeline.dart';
import 'package:url_launcher/url_launcher.dart';

class myPlaces extends StatefulWidget {

//  final String token;
//  const myPlaces(this.token);

  @override
  State<StatefulWidget> createState() => new _myPlacesState();
}

class _myPlacesState extends State<myPlaces> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    //Viewport
    final vh = MediaQuery.of(context).size.height;
    final vw = MediaQuery.of(context).size.width;


    final backBtn =  GestureDetector(
      onTap: (){
        Navigator.pop(context,false);
      },
      child: Container(
        alignment: Alignment.topLeft,
        margin: EdgeInsets.only(top: 5.0,left: 10.0),
        child: Text(
          "< Back",
          style: TextStyle(fontWeight: FontWeight.w900),
          textScaleFactor: 1.0,
        ),
      ),
    );

    final title = Container(
      alignment: Alignment.center,
      margin: EdgeInsets.only(bottom: 0.017 * vh, top: 5.0),
      child: Text(
        "My Places",
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

    final actTitle = Container(
      margin: EdgeInsets.only(top: 20.0, left: 20.0),
      child: Text(
        "Recent Activity",
        style: TextStyle(fontWeight: FontWeight.w900),
        textScaleFactor: 1.0,
      ),
    );

    final List<TimelineModel> list = [
      TimelineModel(
          id: "1",
          description: "Paid 8000LKR via Cash",
          title: "Monthly Fee Payment"),
      TimelineModel(
          id: "2",
          description: "Paid 500LKR with Genie",
          title: "Utility Bill Payment"),
    ];

    final activityFeed = Container(
      margin: EdgeInsets.only(top: 20.0),
      child: SizedBox(
        height: vh * 0.2,
        child: TimelineComponent(
          timelineList: list,
          backgroundColor: Colors.transparent,
          lineColor: Color(0xFFE93B55),
        ),
      ),
    );

    final upcomingTitle = Container(
      margin: EdgeInsets.only(top: 20.0, bottom: 20.0),
      child: Text(
        "Upcoming Payments",
        style: TextStyle(fontWeight: FontWeight.w900),
        textScaleFactor: 1.0,
      ),
    );

    final upcomingPayments = ListView(
      shrinkWrap: true,
      padding: EdgeInsets.only(left: 10.0, right: 10.0),
      children: <Widget>[
        Container(
          padding: EdgeInsets.only(left: 20.0),
          decoration: BoxDecoration(
            color: Color(0xFFF6BF5B),
            borderRadius: BorderRadius.all(Radius.circular(10.0))
          ),
          child: GestureDetector(
            onTap: (){
              launch("https://play.google.com/store/apps/details?id=lk.dialog.genie");
            },
            child: Row(
              children: <Widget>[
                Text(
                  "Monthly Fee for November",
                  style:
                  TextStyle(fontWeight: FontWeight.w300, color: Colors.black),
                  textScaleFactor: 1.0,
                ),
                SizedBox(width: 20.0,),
                Image(
                  image: AssetImage("assets/genie.png"),
                  width: 50.0,
                  height: 50.0,
                )
              ],
            ),
          ),
        )
      ],
    );

    final returnWrapper = new Column(
      //shrinkWrap: true,
      children: <Widget>[
        backBtn,
        title,
        placeCard,
        actTitle,
        activityFeed,
        upcomingTitle,
        upcomingPayments
      ],
    );

    return Scaffold(
      body: SafeArea(
        child: returnWrapper,
      ),
    );
  }
}
