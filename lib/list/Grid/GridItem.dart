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
          decoration: new BoxDecoration(
            color: Colors.white,
            image: new DecorationImage(image: new AssetImage(imgUrl,), fit: BoxFit.fill),
            borderRadius: BorderRadius.all(Radius.circular(50.0)),
          ),
        ),
        // child: new CircleAvatar( backgroundImage: new AssetImage(imgUrl),),
      
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