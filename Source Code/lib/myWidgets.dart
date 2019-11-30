import 'package:flutter/material.dart';

//Boarding Cards
class boardingCard extends StatelessWidget {
  final String id;
  final String address;
  final String price;
  final String name;
  final String rating;

  const boardingCard(this.id, this.address, this.price, this.name, this.rating);

  @override
  Widget build(BuildContext context) {
    return new Container(
      margin: EdgeInsets.only(top: 20.0),
      padding: EdgeInsets.all(10.0),
      height: 170.0,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(15.0)),
          color: Color(0xFFE93B55)),
      child: ListView(
        children: <Widget>[
          Text(
            id,
            style: TextStyle(fontWeight: FontWeight.w900, color: Colors.white),
            textScaleFactor: 1.0,
          ),
          Center(
            child: Icon(
              Icons.hotel,
              color: Colors.white,
              size: 40.0,
            ),
          ),
          Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Icon(Icons.star, color: Colors.white,size: 15.0),
                Icon(Icons.star,color: Colors.white, size: 15.0),
                Icon(Icons.star,color: Colors.white, size: 15.0),
                Icon(Icons.star_border,color: Colors.white, size: 15.0),
                Icon(Icons.star_border,color: Colors.white, size: 15.0),
              ],
            ),
          ),
          Center(
            child: Text(
              address,
              style:
                  TextStyle(fontWeight: FontWeight.w300, color: Colors.white),
              textScaleFactor: 1.0,
            ),
          ),
          Center(
            child: Text(
              price,
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
                name,
                style:
                    TextStyle(fontWeight: FontWeight.w900, color: Colors.white),
                textScaleFactor: 0.9,
              ),
            ],
          )
        ],
      ),
    );
  }
}




//Boarding Cards
class reviewCard extends StatelessWidget {
  final String name;
  final String review;
  final String rating;

  const reviewCard(this.name, this.review, this.rating);

  @override
  Widget build(BuildContext context) {
    return new Container(
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
                Text(name,
                    style: TextStyle(color: Colors.white), textScaleFactor: 0.9)
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
                review,
                style: TextStyle()),
          )
        ],
      ),
    );
  }
}