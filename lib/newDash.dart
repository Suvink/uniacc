import 'package:flutter/material.dart';
import './myWidgets.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'details.dart';
import 'package:loading/loading.dart';
import 'package:loading/indicator/line_scale_pulse_out_indicator.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:flutter_range_slider/flutter_range_slider.dart' as frs;

class newDashboard extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new _newDashboardState();
}

class _newDashboardState extends State<newDashboard> {
  double _lowerValue = 20.0;
  double _upperValue = 80.0;
  double _lowerValueFormatter = 20.0;
  double _upperValueFormatter = 20.0;

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

  //CheckBoxes
  bool _isChecked = false;
  void onChanged(bool value) {
    setState(() {
      _isChecked = value;
    });
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

    final search = Row(
      children: <Widget>[
        Container(
            width: 0.766 * vw,
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
            )),
        IconButton(
            icon: Icon(Icons.tune),
            color: Colors.grey,
            onPressed: () {
              Alert(
                  context: context,
                  title: "Filters",
                  content: Column(
                    children: <Widget>[
                      SizedBox(height: 20.0),
                      Text(
                        "Price Range",
                        style: TextStyle(color: Color(0xFFE93B55)),
                        textScaleFactor: 0.7,
                      ),
                      Row(
                        children: <Widget>[
                          Text(
                            "3000",
                            textScaleFactor: 0.5,
                          ),
                          frs.RangeSlider(
                            min: 0.0,
                            max: 100.0,
                            lowerValue: _lowerValue,
                            upperValue: _upperValue,
                            divisions: 5,
                            showValueIndicator: true,
                            valueIndicatorMaxDecimals: 1,
                            onChanged:
                                (double newLowerValue, double newUpperValue) {
                              setState(() {
                                _lowerValue = newLowerValue;
                                _upperValue = newUpperValue;
                              });
                            },
                            onChangeStart: (double startLowerValue,
                                double startUpperValue) {
                              print(
                                  'Started with values: $startLowerValue and $startUpperValue');
                            },
                            onChangeEnd:
                                (double newLowerValue, double newUpperValue) {
                              print(
                                  'Ended with values: $newLowerValue and $newUpperValue');
                            },
                          ),
                          Text("100000", textScaleFactor: 0.5),
                        ],
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Text(
                        "Rating",
                        style: TextStyle(color: Color(0xFFE93B55)),
                        textScaleFactor: 0.7,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              Text(
                                "1",
                                textScaleFactor: 0.7,
                              ),
                              Icon(Icons.star, color: Colors.amber, size: 15.0),
                            ],
                          ),
                          frs.RangeSlider(
                            min: 0.0,
                            max: 100.0,
                            lowerValue: _lowerValue,
                            upperValue: _upperValue,
                            divisions: 5,
                            showValueIndicator: true,
                            valueIndicatorMaxDecimals: 1,
                            onChanged:
                                (double newLowerValue, double newUpperValue) {
                              setState(() {
                                _lowerValue = newLowerValue;
                                _upperValue = newUpperValue;
                              });
                            },
                            onChangeStart: (double startLowerValue,
                                double startUpperValue) {
                              print(
                                  'Started with values: $startLowerValue and $startUpperValue');
                            },
                            onChangeEnd:
                                (double newLowerValue, double newUpperValue) {
                              print(
                                  'Ended with values: $newLowerValue and $newUpperValue');
                            },
                          ),
                          Row(
                            children: <Widget>[
                              Text(
                                "5",
                                textScaleFactor: 0.7,
                              ),
                              Icon(Icons.star, color: Colors.amber, size: 15.0),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Text(
                        "Room Preference",
                        style: TextStyle(color: Color(0xFFE93B55)),
                        textScaleFactor: 0.7,
                      ),
                      Row(
                        children: <Widget>[
                          Checkbox(
                            value: _isChecked,
                            onChanged: (bool value) {
                              onChanged(value);
                            },
                          ),
                          Text(
                            "Shared Room",
                            textScaleFactor: 0.6,
                          ),
                          Checkbox(
                            value: true,
                            onChanged: (bool value) {
                              onChanged(value);
                            },
                          ),
                          Text(
                            "Full Room",
                            textScaleFactor: 0.6,
                          ),
                        ],
                      )
                    ],
                  ),
                  buttons: [
                    DialogButton(
                      onPressed: () => Navigator.pop(context),
                      child: Text(
                        "Apply",
                        style: TextStyle(color: Colors.white, fontSize: 15),
                      ),
                      width: 100.0,
                      color: Color(0xFFE93B55),
                    )
                  ]).show();
            })
      ],
    );

    final latest = Container(
      margin: EdgeInsets.only(top: 20.0),
      child: Text(
        "Latest Places",
        style: TextStyle(fontWeight: FontWeight.w900),
        textScaleFactor: 1.0,
      ),
    );

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
                physics: const NeverScrollableScrollPhysics(),
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
                                    noOfReviews:
                                        snapshot.data[index]._noOfReviews,
                                  )));
                    },
                    child: boardingCard(
                        "#" + snapshot.data[index]._id,
                        snapshot.data[index]._address,
                        "Monthly Fee: LKR" + snapshot.data[index]._price,
                        snapshot.data[index]._name,
                        snapshot.data[index]._rating),
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
