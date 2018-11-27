import 'package:flutter/material.dart';

class RectangleTextField extends StatefulWidget {

  final TextEditingController controller;
  final Radius radius;
  final double width;

  final ValueChanged<String> onSubmitted;
  final ValueChanged<String> onChanged;
  final VoidCallback onEditingComplete;

  const RectangleTextField({
    Key key,
    this.width = 100.0,
    this.controller,  
    this.radius = const Radius.circular(10.0),
    this.onSubmitted,
    this.onChanged,
    this.onEditingComplete,
  }) : super(key:key);

  createState() => new _State();
}

class _State extends State<RectangleTextField> {

  @override
    Widget build(BuildContext context) {
      return new Container(
        width: widget.width,
        decoration: new ShapeDecoration(
          shape: new RoundedRectangleBorder(
            borderRadius: BorderRadius.all(widget.radius,),
            side: new BorderSide(color: Colors.blueAccent),
            )
        ),
        child: new TextField(
          
          controller: widget.controller,
          decoration: new InputDecoration(
            border: InputBorder.none,
            hintText: "text", ),
          onChanged: widget.onChanged,
          onEditingComplete: widget.onEditingComplete,
          onSubmitted: widget.onSubmitted,
          
        ),
      );
      
    }
}