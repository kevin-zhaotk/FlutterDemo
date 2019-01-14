import 'package:flutter/material.dart';

class CustomAnimatedList extends StatefulWidget {
   @override
     State<StatefulWidget> createState() {
       return _State();
     }
}

class _State extends State<CustomAnimatedList> {

  final GlobalKey<AnimatedListState> _listKey = GlobalKey();
  List<int> _elements = [0,1,2]; 

  @override
  void initState() {
    super.initState();

  }
  @override
    Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          title: Text('CustomAnimatedList'),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.add_circle_outline),
              onPressed: _addItem,
            ),
            IconButton(
              icon: Icon(Icons.remove_circle_outline),
              onPressed: _removeItem,
            )
          ],
        ),
        body: SafeArea(
          child: AnimatedList(
            key: _listKey,
            itemBuilder: (BuildContext context, int index, Animation<double> animation) {
              return SizeTransition(
                sizeFactor: animation,
                child: _buildItem(index),
              );
            },
            initialItemCount: _elements.length,
          ),
        ),
      );
    }


  Widget _buildItem(int index) {
    // print('_buildItem:${animation.value}');
    return Container(
      color: Colors.pink,
      height: 100,
      margin: EdgeInsets.fromLTRB(20, 20, 20, 20),
     
        child: Center(
          child:new Text('Item $index'),
        ),
      );
  }

  _addItem() {
    _listKey.currentState.insertItem(_elements.length, duration: Duration(milliseconds: 500));
  }

  _removeItem() {
    print('remove item: ${_elements.length - 1}');
    _listKey.currentState.removeItem(_elements.length, _removeItemBuilder, duration: Duration(milliseconds: 500));
  }

  Widget _removeItemBuilder(BuildContext context, Animation<double> animation) {
    return SizeTransition(
      sizeFactor: animation,
      child: _buildItem(_elements.length),

    );
  }
}