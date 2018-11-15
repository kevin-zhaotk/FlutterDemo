import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';


class CupertinoNavigator extends StatefulWidget {

  @override
    State<StatefulWidget> createState() {
      // TODO: implement createState
      return new _CupertinoNavigatorStat();
    }
}


class _CupertinoNavigatorStat extends State<CupertinoNavigator> {
  @override
    Widget build(BuildContext context) {

      return new CupertinoTabScaffold(
        tabBar: new CupertinoTabBar(
          items: [
            new BottomNavigationBarItem(
              icon: new Icon(Icons.directions_bike),
              title: new Text("Bick"),
            ),
            new BottomNavigationBarItem(
              icon: new Icon(Icons.directions_subway),
              title: new Text("Subway"),
            ),
            new BottomNavigationBarItem(
              icon: new Icon(Icons.directions_run),
              title: new Text("Run"),
            ),
          ],
        ),
        tabBuilder: (BuildContext context, int index){
          assert(index >= 0 && index <= 2);
          switch(index) {
            case 0:
              return new Image.network("https://ss0.bdstatic.com/94oJfD_bAAcT8t7mm9GUKT-xh_/timg?image&quality=100&size=b4000_4000&sec=1536142762&di=52ed92df2b4e4b653cb9683ae083068d&src=http://pic.3h3.com/up/2018-7/201807151414572657.jpg");
              break;
            case 1:
              return new Image.network("https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1536152864925&di=d8b051cc0a3414a8f1916de7b1137216&imgtype=0&src=http%3A%2F%2Fimg4.duitang.com%2Fuploads%2Fitem%2F201512%2F13%2F20151213112543_sitRU.jpeg");
              break;
            case 2:
              return new Image.network("https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1536152864924&di=3232f7dcf8f5440ea1659e6889422ca6&imgtype=0&src=http%3A%2F%2Fimg5.duitang.com%2Fuploads%2Fitem%2F201206%2F25%2F20120625165837_ZjYNu.thumb.700_0.jpeg");
              break;
          }
          return null;
        },
      );
    }
}