import 'package:flutter/material.dart';
import 'HttpGet.dart';
import 'HttpPost.dart';

class HttpDemo1 extends StatefulWidget {

  @override
    State<StatefulWidget> createState() {
      return new _State();
    }
}


class _State extends State<HttpDemo1> with SingleTickerProviderStateMixin {

  List tabs = ["Get", "Post"];

  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = new TabController(length: tabs.length, vsync: this);
  }


  @override
    Widget build(BuildContext context) {
      return new DefaultTabController(
        length: tabs.length,
        child: new Scaffold(
          appBar: new AppBar(
            title: new Text('Http Demo'),
            bottom: new TabBar(
              controller: _tabController,
              tabs: tabs.map((title) { return new Text(title); }).toList(),
              ),
            ),
          body: new TabBarView(
            controller: _tabController,
            children: <Widget>[
              new HttpGet(),
              new HttpPost(),

            ],
          ),
        ),
      );
    }
}