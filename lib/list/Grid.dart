import 'package:flutter/material.dart';
import 'Grid/GridItem.dart';

class Grid extends StatefulWidget {
  @override
    State<StatefulWidget> createState() {
      // TODO: implement createState
      return new _State();
    }
}

class _State extends State<Grid> {

  var flex = true;
  double maxAxisExtent = 120;
  @override
    Widget build(BuildContext context) {
      // TODO: implement build
      return new Scaffold(
        backgroundColor: Colors.grey[300],
        body: new Column(
        
        children: <Widget>[
          new Row(children: <Widget>[
            
            new RaisedButton(
              child: new Text('Fixed'), 
              color: flex ? Colors.lightBlueAccent : Colors.grey,
              onPressed: (){
                if (flex) {
                   return;
                }
                setState(() {
                  flex = true;
                });
            }),
            new RaisedButton(
              child: new Text('Extent'), 
              color: flex ? Colors.grey : Colors.lightBlueAccent,
              onPressed: (){
              if (!flex) {
                return;
              }
              setState(() {
                              flex = false;
                            });
            },),
            new Container(
              width: 100,
              margin: EdgeInsets.only(left: 20),
              padding: EdgeInsets.only(left: 5, right: 5),
              decoration: new ShapeDecoration(shape: new RoundedRectangleBorder(borderRadius: const BorderRadius.all(const Radius.circular(20))), color: Colors.grey),

              child: new TextField(
                style: new TextStyle(fontSize: 20, color: Colors.blueAccent),
                textAlign: TextAlign.center,
                onSubmitted: (content) {
                  setState(() {
                                      maxAxisExtent = double.parse(content);
                                    });
                },
              keyboardType: const TextInputType.numberWithOptions(decimal: true),
            
            ),)
            
          ],),
          new Flexible(child: flex ? buildFixed() : buildExtent(),)
          //
        ],
      ),
      );
    }



    Widget buildFixed() {
      return new GridView.builder(
              itemCount: 100,
              
              padding: EdgeInsets.all(10),
              gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount( crossAxisCount: 3, crossAxisSpacing: 10.0, mainAxisSpacing: 10.0, ),
              itemBuilder: (context, index) {
                return new GridItem(index: index,);
              },
              
          );
    }

    Widget buildExtent() {
      return new GridView.builder(
        padding: EdgeInsets.all(10),
        gridDelegate: new SliverGridDelegateWithMaxCrossAxisExtent(maxCrossAxisExtent: maxAxisExtent, crossAxisSpacing: 10, mainAxisSpacing: 10),
        itemBuilder: (context, index) {
                return new GridItem(index: index,);
              },
      );
    }
}