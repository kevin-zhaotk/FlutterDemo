import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'dart:convert';
import '../style/KZTextStyle.dart';

class WebViewDemo extends StatefulWidget {

  final String mUrl;
  final int type;

  //WebViewDemo({this.mUrl = "www.baidu.com", this.type});

  WebViewDemo(url, this.type) : mUrl = (type == 0 ? url : decodeUrl(url));

  @override
  State<StatefulWidget> createState() {
    return new _State();
  }


  static String decodeUrl(var url) {
    List list = new List<int>();
    jsonDecode(url).forEach(list.add);

    String Url = Utf8Decoder().convert(list);
    return Url;
  }
}


class _State extends State<WebViewDemo> {

  String url;
  FlutterWebviewPlugin webviewPlugin = new FlutterWebviewPlugin();
  TextEditingController controller = new TextEditingController();

  @override
  void initState() {

    super.initState();
    url = widget.mUrl;
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

  void loadUrl() {
    
    setState(() {
          url = controller.text;
          webviewPlugin.reloadUrl(url);
        });
    // webviewPlugin.launch(url);
  }
}