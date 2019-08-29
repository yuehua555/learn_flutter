import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Text Widget',
      home: Scaffold(
        body: Center(
          child: Container(
            child: Container(
              child: new Text('Hello JSPang', style: TextStyle(fontSize: 40.0)),
              alignment: Alignment.topLeft,
              width: 500.0,
              height: 400.0,
              //color: Colors.lightBlue, 会与decoration属性冲突
              padding: const EdgeInsets.fromLTRB(10.0, 30.0, 0.0, 0.0),
              margin: const EdgeInsets.all(10.0),
              decoration: new BoxDecoration(
                  gradient: const LinearGradient(
                      colors: [Colors.lightBlue, Colors.greenAccent, Colors.purple]
                  ),
                  border: Border.all(width: 2.0, color: Colors.red)
              ),

            ),
          ),
        ),
      ),
    );
  }
}