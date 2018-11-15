import 'package:flutter/material.dart';
import 'package:dictionary/dialog/ImagePreview.dart';


class GridItem extends StatelessWidget {

final int index;

  GridItem({this.index});

  @override
    Widget build(BuildContext context) {
      var imgUrl = 'images/image0${index%10}.jpeg';
      return new GestureDetector(
        onTap: () => showPreview(context, imgUrl),
        child: new Container(
        color: Colors.white,
        child: new Image.asset(imgUrl),

      ),
      );
    }
  
  void showPreview(BuildContext context, String img) {
      showDialog(
        context: context,
          barrierDismissible: true,
          builder: (context) => new ImagePreview(imageUrl: img),
        ) ;
  }
}