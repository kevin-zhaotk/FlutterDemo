import 'dart:convert';

import 'package:flutter/material.dart';

import 'navigate/PageRouteSecondWidget.dart';
import 'FirstLayer/BikeList.dart';
import 'FirstLayer/WidgetsDemo.dart';
import 'style/KZTextStyle.dart';
import 'stack/StackDemoPage.dart';
import 'list/ListViewDemo.dart';
import 'package:fluttertoast/fluttertoast.dart';
// import 'package:plugin_test/plugin_test.dart';
import 'scrollview/DemoCustomsrollview.dart';
import 'webview/WebViewDemo.dart';
import 'sqlite/SqliteDemo.dart';
import 'http/HttpDemo1.dart';
import 'sqlite/SharePreference.dart';
import 'package:fluro/fluro.dart';
import 'router/Routers.dart';

class PageViewNavigator extends StatefulWidget {

  @override
    State<StatefulWidget> createState() {
      return new _PageViewNavigatorState();
    }
}


class _PageViewNavigatorState extends State<PageViewNavigator> {

  var _currentIndex = 0;
  var _pageController = new PageController(initialPage: 0);

  @override
    Widget build(BuildContext context) {
      return new Scaffold(
        appBar: new AppBar(
         title: new Text("Kevin`s Home"),
         elevation: 1.0,
          backgroundColor: Colors.blue,
        ),
       drawer: new Text("my Drawer", textDirection:  TextDirection.rtl,),
        floatingActionButton: new RaisedButton( child: new Text("RaisedBtn"), onPressed: _onRaisedPressed,),
        body: new PageView.builder(
         itemBuilder: (BuildContext context, int index) {
           switch(index) {
             case 0:
                return new Center(
                 child: new Column(
                   children:[
                     new Text("Run"),
                     new IconButton( icon: new Icon(Icons.directions_run), onPressed: onGoSecond,),
                     new FlatButton( child: new Text("Stack Demo", style: KZTextStyle.normalBtn,), onPressed: _goStackDemo,),
                     new FlatButton( child: new Text("ListView", style: KZTextStyle.normalBtn,), 
                          onPressed: (){
                            Navigator.of(context).push( new MaterialPageRoute(
                              builder: (BuildContext context) { return new ListViewDemo(); }
                            ));
                          },),
                      new FlatButton(child: new Text('pluginTest', style: KZTextStyle.normalBtn,), 
                        onPressed: () {
                          //var version = PluginTest.platformVersion;
                          //version.then((String ver) {Fluttertoast.showToast( msg: ver);});
                          
                        },
                      ),
                      new FlatButton( child: new Text('DemoScrollView', style: KZTextStyle.normalBtn,), 
                        onPressed: () {
                          Navigator.of(context).push(
                            new MaterialPageRoute(builder: (context) { return new DemoCustomScrollView();}
                          ));
                            
                        },
                      ),

                      new FlatButton(
                        child: new Text('WebView', style: KZTextStyle.normalBtn,),
                        onPressed: () {
                          // Navigator.of(context).push(
                          //   new MaterialPageRoute(builder: (context) {
                          //     return new WebViewDemo(mUrl: 'https://www.baidu.com',);
                          //   })
                          // );
                          var json = jsonEncode(Utf8Encoder().convert('https://www.baidu.com'));
                          Routers.router.navigateTo(context, '${Routers.page2}?message=$json', transition: TransitionType.fadeIn);
                        },
                      ),
                      // Database Demo
                      new FlatButton(
                        child: new Text('DataBase', style: KZTextStyle.normalBtn,),
                        onPressed: () {
                          Navigator.of(context).push(
                            new MaterialPageRoute(
                              builder: (context){ return new SqliteDemo();} )
                          );
                        },
                      ),
                      // Http Demo
                      new FlatButton(
                        
                        child: new Text('Http Demo', style: KZTextStyle.normalBtn,),
                        onPressed: () {
                          Navigator.of(context).push(
                            new MaterialPageRoute(builder: (context) {return new HttpDemo1();})
                          );
                        },
                      ),
                      // Storage Demo
                      new FlatButton(
                        child: new Text('Storage Demo', style: KZTextStyle.normalBtn,),
                        onPressed: () {
                          Navigator.of(context).push(
                            new MaterialPageRoute(builder: (context) {return new SharePreference();})
                          );
                        },
                      ),
                   ]
                 ),
                );
             break;
             case 1:
                return new BikeList();
                break;
            case 2:
                return new WidgetsDemo();
                break;
           }
         },
         controller: _pageController,
         onPageChanged: _onPageChanged,
         itemCount: 3,
        ),
        bottomNavigationBar: new BottomNavigationBar(
          items: [
            new BottomNavigationBarItem(
              icon: new Icon(Icons.directions_run),
              title: new Text("Run"),
              
            ),
            new BottomNavigationBarItem(
              icon: new Icon(Icons.directions_bike),
              title: new Text("Bike"),
            ),
            new BottomNavigationBarItem(
              icon: new Icon(Icons.directions_car),
              title: new Text("Drive"),
              
            ),
            
          ],
          onTap: _onTap,
          currentIndex: _currentIndex,
        ),
      );
    }


    void _onTap(int index) {
      print('index = $index , currentIndex = $_currentIndex');
      if (_currentIndex == index) {
        return;
      }
      print('setState');
      
      setState(() {
              _currentIndex = index;
            });
      _pageController.jumpToPage(index);
      
      // _pageController.animateToPage(index, duration: new Duration( seconds: 1), curve: Curves.ease);     
    }

    void _onPageChanged(int index) {
      print("--->_onPageChanged $index");
        setState(() {
                  _currentIndex = index;
                });
    }

  void _goStackDemo() {
    Navigator.of(context).push(
      new MaterialPageRoute(
       builder: (context) => new StackDemoPage(),
      )
    );
  }
    void _onRaisedPressed() {

    }
    void onGoSecond() {
      Navigator.of(context).push(
        new MaterialPageRoute(
          builder: (context) => new PageRouteSecondWidget(),
        )
      );
    }
}