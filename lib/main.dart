import 'package:flutter/material.dart';
import 'package:marx/screens/splashScreen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      color: Colors.white,
      title: 'MarX',
      home: SplashScreen(),
      theme: ThemeData(
        primaryColor: Colors.lightBlue[800],
        accentColor: Colors.lightBlue[800],
        fontFamily: 'Raleway',
      ),
    );
  }
}