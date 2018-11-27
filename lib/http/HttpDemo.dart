import 'package:flutter/material.dart';
import 'HttpGet.dart';
import 'HttpPost.dart';

class HttpDemo extends StatefulWidget {

  createState() => new _State();

}

class _State extends State<HttpDemo> with SingleTickerProviderStateMixin{

  List<String> tabs = ["Get", "Post"];

  PageController pageController = new PageController();
  TabController tabController;
  
  

  @override
    void initState() {
      super.initState();
      tabController = new TabController(length: tabs.length, vsync: this);
    }
  
  @override
    void dispose() {
      super.dispose();
      tabController.dispose();
    }

  @override
    Widget build(BuildContext context) {
      // return new Text('Http Demo');
      return new DefaultTabController(
        length: tabs.length,
        child: new Scaffold(
          appBar: new AppBar(
            title: new Text('Http Demo'),
            bottom: new TabBar(
              isScrollable: false,
              controller: tabController,
              tabs: tabs.map((String title) {
                return new Text(title);
              }).toList(),
            ),
          ),
          body: new TabBarView(
            controller: tabController,
            children: <Widget>[
              new HttpGet(),
              new HttpPost(),
            ],
          ),
        
        ),
      );
    }
}