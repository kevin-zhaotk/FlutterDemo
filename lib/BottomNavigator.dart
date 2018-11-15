import 'package:flutter/material.dart';

class BottomNavigator extends StatefulWidget {

  @override
    State<StatefulWidget> createState() {
      // TODO: implement createState
      return new _BottomNavigatorState();
    }
}

class _BottomNavigatorState extends State<BottomNavigator> {

int _currentIndex = 0;

final List<Widget> _children = [
  new Image.network("https://ss0.bdstatic.com/70cFuHSh_Q1YnxGkpoWK1HF6hhy/it/u=617379864,3215122714&fm=27&gp=0.jpg"),
  new Image.network("https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1536151544538&di=61e89120c019d2456ab20d966a8159e5&imgtype=0&src=http%3A%2F%2Fimg.kt11.net%2Fupload%2Fpicture%2F2015%2F06%2F81W7fK.jpg"),
  new Image.network("https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1536151544537&di=0157870f7e9685f4749432cd7b4d2065&imgtype=0&src=http%3A%2F%2Fp4.qhimg.com%2Ft013b72f850cf725bf4.jpg"),
];

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
       
      body: _children[_currentIndex],
      bottomNavigationBar: new BottomNavigationBar(
        currentIndex: _currentIndex,
        
        onTap: onTap,
        items: [
          new BottomNavigationBarItem(
            icon: new Icon(Icons.directions_bike),
            title: new Text("Bick"),
          ),
          new BottomNavigationBarItem(
            icon: new Icon(Icons.directions_bus),
            title: new Text("Bus"),
          ),
          new BottomNavigationBarItem(
            icon: new Icon(Icons.directions_subway),
            title: new Text("Subway"),
          ),
        ],
      ),
    );
  }

  void onTap(int index) {
    setState(() {
          _currentIndex = index;
        });
  }
}