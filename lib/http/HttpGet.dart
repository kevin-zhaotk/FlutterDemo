import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'ChannelInfo.dart';
import 'ChannelItem.dart';

class HttpGet extends StatefulWidget {

final String xmlyUrl = "https://mobile.ximalaya.com/mobile/discovery/v2/categories?channel=and-d8&code=43_310000_3100&device=android&picVersion=11&scale=2&version=5.4.45";
  createState() => new _State();
  
}

class _State extends State<HttpGet> {
  
  List<ChannelInfo> channels;

  @override
  void initState() {
    super.initState();
    channels = new List();
    this.getJson(widget.xmlyUrl);
  }
  @override
    Widget build(BuildContext context) {
      print('--->list.length: ${channels.length}');
      return new ListView.builder(
        itemCount: channels.length,
        itemBuilder: (context, index) {
          print('--->build: $index');
          return new ChannelItem(info: channels.elementAt(index),);
        },
      );
  }

  Future<String> getJson(String url) async {
    var response = await http.get(
      //Encode url
      Uri.encodeFull(url),
      // Header
      headers: {"Accept": "application/json"},
    );
    print('--->response: ${response.body}');

    List<ChannelInfo> chns = new List();
    var covertDataToJson = json.decode(response.body);
    var list = covertDataToJson['list'];
    for (var item in list)  {
      // print('item: $item');
      chns.add(ChannelInfo.fromJson(item));
    }
    setState(() {
      channels.clear();
      channels.addAll(chns);
    });
    

    return "Success";
  }
}