import 'package:flutter/material.dart';
import 'Student.dart';
class SeparatedList extends StatefulWidget {

final List<Student> students = [
    new Student( name: 'Kevin', age: 20, icon: ''),
    new Student( name: 'James', age: 21, icon: ''),
    new Student( name: 'Lily', age: 22, icon: ''),
    new Student( name: 'Bella', age: 23, icon: ''),
    new Student( name: 'Kotlin', age: 24, icon: ''),
    new Student( name: 'Gary', age: 25, icon: ''),
    new Student( name: 'Michel', age: 26, icon: ''),
    new Student( name: 'Jet', age: 27, icon: ''),
    new Student( name: 'Jacky', age: 28, icon: ''),
    new Student( name: 'Bruce', age: 29, icon: ''),
    new Student( name: 'Tony', age: 30, icon: ''),
    new Student( name: 'Hanmeimei', age: 31, icon: ''),
  ];
  createState() => new _State();

}

class _State extends State<SeparatedList> {

  @override
    Widget build(BuildContext context) {
      // TODO: implement build
      return new Container(
        margin: EdgeInsets.all(10),
        child: new ListView.separated(
          itemCount: widget.students.length,
          itemBuilder: (BuildContext context, int index) {
            var student = widget.students.elementAt(index);
            return new Row(
              children: <Widget>[
                new Icon(Icons.people, size: 60.0, color: Colors.blueGrey,),
                
                new Padding(padding: EdgeInsets.only(left: 20),
                 child: new Column(children: <Widget>[
                  new Text('${student.name}', style: new TextStyle(color: Colors.greenAccent, fontSize: 26, fontStyle: FontStyle.italic),),
                  new Text('${student.age}', style: new TextStyle(color: Colors.pinkAccent, fontSize: 24, ),)
                  
                ],
                crossAxisAlignment: CrossAxisAlignment.start,
                 
                ),
                )
                
              ],
              
            );
          },
          separatorBuilder: (BuildContext context, int index) {
            var student = widget.students.elementAt(index);
            return new Row(
              children: <Widget>[
                new Container(
                  margin: EdgeInsets.only(left: 10, right: 10),
                  height: 1,
                  width: MediaQuery.of(context).size.width - 40,
                  color: Colors.black45,
                ),
                  
              ],
            );
          },
        ),
      );
    }
}