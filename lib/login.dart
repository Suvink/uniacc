import 'package:flutter/material.dart';
import 'package:uniacc/dashboard.dart';
import 'package:uniacc/newDash.dart';
import 'package:url_launcher/url_launcher.dart';
import 'home.dart';



class login extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new _loginState();
}

class _loginState extends State<login> {
  @override
  void initState() {
    super.initState();
  }

  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    usernameController.dispose();
    passwordController.dispose();
    super.dispose();
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
        "Welcome to UniAcc",
        style: TextStyle(fontWeight: FontWeight.w900),
        textScaleFactor: 1.8,
      ),
    );

    final mapImage = new Container(
      margin: EdgeInsets.only(top: 60.0),
      child: Center(
        child: Image(
          image: AssetImage("assets/map.png"),
          width: 174.0,
          height: 174.0,
        ),
      ),
    );

    final loginBlock = Container(
      margin: EdgeInsets.only(left: 20.0, right: 20.0),
      child: Column(
        children: <Widget>[
          Container(
              child: TextField(
                controller: usernameController,
                decoration: InputDecoration(
                  //focusedBorder: Bor,
                  hintText: 'Username',
                  suffixIcon: IconButton(
                      icon: Icon(Icons.supervised_user_circle),
                      onPressed: () {
                        debugPrint('Username');
                      }),
                ),
              )),
          Container(
              child: TextField(
                obscureText: true,
                controller:passwordController,
                decoration: InputDecoration(
                  //focusedBorder: Bor,
                  hintText: 'Password',
                  suffixIcon: IconButton(
                      icon: Icon(Icons.keyboard_hide),
                      onPressed: () {
                        debugPrint('Password');
                      }),
                ),
              ))
        ],
      ),
    );

    final loginBtn = Container(
        margin: EdgeInsets.only(left: 20.0, right: 20.0, top: 20.0),
      child: RaisedButton(
        color: Color(0xFFE93B55),
        onPressed: () {
          print(usernameController.text);
          print(passwordController.text);
          var username = usernameController.toString();
          var password = passwordController.toString();
          if(username == "dilhani" && password == "dee"){
            Navigator.push(context, new MaterialPageRoute(builder: (context) => newDashboard()));
            print("done");
//          }else if(usernameController.toString() == "dilhani" && passwordController.toString() == "dee"){
//            Navigator.push(context, new MaterialPageRoute(builder: (context) => home()));
          }else {
            Navigator.push(context, new MaterialPageRoute(builder: (context) => home()));
          }
        },
        child: const Text(
            'Login',
            style: TextStyle(fontWeight: FontWeight.w900,color: Colors.white)
        ),
    ));


    final returnWrapper = new ListView(
      children: <Widget>[
        mapImage,
        title,
        loginBlock,
        loginBtn
      ],
    );

    return Scaffold(
      body: SafeArea(
        child: returnWrapper,
      ),
    );
  }
}
