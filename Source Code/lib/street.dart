import 'dart:async';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:permission_handler/permission_handler.dart';
import 'myPlaces.dart';

class street extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new _streetState();
}

class _streetState extends State<street> {
  //Location Permissions
  PermissionStatus _status;
  @override
  void initState() {
    super.initState();
    PermissionHandler()
        .checkPermissionStatus(PermissionGroup.locationWhenInUse)
        .then(_updateStatus);
    _askPermission();
  }

  //StreetView controller
  final Completer<WebViewController> _webController =
      Completer<WebViewController>();

  @override
  Widget build(BuildContext context) {
    debugPrint('$_status');
    //Viewport
    final vh = MediaQuery.of(context).size.height;
    final vw = MediaQuery.of(context).size.width;

    final title = GestureDetector(
      onTap: () {
        Navigator.pop(context, false);
      },
      child: Container(
        margin: EdgeInsets.only(top: 20.0),
        child: Text(
          "< Back",
          style: TextStyle(fontWeight: FontWeight.w900),
          textScaleFactor: 1.0,
        ),
      ),
    );

    return new Scaffold(
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            WebView(
              initialUrl: "http://35.247.185.195/street-view/",
              javascriptMode: JavascriptMode.unrestricted,
//                              onWebViewCreated: (WebViewController webViewController){
//                                  _webController.complete(webViewController);
//                              },
            ),
            Positioned(
              child: title,
              top: 20.0,
              left: 10.0,
              right: 0,
            ),
          ],
        ),
      ),
    );
  }

  //User Permission for Google Maps location

  void _updateStatus(PermissionStatus status) {
    if (status != _status) {
      setState(() {
        _status = status;
      });
    }
  }

  void _askPermission() {
    PermissionHandler().requestPermissions(
        [PermissionGroup.locationWhenInUse]).then(_onStatusRequested);
  }

  void _onStatusRequested(Map<PermissionGroup, PermissionStatus> statuses) {
    final status = statuses[PermissionGroup.locationWhenInUse];
    _updateStatus(status);
  }
}
