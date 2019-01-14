import 'package:flutter/material.dart';

class AnimationDemo extends StatefulWidget {

  
  @override
    State<StatefulWidget> createState() {
      return new _State();
    }
}


class _State extends State<AnimationDemo> with SingleTickerProviderStateMixin {

    Animation<double> animation;
    AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller = new AnimationController(duration: const Duration(milliseconds: 5000)
                  , vsync: this);
    
    animation = Tween(begin: 0.0, end: 300.0).animate(controller)
            ..addListener(() {
              print('${animation.value}');
              setState(() {
                              
                            });
            });
    animation.addStatusListener((AnimationStatus status){
        print('$status');
    });
    controller.forward();
    
  }
  @override
    Widget build(BuildContext context) {
      // return new Center(
      //   child: new Container(
      //     margin: EdgeInsets.symmetric(vertical: 10.0),
      //     height: animation.value,
      //     width: animation.value,
      //     child: FlutterLogo(),
      //   ),
      // );
      return Center(
        child: new ScaleAnimationWidget(animation: animation),
      );
    }

  @override
    void dispose() {
      controller.dispose();
      super.dispose();
    }
}


class ScaleAnimationWidget extends AnimatedWidget {

  final Tween _scaleAnim;
  ScaleAnimationWidget({Key key, Listenable animation}) :
                        _scaleAnim = Tween(begin: 0.0, end: 18.0)
                        , super(key:key, listenable: animation)                        ;
  
  
  @override
    Widget build(BuildContext context) {
      Animation animation = listenable;
      print('${_scaleAnim.evaluate(animation)}');
      return new Transform.rotate(
        angle: _scaleAnim.evaluate(animation),
        child: Container(
          width: animation.value,
          height: animation.value,
          child: FlutterLogo(),
        ) 
      );
    }
}