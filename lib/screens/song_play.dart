import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class SongPlay extends StatefulWidget{

  @override
  _SongPlayState createState() => _SongPlayState();
}

class _SongPlayState extends State<SongPlay> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          'Well hello !',
        ),
      ),
    );
  }
}