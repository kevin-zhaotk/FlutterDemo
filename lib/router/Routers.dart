import 'package:fluro/fluro.dart';
import '../webview/WebViewDemo.dart';
import 'dart:convert';

class Routers {

  static Router router = new Router();

  static String page1 = '/';
  static String page2 = '/webview';


  static void configureRoutes(Router router) {
    router.define(
        page1, handler: Handler(handlerFunc: (context, params) => WebViewDemo()));
    router.define(
        page2, handler: Handler(handlerFunc: (context, params) {
      var message = params['message']?.first;//取出传参

      
      return WebViewDemo(mUrl: message, type: 1,);
    }));
    Routers.router = router;
  }
}