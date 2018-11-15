import 'package:flutter/material.dart';

class BikeItem extends StatelessWidget {
  String firstLetter;
 MaterialColor circleColor;

  BikeItem(String letter, MaterialColor color) {
    this.firstLetter = letter;
    this.circleColor = color;
  }
  @override
  Widget build(BuildContext context) {
    return new Container(
      height: 80.0,
      padding: new EdgeInsets.only( left: 10.0, right: 5.0),
      child: new Row(
       children: <Widget>[
         
         new CircleAvatar(child: new Text(this.firstLetter), radius: 35.0, backgroundColor: this.circleColor,),
         
         new Expanded(
          child: new Column(
            
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new Text("Item tile", style: new TextStyle( fontSize: 20.0, fontWeight: FontWeight.bold),),
              new Text("Item detail", style: new TextStyle( fontSize: 15.0, fontStyle: FontStyle.italic),),
            ],
          ),
         ),
         new Icon(Icons.forward),
       ],
      ),
    );
  }
}