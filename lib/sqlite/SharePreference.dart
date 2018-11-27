
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:path_provider/path_provider.dart';

class SharePreference extends StatefulWidget {

  createState() => new _State();

}

class _State extends State<SharePreference> {

TextEditingController controller = new TextEditingController();

  String _userName = 'userName';
  int _groupValue = 0;
  String _curDir = '';

  @override
    Widget build(BuildContext context) {
      return new Scaffold(
        appBar: new AppBar(title: new Text('SP Demo'),),
        body: new Column(children: <Widget>[
          new Text('Please input your name:', style: new TextStyle(fontSize: 20, color: Colors.blueAccent),),
          new TextField(controller: controller,),
          new Center(
            child: new Column(
              children: <Widget>[
                new RaisedButton(child: new Text(' Save '), color: Colors.blue, onPressed: ()=> save() ,),
                new RaisedButton(child: new Text(' Query '), color: Colors.purple, onPressed: () => query() ,),
              ],
            ),
          ),

          new Center(
            child: new Row(children: <Widget>[
              new Radio(
                value: 1,
                groupValue: _groupValue,
                activeColor: Colors.red,
                onChanged: (value) => changeRadio(value),
              ),
              new Text('Temp'),
              new Radio(
                value: 2,
                groupValue: _groupValue,
                activeColor: Colors.blue,
                onChanged: (value) => changeRadio(value),
              ),
              new Text('Doc'),
              new Radio(
                value: 3,
                
                groupValue: _groupValue,
                activeColor: Colors.green,
                onChanged: (value) => changeRadio(value),
              ),
              new Text('Ext'),
            ],),
          ),

          new Text(_curDir),
          
        ],),
      );
    }

    save() async {
      SharedPreferences sp = await SharedPreferences.getInstance();
      sp.setString(_userName, controller.text);
    }

    query() async {
      SharedPreferences sp = await SharedPreferences.getInstance();
      String name = sp.getString(_userName);
      Fluttertoast.showToast(msg:name);
    }

    changeRadio(int value) {
      Future<Directory> dir = getPath(value);
      dir.then((Directory directory) {
        setState(() {
              _groupValue = value;
              print('--->directory: ${directory.path}');
              _curDir = directory.path;
            });
      });
      
    }
    
    Future<Directory> getPath(int value) async {
      Directory path;
      if (value == 1) {
        path = await getTemporaryDirectory();
      } else if (value == 2) {
        path = await getApplicationDocumentsDirectory();
      } else {
        path = await getExternalStorageDirectory();
      }

      return path;
    }

}