import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData.light(),
      home: ToolTipDemo(),
    );
  }
}

class ToolTipDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('tool tips demo'),),
      body: Center(
        child: Tooltip(
          message:'Do not touch me, thanks. ',
          child: Icon(Icons.all_inclusive)
        ),
      ),
    );
  }
}

