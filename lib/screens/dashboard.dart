import 'package:flutter/material.dart';
import 'package:marx/screens/email.dart';
import 'package:marx/screens/music.dart';
import 'package:marx/screens/weather.dart';

class Dashboard extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: DashboardNav(),
      ),
    );
  }
}

class DashboardNav extends StatefulWidget {
  DashboardNav({Key key}) : super(key: key);

  @override
  _DashboardNavState createState() => _DashboardNavState();
}

class _DashboardNavState extends State<DashboardNav> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle = TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static List<Widget> _widgetOptions = <Widget>[
    Weather(),
    Email(),
    Music(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Color(0xFFCFD8DC),
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.cloud),
            title: Text('Weather'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.mail),
            title: Text('E-mail'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.library_music),
            title: Text('Music'),
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.grey[800],
        onTap: _onItemTapped,
      ),
    );
  }
}