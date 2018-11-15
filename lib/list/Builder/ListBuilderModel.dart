import 'package:flutter/material.dart';
import 'dart:convert';

class ListBuilderModel {

  String titleIcon;
  String title;
  String subTitle;
  String cIcon;
  String description;
  String tips;

  ListBuilderModel(String jsonString) {
    JsonCodec jsonCodec = new JsonCodec();
    Map<String, dynamic> decoded = jsonCodec.decode(jsonString);
    
    // title = decoded['title'];
    titleIcon = decoded['titleIcon'];
    subTitle = decoded['subTitle'];
    cIcon = decoded['cIcon'];
    description = decoded['description'];
    tips = decoded['tips'];

    print('-->title: $title, titleIcon: $titleIcon, subTitle: $subTitle, cIcon: $cIcon, description: $description, tips: $tips');
  }
}