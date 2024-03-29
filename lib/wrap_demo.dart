import 'package:flutter/material.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData.light(),
      home: WrapDemo(),
    );
  }
}

class WrapDemo extends StatefulWidget {
  @override
  _WrapDemoState createState() => _WrapDemoState();
}

class _WrapDemoState extends State<WrapDemo> {

  List<Widget> list; //声明一个list数组

  @override
  //初始化状态，给list添加值，此时调用了一个自定义方法buildAddButteon
  void initState() {
    super.initState();
    list = List<Widget>()..add(buildAddButteon());
  }

  @override
  Widget build(BuildContext context) {
    //得到屏幕的高度和宽度，用来设置container的宽和高
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: Text('Wrap 流式布局'),
      ),
      body: Center(
        child: Opacity(
          opacity: 0.8,
          child: Container(
            width: width,
            height: height / 2,
            color: Colors.grey,
            child: Wrap( //流式布局
              children: list,
              spacing: 26.0, //设置间距
            ),
          ),
        ),
      ),
    );
  }

  Widget buildAddButteon() {
    //返回一个手势Widget，只是用于显示事件
    return GestureDetector(
      onTap: (){
        if(list.length < 9) {
          setState(() {
            list.insert(list.length -1, buildPhoto());
          });
        }
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          width: 80.0,
          height: 80.0,
          color: Colors.black54,
          child: Icon(Icons.add),
        ),
      ),
    );
  }

  Widget buildPhoto(){
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: 80.0,
        height: 80.0,
        color: Colors.amber,
        child: Center(
          child: Text('照片')
        ),
      ),
    );
  }
}



