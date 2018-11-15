import 'package:flutter/material.dart';


class ScrollBar extends StatefulWidget {
  
  // items of this scrollbar
  List<String> items;

  ScrollBar({this.items});

  @override
    State<StatefulWidget> createState() {
      // TODO: implement createState
      return new _State();
    }
}
 class _State extends State<ScrollBar> {
   
  int curItem = 0;

   @override
   Widget build(BuildContext context) {
     print('items.length: ${widget.items.length}');
     //return new Text('data');
     return new DefaultTabController(
       length: widget.items.length,
       child: new TabBar(
          isScrollable: true,
          tabs: widget.items.map((item) {
            return new Tab( text: item,);
          }).toList(),
        ),
        
     );
   }

   
 }