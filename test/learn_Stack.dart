import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var stack = Stack(
      alignment: const FractionalOffset(0.5, 0.8),
      children: <Widget>[
        CircleAvatar(
          backgroundImage: NetworkImage('http://blogimages.jspang.com/blogtouxiang1.jpg'),
          radius: 100.0,
        ),
        Positioned(
          top: 10.0,
          left: 10.0,
          child: Text('JSPang.com'),
        ),
        Positioned(
          bottom: 10.0,
          right: 10.0,
          child: Text('技术胖'),
        )
      ],
    );

    return MaterialApp(
      title: 'Stack widget',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Stack demo (层叠布局）'),
        ),
        body: Center(
          child: stack,
        ),
      ),
    );
  }
}
