import 'package:flutter/material.dart';
import './myWidgets.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'details.dart';
import 'package:loading/loading.dart';
import 'package:loading/indicator/line_scale_pulse_out_indicator.dart';

class newDashboard extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new _newDashboardState();
}

class _newDashboardState extends State<newDashboard> {
  @override
  void initState() {
    super.initState();
  }

  Future<List<placesData>> _getJson() async {
    var data = await http.get("http://35.247.185.195/api/api.json");
    var jsonData = json.decode(data.body);
    //debugPrint(jsonData);

    List<placesData> places = [];

    for (var i in jsonData) {
      placesData place = placesData(
          i["address"],
          i["beds"],
          i["id"],
          i["keymoney"],
          i["latlng"],
          i["map"],
          i["maxpeople"],
          i["meals"],
          i["name"],
          i["payment"],
          i["phone"],
          i["price"],
          i["rooms"],
          i["tag"],
          i["utility"],
          i["rating"],
          i["no_of_reviews"],
          i["reviews"]);
      places.add(place);
    }
    print(places.length);

    return places;
  }

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

//    final results = new ListView(
//      shrinkWrap: true,
//      children: <Widget>[
//        //ID, Address, Price, Name
//        boardingCard("#1001", "Sidhdhartha Mawatha, Colombo 05",
//            "Monthly Fee: LKR 8000.00", "Dinendra Bandara"),
//        boardingCard("#1002", "Reid Avenue, Colombo 07",
//            "Monthly Fee: LKR 6000.00", "Manul Madara"),
//        boardingCard("#1003", "Pannipitiya, Kottawa",
//            "Monthly Fee: LKR 5000.00", "Chenuka Madawela"),
//      ],
//    );

    final jsonResults = new FutureBuilder(
        future: _getJson(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.data == null) {

            return Container(
                margin: EdgeInsets.only(top: 40.0),
                child: Container(
                  foregroundDecoration: new BoxDecoration(
                      //color: Color(0xFFE93B55)
                      ),
                  //color: Color(0xFFE93B55),
                  child: Center(
                    child: Loading(
                        indicator: LineScalePulseOutIndicator(), size: 50.0),
                  ),
                ));
          } else {
            return ListView.builder(
                shrinkWrap: true,
                itemCount: snapshot.data.length,
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          new MaterialPageRoute(
                              builder: (context) => details(
                                    address: snapshot.data[index]._address,
                                    beds: snapshot.data[index]._beds,
                                    id: snapshot.data[index]._id,
                                    keymoney: snapshot.data[index]._keymoney,
                                    latlng: snapshot.data[index]._latlng,
                                    map: snapshot.data[index]._map,
                                    maxpeople: snapshot.data[index]._maxpeople,
                                    meals: snapshot.data[index]._meals,
                                    name: snapshot.data[index]._name,
                                    payment: snapshot.data[index]._payment,
                                    phone: snapshot.data[index]._phone,
                                    price: snapshot.data[index]._price,
                                    rooms: snapshot.data[index]._rooms,
                                    tag: snapshot.data[index]._tag,
                                    utility: snapshot.data[index]._utility,
                                  )));
                    },
                    child: boardingCard(
                      "#" + snapshot.data[index]._id,
                      snapshot.data[index]._address,
                      "Monthly Fee: LKR" + snapshot.data[index]._price,
                      snapshot.data[index]._name,
                      snapshot.data[index]._rating
                    ),
                  );
                });
          }
        });

    return new Scaffold(
      body: SafeArea(
        child: Container(
            margin: EdgeInsets.only(left: 18.0, right: 18.0),
            child: ListView(
              children: <Widget>[
                welcome,
                mapImage,
                search,
                latest,
                jsonResults
              ],
            )),
      ),
    );
  }
}

class placesData {
  final String _address;
  final String _beds;
  final String _id;
  final String _keymoney;
  final String _latlng;
  final String _map;
  final String _maxpeople;
  final String _meals;
  final String _name;
  final String _payment;
  final String _phone;
  final String _price;
  final String _rooms;
  final String _tag;
  final String _utility;
  final String _rating;
  final String _noOfReviews;
  final String _reviewList;

  placesData(
      this._address,
      this._beds,
      this._id,
      this._keymoney,
      this._latlng,
      this._map,
      this._maxpeople,
      this._meals,
      this._name,
      this._payment,
      this._phone,
      this._price,
      this._rooms,
      this._tag,
      this._utility,
      this._rating,
      this._noOfReviews,
      this._reviewList);
}
