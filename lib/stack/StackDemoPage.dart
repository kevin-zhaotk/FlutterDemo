import 'package:flutter/material.dart';
import 'alignment_bar.dart';
import 'stack_page.dart';
import 'StackPositioned.dart';
import 'package:fluttertoast/fluttertoast.dart';

class StackDemoPage extends StatefulWidget {
  
  
  //var stackPage = new StackPage();

  createState() => new _StackDemoPage();
  

  
}

class _StackDemoPage extends State<StackDemoPage> {
  
  var alignmentBar;
  var spAlignment = Alignment.topLeft;
  var stack = 0;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
     
     body: new Column(
      
      children: <Widget>[
        new Placeholder( fallbackHeight: 30.0,),
        new AlignmentSelectBar(
          onStateChanged: onAlignmentChange,
          onStack: onStack,
        ),
        stack == 0 ? new StackPage(alignment: spAlignment,) : new StackPositioned()
      ],
      ),
    );
    
  }


  void onAlignmentChange(Alignment align) {
    print("-->align: ");
    Fluttertoast.showToast(
     msg: "align changed",
     bgcolor: "#e74c3c",
     textcolor: "#ffffff",
     gravity: ToastGravity.CENTER,
     toastLength: Toast.LENGTH_SHORT
    );
    // stackPage.updateAlignment(align);
    setState(() {
          spAlignment = align;
        });
  }

  void onStack(int stack) {
    setState(() {
          this.stack = stack;
        });
  }
}