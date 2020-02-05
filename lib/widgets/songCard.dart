import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class SongCard extends StatelessWidget {
  final String image;
  final String title;
  final String length;
  final Function onPress;


  SongCard({this.image, this.title, this.length, this.onPress});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child: Material(
            child: InkWell(
              child: Image.asset(image, height: 125, width: 135, fit: BoxFit.fill,),
              onTap: onPress,
            ),
          ),
        ),
        SizedBox(height: 5),
        Text(title),
        Text(length),
      ],
    );
  }
}