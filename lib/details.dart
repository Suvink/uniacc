import 'dart:async';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/material.dart';
import './myWidgets.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:permission_handler/permission_handler.dart';

class details extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new _detailsState();
}

class _detailsState extends State<details> {

  //Location Permissions
  PermissionStatus _status;
  @override
  void initState(){
    super.initState();
    PermissionHandler().checkPermissionStatus(PermissionGroup.locationWhenInUse)
    .then(_updateStatus);
    _askPermission();
  }



  //Google Maps controller
  Completer<GoogleMapController> _controller = Completer();


  @override
  Widget build(BuildContext context) {
    debugPrint('$_status');
    //Viewport
    final vh = MediaQuery.of(context).size.height;
    final vw = MediaQuery.of(context).size.width;

    final title = Center(
      child: Container(
        margin: EdgeInsets.only(top: 20.0),
        child: Text(
          "Latest Places",
          style: TextStyle(fontWeight: FontWeight.w900),
          textScaleFactor: 1.0,
        ),
      ),
    );


final map = Container(
  width: vw,
  height: 0.49*vh,
  child: GoogleMap(
    mapType: MapType.normal,
    initialCameraPosition: CameraPosition(
      target: LatLng(6.063945, 80.207602),
      zoom: 15
    ),
    mapToolbarEnabled: true,
    myLocationEnabled: true,
    myLocationButtonEnabled: true,
    onMapCreated: (GoogleMapController controller){
      _controller.complete(controller);
    },
    markers: {
      Marker(
          markerId: MarkerId('BoardingPlace'),
          position: LatLng( 6.063945, 80.207602),
          infoWindow: InfoWindow(title: "Boarding Place 1"),
          icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed)
      )
    },
  ),
);



final detailsCard = new Container(
  padding: EdgeInsets.all(10.0),
  alignment: Alignment.bottomCenter,
  decoration: BoxDecoration(
    borderRadius: BorderRadius.only(topLeft: Radius.circular(35.0), topRight: Radius.circular(35.0)),
    color: Colors.white
  ),
  height: 0.5*vh,
  child: Column(
    children: <Widget>[
      Container(color: Color(0xFFE93B55), height: 3, margin: EdgeInsets.only(top: 10, bottom: 10.0), width: 0.15*vw,),
      Row(
        children: <Widget>[
          SizedBox(height: 40.0),
          Icon(Icons.account_circle, color: Color(0xFFE93B55), size: 50.0,),
          SizedBox(width: 5.0),
          Text("Dinendra Bandara",style: TextStyle(fontWeight: FontWeight.w900,color: Colors.black),textScaleFactor: 1.2,),
          SizedBox(width: 0.10*vw,),
          IconButton(icon: Icon(Icons.sms, color: Color(0xFFE93B55), size: 30.0,),onPressed:() => launch('sms:+94771655198')),
          SizedBox(width: 10),
          IconButton(icon: Icon(Icons.call, color: Color(0xFFE93B55), size: 30.0,), onPressed: ()=> launch('tel:+94771655198'),)
        ],
      ),
      Container(color: Color(0xFFA2A0A0), height: 2, margin: EdgeInsets.only(top: 10, bottom: 10.0), width: 0.9*vw,),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Icon(Icons.person_pin_circle, color:Color(0xFFE93B55),),
          Text("Sidhdhartha Mawatha, Colombo 05",style: TextStyle(fontWeight: FontWeight.w400,color:Colors.black),textScaleFactor: 0.9,),
        ],
      ),
      SizedBox(height: 10.0),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Column(
            children: <Widget>[
              Text("Rooms",style: TextStyle(fontWeight: FontWeight.w400,color:Color(0xFFA2A0A0)),textScaleFactor: 1.0,),
              SizedBox(height: 5.0,),
              Text("2",style: TextStyle(fontWeight: FontWeight.w400,color:Colors.black),textScaleFactor:1.5 ,),
            ],
          ),
          SizedBox(width: 20.0,),
          Column(
            children: <Widget>[
              Text("Beds",style: TextStyle(fontWeight: FontWeight.w400,color:Color(0xFFA2A0A0)),textScaleFactor: 1.0,),
              SizedBox(height: 5.0,),
              Text("2",style: TextStyle(fontWeight: FontWeight.w400,color:Colors.black),textScaleFactor:1.5 ,),
            ],
          ),
          SizedBox(width: 20.0,),
          Column(
            children: <Widget>[
              Text("People",style: TextStyle(fontWeight: FontWeight.w400,color:Color(0xFFA2A0A0)),textScaleFactor: 1.0,),
              SizedBox(height: 5.0,),
              Text("2",style: TextStyle(fontWeight: FontWeight.w400,color:Colors.black),textScaleFactor:1.5 ,),
            ],
          )
        ],
      ),
      SizedBox(height: 10.0),
      Column(
        //mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text("Utility Bills : Seperate Bills",style: TextStyle(fontWeight: FontWeight.w400,color:Colors.black),textScaleFactor: 1.2),
          SizedBox(height: 3.0,),
          Text("Key Money: 3 months",style: TextStyle(fontWeight: FontWeight.w400,color:Colors.black),textScaleFactor: 1.2),
          SizedBox(height: 3.0,),
          Text("Payment Method: Cash Only",style: TextStyle(fontWeight: FontWeight.w400,color:Colors.black),textScaleFactor: 1.2),
          SizedBox(height: 3.0,),
          Text("Meals: Not Included",style: TextStyle(fontWeight: FontWeight.w400,color:Colors.black),textScaleFactor: 1.2)
        ],
      )

    ],
  ),
);

    return new Scaffold(
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            Positioned(child: map),
            Positioned(child: title, top: 20.0, left: 0, right: 0,),
            Positioned(child: Align(child: detailsCard, alignment: Alignment.bottomCenter)),
          ],
        ),
      ),
    );
  }


  //User Permission for Google Maps location

  void _updateStatus(PermissionStatus status){
    if(status!= _status){
      setState(() {
        _status = status;
      });
    }
  }
  void _askPermission(){
    PermissionHandler().requestPermissions([PermissionGroup.locationWhenInUse])
        .then(_onStatusRequested);
  }
  void _onStatusRequested(Map<PermissionGroup, PermissionStatus> statuses) {
    final status = statuses[PermissionGroup.locationWhenInUse];
    _updateStatus(status);
  }
}




