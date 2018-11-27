import 'dart:core';
import 'package:flutter/material.dart';

class TableUser {

  static final String NAME = 'user';

  static final String SQL_CREATE = "CREATE TABLE $NAME (name TEXT, id TEXT, age INTEGER)";

  
}

class UserInfo {
  String name;
  String id;
  int age;

  UserInfo({
    @required this.name,
    String id = "",
    int age = 20
    })
  {
    this.id = id;
    this.age = age;
  }

  Map<String, dynamic> toMap() {
    return {"name":name, "id":id, 'age':age};
  }
}