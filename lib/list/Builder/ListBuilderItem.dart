import 'package:flutter/material.dart';
import 'ListBuilderModel.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ListBuilderItem extends StatelessWidget {
  
  final ListBuilderModel model;

  ListBuilderItem({this.model});

  @override
    Widget build(BuildContext context) {
      
      double width = MediaQuery.of(context).size.width;
      double height = 200.0;//MediaQuery.of(context).size.height;

      return new Container(
          //height: height,//width/16 * 9,
          margin: EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 10),
          padding: EdgeInsets.only(top: 10),
          decoration: new BoxDecoration(color: Colors.white),
          child: new Column(
            
            children: <Widget>[
              new Row(
                
                children: <Widget>[
                  new Image.network(model.titleIcon, width: 150,),
                  // new Padding(padding: EdgeInsets.only(left: 20), child: new Text(model.title, style: new TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Colors.deepOrange),)),
                  new Text(model.subTitle, style: new TextStyle(fontSize: 16, color: Colors.deepOrange, ), maxLines: 1, overflow: TextOverflow.ellipsis,),
                ],
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              ),
              new Container(
                margin: EdgeInsets.all(10.0),
                color: Colors.grey[200],
                padding: EdgeInsets.all(5),
                child: new Row(
                  children: <Widget>[
                    new Image.network(model.cIcon, width: 100, height: 100,),
                    new Padding(
                      padding: EdgeInsets.only(left: 10), 
                      child: new Column(children: <Widget>[
                        new Text(model.description, style: const TextStyle(color: Colors.black, fontSize: 20,), overflow: TextOverflow.ellipsis,),
                        new Text(model.tips, style: const TextStyle(color: Colors.grey, fontSize: 16,), overflow: TextOverflow.ellipsis,),
                      ],
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      ),
                    )
                  ],
                  mainAxisAlignment: MainAxisAlignment.center,
                ),
              ),
              new Container(
                alignment: Alignment.centerRight,
                margin: EdgeInsets.only(right: 10),
                child: new FlatButton(
                  child: new Text('立即加入'),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(new Radius.circular(5))),
                  color: const Color.fromARGB(128, 240, 192, 50),
                  onPressed: () {
                    print('===>pressed item ${model.description}');
                    Fluttertoast.showToast(msg: 'join ${model.description}', toastLength: Toast.LENGTH_SHORT);
                  },
                ),
              )
            ],
          ),
        );
    }
}