import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'flutter demo',
      theme: ThemeData.dark(),
      home: ExpansionPanelListDemo(),
    );
  }
}

class ExpansionPanelListDemo extends StatefulWidget {
  @override
  _ExpansionPanelListDemoState createState() => _ExpansionPanelListDemoState();
}

class _ExpansionPanelListDemoState extends State<ExpansionPanelListDemo> {
  int currentPanelIndex = -1;
  List<int> mList; // 组成一个int类型数组，用来控制索引
  List<ExpandStateBean> expandStateList; // 展开的状态列表

  // 构造方法，调用这个类的时候自动执行
  _ExpansionPanelListDemoState() {
    mList = List();
    expandStateList = List();
    // 遍历为以上两个list赋值
    for (int i = 0; i < 10; i++) {
      mList.add(i);
      expandStateList.add(ExpandStateBean(i, false));
    }
  }

  //修改展开与闭合的内部方法
  _setCurrentIndex(int index, bool isExpand) {
    setState(() {
      // 遍历可展开状态列表
      expandStateList.forEach((item) {
        if (item.index == index) {
          //该项被点击，状态取反
          item.isOpen = !isExpand;
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('expansion panel list'),
      ),
      //加入可滚动组件
      body: SingleChildScrollView(
        child: ExpansionPanelList(
          //回调函数
          expansionCallback: (index, bol) {
            //调用内部方法
            _setCurrentIndex(index, bol);
          },
          children: mList.map((index) {
            //map操作，然后用toLIst再次组成List
            return ExpansionPanel(
                headerBuilder: (context, isExpanded) {
                  return ListTile(
                    title: Text('This is No. $index'),
                  );
                },
                body: ListTile(
                  title: Text('expansion no. $index'),
                ),
                isExpanded: expandStateList[index].isOpen);
          }).toList(),
        ),
      ),
    );
  }
}

//自定义扩展状态类
class ExpandStateBean {
  bool isOpen;
  int index;

  ExpandStateBean(this.index, this.isOpen);
}
