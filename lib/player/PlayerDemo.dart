import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import '../style/KZTextStyle.dart';

class PlayerDemo extends StatefulWidget {

  @override
    State<StatefulWidget> createState() {
      
      return new _State();
    }
}

class _State extends State<PlayerDemo> {

  VideoPlayerController _controller;
  bool _isPlaying = false;

  @override
    void initState() {
      super.initState();

      _controller = VideoPlayerController.network(
        'http://ivi.bupt.edu.cn/hls/cctv6hd.m3u8'
        )
      // _controller = VideoPlayerController.asset('video/big_buck_bunny.mp4')
        ..addListener((){
          bool isPlaying = _controller.value.isPlaying;
          if (isPlaying != _isPlaying) {
            setState(() {
                          _isPlaying = isPlaying;
                        });
          }
        })
        ..initialize().then((_){
          setState(() {});
        });
        //..setLooping(true);
    }

  @override
  void dispose() {
    super.dispose();

  }

  @override
    void deactivate() {
      _controller.setVolume(0.0);
      super.deactivate();
    }
  @override
    Widget build(BuildContext context) {
      print('--->build: ${_controller.value.initialized}');
      return new Scaffold(
        appBar: new AppBar(
          title: new Text('PlayerDemo', style: KZTextStyle.WebViewTitle,),
        ),
        body: new Center(
          child: videoView(),
        ),
        floatingActionButton:  new FloatingActionButton( 
          onPressed: _controller.value.isPlaying ? _controller.pause : _controller.play,
          child: new Icon(_controller.value.isPlaying ? Icons.pause : Icons.play_arrow),
          ),
      );
    }

    Widget videoView() {
      if (_controller.value.initialized) {
        final Size size = _controller.value.size;
        print('--->videoView  width: ${size.width}, height: ${size.height}');
        return new AspectRatio( aspectRatio: size.width/size.height,
          child: new VideoPlayer(_controller),
        );
      } else {
        return Container();
      }
    }
}