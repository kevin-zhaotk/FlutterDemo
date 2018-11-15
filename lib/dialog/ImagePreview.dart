import 'package:flutter/material.dart';

class ImagePreview extends StatelessWidget {

  final String imageUrl;

  ImagePreview({this.imageUrl});

  @override
    Widget build(BuildContext context) {
      
      return new Dialog(
        
        child: new GestureDetector(
          child: new Image.asset(imageUrl, width: 500, height: 500, fit: BoxFit.contain,  ),
          onVerticalDragDown: (action) {
            //print('--->onDragDown action: ${action.toString()}');
            //Navigator.pop(context);
            onAction(context, action);
          },
          onVerticalDragEnd: (action) {
            onAction(context, action);
          },
          onVerticalDragStart: (DragStartDetails action) {
            onAction(context, action);
          },
          onVerticalDragUpdate: (action) {
            onAction(context, action);
          },
          onVerticalDragCancel: () {
            print('--->vertical drag cancel');
          },
          onPanDown: (action) {
            onAction(context, action);
          },
          onPanStart: (action) {
            onAction(context, action);
          },
          onPanEnd: (action) {
            onAction(context, action);
          },
          onPanUpdate: (action) {
            onAction(context, action);
          },
          onPanCancel: () => print('--->on pan cancel'),
          onTap:  () => print('--->on tap'),
          onTapDown: (action) {
            onAction(context, action);
          },
          onTapUp: (action) {
            onAction(context, action);
          },
          onTapCancel: () => print('-->on tap cancel'),
          
        ),
      );
    }

  void onAction(BuildContext context, var action) {
    print('--->action: ${action.toString()}');
    // Navigator.pop(context);
  }
}