import 'package:http/http.dart' as http;
import 'dart:convert';

class TestModel {

  static const URL = "http://c.m.163.com/nc/article/list/T1444270454635/0-20.html";
  final String title;
  final String url;

  TestModel(this.title, this.url);

  TestModel.fromJsonMap(Map map):
      title = map['title'],
      url = map['imgsrc'];


}