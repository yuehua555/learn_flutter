import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ListView widget',
      home: Scaffold(
        appBar: new AppBar(
          title: new Text('水平方向布局'),
        ),
        body: new Row(
          children: <Widget>[
            RaisedButton(
              onPressed: () {},
              color: Colors.redAccent,
              child: Text('红色按钮'),
            ),
            Expanded(
              child: RaisedButton(
                onPressed: () {},
                color: Colors.orangeAccent,
                child: Text('橙色按钮'),
              ),
            ),
            RaisedButton(
              onPressed: () {},
              color: Colors.pinkAccent,
              child: Text('粉色按钮'),
            ),
          ],
        ),
      ),
    );
  }
}
