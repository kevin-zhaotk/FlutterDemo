import 'package:flutter/material.dart';

class StackPositioned extends StatelessWidget {
   
   @override
   Widget build(BuildContext context) {
     return new Stack(
        children: <Widget>[
          new SizedBox( width: 300.0, height: 300.0, child: new Container( color: Colors.yellow,),),
          new Positioned( left: 20.0, top: 20.0, width: 100.0, height: 100.0, child: new Container( color: Colors.indigo,),),
          new Positioned( left: 150.0, top: 30.0, width: 100.0, height: 100.0, child: new Container( color: Colors.red,),),
          new Positioned( left: 30.0, top: 200.0, width: 100.0, height: 100.0, child: new Container( color: Colors.blueGrey,),),
          new Positioned( left: 150.0, top: 150.0, width: 100.0, height: 100.0, child: new Container( color: Colors.greenAccent,),),
        ],
     );
   }
}