import 'package:flutter/material.dart';
import 'pages/home_screen.dart';
import 'pages/email_screen.dart';
import 'pages/pages_screen.dart';
import 'pages/airplan_screen.dart';

class BottomNavigationWidget extends StatefulWidget {
  @override
  _BottomNavigationWidgetState createState() => _BottomNavigationWidgetState();
}

class _BottomNavigationWidgetState extends State<BottomNavigationWidget> {
  final _BottomNavigationColor = Colors.blue;
  int _currentIndex = 0;
  List<Widget> screenList = List();

  @override
  void initState() {
    screenList
    ..add(HomeScreen())
    ..add(EmailScreen())
    ..add(PagesScreen())
    ..add(AirplayScreen());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: screenList[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              color: _BottomNavigationColor,
            ),
            title: Text(
              'Home',
              style: TextStyle(color: Colors.blue),
            )
          ),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.email,
                color: _BottomNavigationColor,
              ),
              title: Text(
                'Email',
                style: TextStyle(color: Colors.blue),
              )
          ),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.pages,
                color: _BottomNavigationColor,
              ),
              title: Text(
                'Pages',
                style: TextStyle(color: Colors.blue),
              )
          ),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.airplay,
                color: _BottomNavigationColor,
              ),
              title: Text(
                'Airplay',
                style: TextStyle(color: Colors.blue),
              )
          )
        ],
        currentIndex: _currentIndex,
        onTap: (int index){
          setState(() {
            _currentIndex = index;
          });
        },
        type: BottomNavigationBarType.fixed,
      ),
    );
  }
}
