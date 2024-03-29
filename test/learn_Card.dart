import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  var card = Card(
    child: Column(
      children: <Widget>[
        ListTile(
          title: Text(
            '吉林省吉林市昌邑区',
            style: TextStyle(fontWeight: FontWeight.w500),
          ),
          subtitle: Text('技术胖:1513938888'),
          leading: Icon(
            Icons.account_box,
            color: Colors.lightBlue,
          ),
        ),
        Divider(),
        ListTile(
          title: Text(
            '北京市海淀区中国科技大学',
            style: TextStyle(fontWeight: FontWeight.w500),
          ),
          subtitle: Text('胜宏宇:1513938888'),
          leading: Icon(
            Icons.account_box,
            color: Colors.lightBlue,
          ),
        ),
        Divider(),
        ListTile(
          title: Text(
            '河南省濮阳市百姓办公楼',
            style: TextStyle(fontWeight: FontWeight.w500),
          ),
          subtitle: Text('JSPang:1513938888'),
          leading: Icon(
            Icons.account_box,
            color: Colors.lightBlue,
          ),
        ),
      ],
    ),
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Card widget',
      home: Scaffold(
        appBar: AppBar(title: Text('卡片布局'),),
        body: Center(child: card),
      ),
    );
  }
}
