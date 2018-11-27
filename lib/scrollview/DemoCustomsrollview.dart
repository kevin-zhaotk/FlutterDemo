import 'package:flutter/material.dart';

class DemoCustomScrollView extends StatelessWidget {
  @override
    Widget build(BuildContext context) {
      return CustomScrollView(
        slivers: <Widget>[
          const SliverAppBar(
            pinned: true,
            floating: false,
            expandedHeight: 100.0,
            flexibleSpace: const FlexibleSpaceBar(title: const Text('ScrollviewDemo')),
          ),

          new SliverGrid(
            gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 200.0,
              mainAxisSpacing: 10.0,
              crossAxisSpacing: 10.0,
              childAspectRatio: 2.0,
              
            ),
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                return Container(
                  alignment: Alignment.center,
                  color: Colors.teal[100 * (index % 8 + 1)],
                  child: new Text('grid item $index', style: new TextStyle(fontSize: 26.0),),
                );
              },
              childCount: 20,
            ),
            
          ),
          new SliverFixedExtentList(
            itemExtent: 100.0,
            
            delegate: new SliverChildBuilderDelegate(
              (context, index) {
                return Container(
                  alignment: Alignment.center,
                  color: Colors.lightBlue[100 * (index % 8 + 1)],
                  child: Text('list item $index'),
                );
              }
            ),
          ),
        ],
      );
    }
}