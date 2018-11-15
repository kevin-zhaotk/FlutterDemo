import 'package:flutter/material.dart';

class HomeTab extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return new DefaultTabController(
      length: 3,
      child: new Scaffold(
        
        appBar: new AppBar(
         bottom: new TabBar(
           tabs: [
             new Tab(icon: new Icon(Icons.directions_bike)),
             new Tab(text: "Boat"),
             new Tab(text: "Bus"),
           ],
           
         ),
         
        ),
        body: new TabBarView(
          children:[
            new Text("bike Tab"),
            new Text("Boat Tab"),
            new Text("Bus Tab"),
          ],
          ),
      ),
      );
  }
}
