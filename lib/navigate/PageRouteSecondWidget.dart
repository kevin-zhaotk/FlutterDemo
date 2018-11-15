import 'package:flutter/material.dart';


class PageRouteSecondWidget extends StatefulWidget {

  @override
    createState() => new _PageRouteSecondWidgetStat();
}

class _PageRouteSecondWidgetStat extends State<PageRouteSecondWidget> {
  @override
    Widget build(BuildContext context) {
      // TODO: implement build
      return new Scaffold(
        appBar: new AppBar(
          title: new Text("Second Widget"),
        ),
        body: new Padding(
          padding: new EdgeInsets.all(16.0),
          child: new Column(
            children: <Widget>[
              new Text("Second Widget body"),
              new IconButton(icon: new Icon(Icons.arrow_back), onPressed: onBack,)
            ],
          ),
        ),
      );
    }

    void onBack() {
      Navigator.pop(context);
    }
}
