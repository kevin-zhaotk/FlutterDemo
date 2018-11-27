import 'dart:convert';

import 'package:fixnum/fixnum.dart';
import 'package:flutter/material.dart';
import 'Protobuf/data.pb.dart';
import 'package:http/http.dart' as http;
import 'package:fluttertoast/fluttertoast.dart';


class HttpPost extends StatelessWidget {
  
  final String url = "https://test-apm.jianlc.com/mobile/apm";

  @override
    Widget build(BuildContext context) {
      return new Center(child: new RaisedButton(
        child: new Text('Post'),
        onPressed: () {
          this.post();
        },
      ),);
    }


  Future<bool> post() async {
    Package pkg = buildPb();
    http.Response response = await http.post(
      Uri.encodeFull(url),
      headers: {"Content-Type":"application/octet-stream"},
      body: pkg.writeToBuffer(),
    );
    
    print('--->response: ${response.body}');

    if(response.statusCode == 200) {
      Map<dynamic, dynamic> body = json.decode(response.body);
      Fluttertoast.showToast(msg: body['message']);
    } else {
      Fluttertoast.showToast(msg: 'Request failed code: ${response.statusCode}');
    }
    return true;
  }

 Package buildPb() {
   var data = new ApmItem();
   data.platform = 'iOS';
   data.net = 'Wifi';
   data.sVer = "12.1";
   data.uid = "";
   data.version = "3.0.0";
   data.channel = "AppStore";
   data.device = "device";
   data.imei = "imei";
   data.logType = 1;
   data.content = "";

   var netSt = new NetStat();
   netSt.start =  Int64.fromInts(1, 0);
   netSt.end = Int64.fromInts(1,1);
   netSt.code = 0;
   netSt.consume = 2;
   netSt.url = "https://api.jianlc.com";
   data.netStat = netSt;

   Package package = new Package();
   package.data.add(data);
   return package;
   
 }
}