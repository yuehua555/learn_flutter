import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ListView widget',
      home: Scaffold(
        appBar: new AppBar(
          title: new Text('垂直方向布局'),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Center(
              child: Text('I am JSPang'),
            ),
            Expanded(
              child: Center(
                child: Text('My website is jspang.com'),
              ),
            ),
            Center(
              child: Text('I love coding'),
            ),
          ],
        ),
      ),
    );
  }
}
