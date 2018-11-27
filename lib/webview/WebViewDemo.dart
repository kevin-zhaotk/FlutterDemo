import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'dart:convert';
import '../style/KZTextStyle.dart';

class WebViewDemo extends StatefulWidget {

  final String mUrl;
  final int type;

  WebViewDemo({this.mUrl = "www.baidu.com", this.type});

  @override
  State<StatefulWidget> createState() {
    return new _State();
  }
}


class _State extends State<WebViewDemo> {

  String url;
  FlutterWebviewPlugin webviewPlugin = new FlutterWebviewPlugin();
  TextEditingController controller = new TextEditingController();

  @override
  void initState() {

    url = decodeUrl();
    super.initState();
    
    webviewPlugin.onStateChanged.listen((WebViewStateChanged state) {
      print('--->stat: ${state.type}  url: ${state.url}');
    });

    webviewPlugin.onUrlChanged.listen(
      (url) {
      print('--->urlChange: $url');
      },
      onError: (error) {
        print('--->error: $error');
      },
      onDone: () {
        print('--->done');
      },
    );
  }

  @override
    void dispose() {
      super.dispose();
      webviewPlugin.dispose();
    }
  @override
    Widget build(BuildContext context) {
      return new WebviewScaffold(
        appBar: new AppBar(
          backgroundColor: Colors.purple,
          title: new TextField(
            decoration: new InputDecoration(fillColor: Colors.white, border: InputBorder.none),
            style: new TextStyle(color: Colors.white),
            onSubmitted: (content) {
              loadUrl();
            },
            controller: controller,
          ),
        ),
        url: url,
        withZoom: true,
        withJavascript: true,
        withLocalStorage: true,
        //initialChild: new Text('....loading'),
         hidden: true,
      );
    }

  String decodeUrl() {
    String url;
    List list = new List<int>();
    if(widget.type != 0) {
      jsonDecode(widget.mUrl).forEach(list.add);
      url = Utf8Decoder().convert(list);
    } else {
      url = widget.mUrl;
    }
    return url;
  }
  void loadUrl() {
    
    setState(() {
          url = controller.text;
          webviewPlugin.reloadUrl(url);
        });
    // webviewPlugin.launch(url);
  }
}