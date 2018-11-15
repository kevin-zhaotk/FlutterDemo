import 'package:flutter/material.dart';

class StackPage extends StatelessWidget {
  
  final Alignment alignment;

  StackPage({this.alignment: Alignment.center}) ;

  @override
  Widget build(BuildContext context) {
      return Stack(
        children: <Widget>[
          new Container( color: Colors.blue, width: 300.0, height: 300.0,),
          new Container( color: Colors.red, width: 200.0, height: 200.0,),
          new Container( color: Colors.green, width: 100.0, height: 100.0,),
        ],
        alignment: alignment,
      );
    }

}