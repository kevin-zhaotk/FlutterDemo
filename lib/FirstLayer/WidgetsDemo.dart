import 'package:flutter/material.dart';
import 'package:dictionary/style/KZTextStyle.dart';
import 'package:dictionary/stack/stack_page.dart';

class WidgetsDemo extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return new Column(
      children: <Widget>[
        new Row(
         
          children: <Widget>[
            new Text("First", textAlign: TextAlign.center , style: KZTextStyle.SecondBarStyle),
            new Text("Second", textAlign: TextAlign.center , style: KZTextStyle.SecondBarStyle),
            
          ],
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
        ),
        new Container(
              height: 200.0,
              decoration: new BoxDecoration( 
                image: new DecorationImage( 
                  image: new NetworkImage("https://cdn.pixabay.com/photo/2018/10/22/11/58/grass-3765172__480.jpg"),
                  fit: BoxFit.fill,
                  ), 
                // borderRadius: BorderRadius.only( bottomLeft: Radius.circular(200.0), bottomRight: Radius.circular(200.0)),
              ),

              // color: Colors.black45,
              padding: EdgeInsets.all(100.0),
              alignment: Alignment.center,
              child: new Text("Hello World", textScaleFactor: 2.0,),
            ),
        Expanded ( 
         child: new StackPage()
         )

      ],
      
    );
  }
}