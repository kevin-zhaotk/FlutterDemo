import 'package:flutter/material.dart';
import 'TestViewModel.dart';
import 'TestModel.dart';

class MvvmView extends StatefulWidget {

  

  @override
    State<StatefulWidget> createState() {
      return new _State();
    }
}


class _State extends State<MvvmView> {

  TestViewModel vm = new TestViewModel();
  Future _future;
  @override
    void initState() {
      super.initState();
      _future = vm.load();
      // vm.load();
    }
  @override
    Widget build(BuildContext context) {
      return Scaffold(
        appBar: new AppBar(
          title: new Text('MVVM'),
          actions: <Widget>[
            FlatButton(child: const Text('More'), onPressed: () {
              // vm._loadData();
              vm.load();
              setState(() {
                              
                            });
            },)
          ],
        ),
        body: _builder(context),
      );
      
    }

    FutureBuilder _builder(BuildContext context) {
      return new FutureBuilder(
        future: _future,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
              return Text('Press button to start.');
            case ConnectionState.active:
            case ConnectionState.waiting:
              return Text('Awaiting result...');
            case ConnectionState.done:
              if (snapshot.hasError)
                return Text('Error: ${snapshot.error}');
              return _createList(snapshot);
          }
        },
      );
    }


    Widget _createList(AsyncSnapshot snapshot) {
      List<TestModel> values = snapshot.data;
      return ListView.builder(
        
        itemCount: values.length,
        itemBuilder: (BuildContext context, int index) {
          return new Column(
            children: <Widget>[
              
                
                  new Image.network(values[index].url, width: 100.0, height: 100.0,),
                  new Text(values[index].title),
              
              
              new Divider(height: 2.0,)
            ],
          );
        },
      );
    }
}