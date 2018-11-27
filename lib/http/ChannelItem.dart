import 'package:flutter/material.dart';
import 'ChannelInfo.dart';
import '../style/KZTextStyle.dart';

class ChannelItem extends StatelessWidget {

  final ChannelInfo info;

  ChannelItem({this.info});

  

  @override
    Widget build(BuildContext context) {
      print('-->info: ${info.title}');
      return new Container(
        height: 80.0,
        child: new Row(
          children: <Widget>[
            new Image.network(info.iconUrl, width: 70, height: 70,),
            new Text(info.title, style: KZTextStyle.listItemFirstTitle,),
          ],
        ),
      );
    }
}