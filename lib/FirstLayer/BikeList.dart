import 'package:flutter/material.dart';

import 'BikeItem.dart';


class BikeList extends StatefulWidget {
  @override
  createState() => new BikeListState();
}

class BikeListState extends State<BikeList> {

 List<String> listItems = ['A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N'];
 List<MaterialColor> colors = [Colors.red, Colors.blue, Colors.yellow, Colors.green];
 @override
 Widget build(BuildContext context) {
    return new ListView.builder(
      itemBuilder: (BuildContext context, int index) => new BikeItem(this.listItems[index], colors[index%colors.length]),
      itemCount: listItems.length,
      padding: new EdgeInsets.only(top: 40.0),
      
    );
 }
}