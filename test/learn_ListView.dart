import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'JSPang Flutter Demo',
      home: Scaffold(
        appBar: AppBar(
          title: Text('ListView Widget'),
        ),
        body: Center(
          child: Container(
            height: 200.0,
            child: MyList(),
          ),
        ),
      ),
    );
  }
}

class MyList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      scrollDirection: Axis.horizontal,
      children: <Widget>[
        Container(
          width: 180.0,
          color: Colors.lightBlue,
        ),
        Container(
          width: 180.0,
          color: Colors.amber,
        ),
        Container(
          width: 180.0,
          color: Colors.deepOrange,
        ),
        Container(
          width: 180.0,
          color: Colors.green,
        ),
      ],
    );
  }
}