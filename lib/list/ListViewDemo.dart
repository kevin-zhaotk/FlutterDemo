import 'package:flutter/material.dart';
import 'ScorllBar.dart';
import 'NormalList.dart';
import 'CustomList.dart';
import 'SepatatedList.dart';
import 'Grid.dart';
import 'ListPlaceHolder.dart';
import 'LIstBuilder.dart';

class ListViewDemo extends StatefulWidget {

  createState() => new _State();
}

class _State extends State<ListViewDemo> with SingleTickerProviderStateMixin {


  List<String> titles = ["Normal", "Builder", "Custom", "Separated", "Grid", "Sliver", "Test"];
  final PageController controller = new PageController(
    initialPage: 1,
  );

  TabController tabController;

  @override
    void initState() {
      super.initState();
      tabController = new TabController(length: titles.length, initialIndex: 0, vsync: this);
    }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
      // TODO: implement build
      return new DefaultTabController(
        length: titles.length,
        child: new Scaffold(
        
            appBar: new AppBar(
              backgroundColor: Colors.redAccent,
              automaticallyImplyLeading: false,
              leading: null,
              title: new Container(
                width: 200,
                // padding: EdgeInsets.only(left: 10.0, right: 10.0),
                decoration: new BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.elliptical(15.0, 15.0))),
                child: new TextField(
                  
                  decoration: new InputDecoration(
                    prefixIcon: new Icon(Icons.search), 
                    hintText: 'Hot words', 
                    border: new OutlineInputBorder(
                      borderSide: BorderSide.none, 
                      
                      borderRadius: BorderRadius.all(const Radius.elliptical(15.0,15.0))),  
                  ),
                  onSubmitted: (content){ 
                    //return new Dialog(child: ,)
                    showDialog(context: context, 
                      // barrierDismissible: false,
                      child: new AlertDialog(
                        title: new Text('Received: $content'),
                        actions: <Widget>[
                          new Center(
                            child: new Text('YES'),
                          ), new Text('NO')  
                        ],
                        
                        ),
                    );
                  },
                  ),),
              
              centerTitle: true,
              bottom: TabBar(
                isScrollable: true,
                controller: tabController,
                tabs: titles.map((itemName) {
                  return new Tab(text: itemName,
                    
                  );

                } ).toList(),
                
              ),
            ),
            body: new TabBarView(
              controller: tabController,
              children: <Widget>[
                new NormalList(),
                new ListBuilder(),
                new CustomList(),
                new SeparatedList(),
                new Grid(),
                new ListPlaceHolder(),
                new ListPlaceHolder(),
              ],
              ),
          )
          
      );

    }
}


