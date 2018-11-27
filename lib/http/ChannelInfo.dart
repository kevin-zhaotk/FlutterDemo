import 'dart:core';

class ChannelInfo {

  final String title;
  final String subTitle;
  final String iconUrl;

  const  ChannelInfo({this.title, this.subTitle, this.iconUrl});

  static ChannelInfo fromJson(Map<String, dynamic> jsonObject) {
    // print('ChannelInfo: $jsonObject');
    // print('ChannelInfo: ${jsonObject["title"]}');
    // print('ChannelInfo: ${jsonObject["contentType"]}');
    return new ChannelInfo(title: jsonObject['title'], subTitle: jsonObject['contentType'], iconUrl: jsonObject['coverPath']);
  }
}