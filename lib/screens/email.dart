import 'dart:math';

import 'package:flutter/material.dart';

class Email extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            backgroundColor: Colors.white,
            title: Material(
              elevation: 8,
              child: TextFormField(
                decoration: InputDecoration(
                  hintText: "Search Mail",
                  border: InputBorder.none,
                  icon: Container(
                    margin: EdgeInsets.only(left: 10),
                    child: Icon(Icons.dehaze),
                  ),
                  suffixIcon: Container(
                    margin: EdgeInsets.all(5),
                    child: CircleAvatar(
                      backgroundImage: AssetImage("assets/profile.jpg"),
                    ),
                  ),
                ),
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              List.generate(
                20,
                (int i) {
                  return _listItem(i);
                },
              ),
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(
          Icons.add,
          color: Colors.red,
        ),
        backgroundColor: Colors.white,
      ),
    );
  }

  Widget _listItem(int i) {
    return DecoratedBox(
      decoration: BoxDecoration(
          border: Border.all(color: Colors.grey[300], width: 0.5),
          borderRadius: BorderRadius.all(Radius.circular(5))),
      child: ListTile(
        leading: CircleAvatar(
          child: Text(i.toString()),
          backgroundColor: Colors.green[((i + 1) * 100) % 800],
        ),
        title: Column(
          children: <Widget>[
            SizedBox(height: 5),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  "Sender $i",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(
                  "${((0 + i) % 13)}:${(0 + 2 * i) % 60}",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ],
            ),
            Text(
              "This is regarding your attention for subject $i",
              overflow: TextOverflow.ellipsis,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 7),
          ],
        ),
        subtitle: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text("Hello Sir, From sender $i at H.No.${11 * i}"),
            Icon(Icons.star_border)
          ],
        ),
      ),
    );
  }
}
