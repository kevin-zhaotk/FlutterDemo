import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../style/KZTextStyle.dart';
import 'SqliteAccessor.dart';
import 'TableUser.dart';
import '../baseUI/RectangleTextField.dart';

class SqliteDemo extends StatefulWidget {

  @override
    State<StatefulWidget> createState() {
      return new _State();
    }
}

class _State extends State<SqliteDemo> {

  SqliteAccessor accessor = new SqliteAccessor();
  

  String result;

  // UI Declaration
  RectangleTextField name;
  RectangleTextField id;
  RectangleTextField age;
  Text queryResult;

  final TextEditingController nameCtrl = new TextEditingController();
  final TextEditingController idCtrl = new TextEditingController();
  final TextEditingController ageCtrl = new TextEditingController();

  @override
    void initState() {
      super.initState();
      uiImplement();
    }
  // UI Implematation
  void uiImplement() {
    name = new RectangleTextField(width: 60, controller: nameCtrl);
    id = new RectangleTextField(width: 60, controller: idCtrl,);
    age = new RectangleTextField(width: 60, controller: ageCtrl,);

    
  }

  @override
    Widget build(BuildContext context) {
      return new Scaffold(
        appBar: new AppBar(title: new Text('SqliteDemo', style: KZTextStyle.WebViewTitle,),),
        body: new Column(children: <Widget>[
          new FlatButton(
            child:  new Text('Insert DB', style: KZTextStyle.normalBtn,), 
            onPressed: () {
              accessor.insert(new UserInfo(name:"kevin"));
            },
          ),

          // 
          new Row(
            children: <Widget>[
              new Text('Name:', style: const TextStyle( color: Colors.black, fontSize: 20),),
              // new Container(child: new TextField(decoration: const InputDecoration(border: InputBorder.none),), width: 100,), 
              name,
              new Text('Id:', style: const TextStyle( color: Colors.black, fontSize: 20),),
              id,
              new Text('Age:', style: const TextStyle( color: Colors.black, fontSize: 20),),
              age,

              new RaisedButton(child: new Text('Submit'), onPressed: () {
                print('name: ${nameCtrl.text}');
                if (nameCtrl.text.isEmpty) {
                  Fluttertoast.showToast(msg: 'Name can not be empty');
                  return;
                }
                _insert();
              },)
            ],
          ),
          new FlatButton(
            child: new Text('Query DB', style: KZTextStyle.normalBtn,),
            onPressed: () {
              Future<List<UserInfo>> r = accessor.queryAll();
              String text = "";
              r.then((List<UserInfo> infos) {
                if (infos == null) {
                  if (infos == null || infos.isEmpty) {
                    return;
                  }
                }
                infos.forEach( (info) {
                  text += info.toMap().toString();
                });
                setState(() {
                                  result = text;
                                });
              });
            },
          ),
          new Text(result == null ? "" : result, style: KZTextStyle.normalText,),
        ],),
      );
    }

  void _insert() {

    var userInfo = new UserInfo(name: nameCtrl.text, id: idCtrl.text, age: int.parse(ageCtrl.text));
    
    accessor.insert(userInfo);
  }


}