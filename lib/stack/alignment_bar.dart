import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class AlignmentSelectBar extends StatefulWidget {

  final ValueChanged<Alignment> onStateChanged;
  final ValueChanged<int> onStack;
  // final VoidCallback onStateChanged;
  AlignmentSelectBar({Key key, @required this.onStateChanged, this.onStack}) : super(key:key);
  createState() => new _AlignmentSelectBarState();
}


class _AlignmentSelectBarState extends State<AlignmentSelectBar> {
  
  final alignItems = [
    Alignment.topLeft, Alignment.topCenter, Alignment.topRight,
    Alignment.centerLeft, Alignment.center, Alignment.centerRight,
    Alignment.bottomLeft, Alignment.bottomCenter, Alignment.bottomRight,
  ];

  final alignNames = [
                      "topLeft", "topCenter", "topRight",
                      "centerLeft", "center", "centerRight",
                      "bottomLeft", "bottomCenter", "bottomRight",
                      ];

  final stackTypePool = ["Normal", "Positioned"];
  var stackType = 0;
  var curAlignment = 0;

  @override
  Widget build(BuildContext context) {
    return new Row(
      children: <Widget>[
        // Stack type Selector Bar
        Expanded(
          child: new Column(
        
          children: <Widget>[
            new Text("Type", style: TextStyle( fontSize: 16.0, ),),
            new Row(
              children: <Widget>[
                // new FlatButton.icon( icon: new Icon(Icons.arrow_back, size: 16.0,), onPressed: _onTypePrevious, label: ,),
                new IconButton( icon: new Icon(Icons.arrow_back, size: 16.0,), onPressed: _onTypePrevious, alignment: Alignment.centerLeft,), 
                new Text(stackTypePool[stackType], style: TextStyle( fontSize: 16.0), overflow: TextOverflow.ellipsis,),
                new IconButton( icon: new Icon(Icons.arrow_forward), onPressed: _onTypeNext, iconSize: 16.0, alignment: Alignment.centerRight,)
              ],
             mainAxisAlignment: MainAxisAlignment.spaceBetween,
             crossAxisAlignment: CrossAxisAlignment.center,
            )
            
          ],
          mainAxisAlignment: MainAxisAlignment.center,
        ),
        
        ),
        // Alignment Selection
        Expanded(
          child: new Column(
         children: <Widget>[
           new Text("Alignment"),
           new Row(
              children: <Widget>[
                new IconButton( icon: new Icon(Icons.arrow_back), onPressed: _onPrevious, iconSize: 16.0, padding: EdgeInsets.all(0.0), alignment: Alignment.centerLeft,),
                Expanded( child: new Text(alignNames[curAlignment], style: TextStyle( fontSize: 16.0), overflow: TextOverflow.ellipsis,)), 
                new IconButton( icon: new Icon(Icons.arrow_forward), onPressed: _onNext, iconSize: 16.0, padding: EdgeInsets.all(0.0), alignment: Alignment.centerRight,),
              ],
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
           )
         ],
         mainAxisAlignment: MainAxisAlignment.spaceBetween,
        ),
        
        )
        
      ],
       mainAxisAlignment: MainAxisAlignment.spaceBetween,
    );
  }

  void _onPrevious() {
    setState(() {
          curAlignment--;
          if (curAlignment < 0) {
            curAlignment = alignNames.length - 1;
          }
          //widget.onStateChanged(alignItems[curAlignment]);
          // print('-->onPrevious');
        });
        widget.onStateChanged(alignItems[curAlignment]);

  }

  void _onNext() {
    setState(() {
          curAlignment++;
          if (curAlignment >= alignNames.length) {
            curAlignment = 0;
          }
        });

        widget.onStateChanged(alignItems[curAlignment]);
  }

  void _onTypePrevious() {
    setState(() {
          if (stackType > 0) {
            stackType--;
            widget.onStack(stackType);
          }
          
        });
  }

  void _onTypeNext() {
    setState(() {
          if (stackType < stackTypePool.length - 1) {
            stackType++;
            widget.onStack(stackType);
          }
        });
  }


  Alignment getAlignment() {
    return alignItems[curAlignment];
  }
}
