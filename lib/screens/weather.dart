import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class Weather extends StatefulWidget {
  @override
  WeatherState createState() => WeatherState();
}

class WeatherState extends State<Weather> {
  final String date = '22:03 pm - Tuesday, 4 February 20';
  final bg = 'assets/clearday.png';
  final String iconc = 'assets/clearsky.png';

  final desc = "Clear";
  final city = "New York";

  final int humidity = 92;
  final int pressure = 162;
  final int temp = 19;
  final double windspeed = 11;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final dots = Hero(
      tag: 'hero1',
      child: Image.asset('assets/dots.png', scale: 3),
    );

    final icon = Hero(
      tag: 'hero2',
      child: Image.asset(iconc, scale: 4),
    );

    final menu = Hero(
      tag: 'hero3',
      child: Image.asset('assets/menu.png', scale: 3.7),
    );

    final line = Hero(
      tag: 'hero4',
      child: Image.asset('assets/line.png', scale: 3.7),
    );

    final wind = LinearProgressIndicator(
      backgroundColor: Colors.white24,
      value: 11/100,
    );
    final pressurec = LinearProgressIndicator(
      backgroundColor: Colors.white24,
      value: 162/500,
    );
    final humidityc = LinearProgressIndicator(
      backgroundColor: Colors.white24,
      value: 92/100,
    );

    return new Material(
      type: MaterialType.transparency,
      child: Stack(
        children: <Widget>[
          new Container(
            decoration: new BoxDecoration(
              image: new DecorationImage(
                image: new AssetImage(bg),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SingleChildScrollView(
            child: Container(
              margin: EdgeInsets.all(0),
              child: Padding(
                padding: const EdgeInsets.all(30.0),
                child: Column(
                  children: <Widget>[
                    SizedBox(height: 32),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      mainAxisSize: MainAxisSize.max,
                      children: <Widget>[
                        menu,
                        SizedBox(width: 20),
                      ],
                    ),
                    SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      mainAxisSize: MainAxisSize.max,
                      children: <Widget>[
                        dots,
                      ],
                    ),
                    SizedBox(height: 30),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Column(children: <Widget>[
                          Text(
                            city,
                            style: TextStyle(
                              fontSize: 34,
                              color: Colors.white,
                            ),
                          ),
                        ]),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      mainAxisSize: MainAxisSize.max,
                      children: <Widget>[
                        Column(
                          children: <Widget>[
                            SizedBox(height: 9),
                            Text(date,
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.white,
                                )),
                          ],
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      mainAxisSize: MainAxisSize.max,
                      children: <Widget>[
                        Column(
                          children: <Widget>[
                            SizedBox(height: 68),
                            Text(temp.toString() + "º",
                                style: TextStyle(
                                  fontSize: 72,
                                  color: Colors.white,
                                ))
                          ],
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      mainAxisSize: MainAxisSize.max,
                      children: <Widget>[
                        SizedBox(width: 10),
                        icon,
                        SizedBox(width: 9),
                        Text(desc,
                            style: TextStyle(
                              fontSize: 19,
                              color: Colors.white,
                            )),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      mainAxisSize: MainAxisSize.max,
                      children: <Widget>[
                        Column(
                          children: <Widget>[
                            SizedBox(height: 154),
                            line,
                            SizedBox(height: 20),
                            Row(
                              children: <Widget>[
                                Container(
                                  margin: const EdgeInsets.all(8.0),
                                  child: Column(
                                    children: <Widget>[
                                      Text("Wind",
                                          style: TextStyle(
                                            fontSize: 14,
                                            color: Colors.white,
                                          )),
                                      SizedBox(height: 12),
                                      Text(windspeed.toString(),
                                          style: TextStyle(
                                            fontSize: 22,
                                            color: Colors.white,
                                          )),
                                      SizedBox(height: 10),
                                      Text("km/h",
                                          style: TextStyle(
                                            fontSize: 12,
                                            color: Colors.white,
                                          )),
                                      SizedBox(height: 7),
                                      SizedBox(
                                        height: 2,
                                        width: 80,
                                        child: wind,
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  margin: const EdgeInsets.all(8.0),
                                  child: Column(
                                    children: <Widget>[
                                      Text("Pressure",
                                          style: TextStyle(
                                            fontSize: 14,
                                            color: Colors.white,
                                          )),
                                      SizedBox(height: 12),
                                      Text(pressure.toString(),
                                          style: TextStyle(
                                            fontSize: 22,
                                            color: Colors.white,
                                          )),
                                      SizedBox(height: 10),
                                      Text("kPa",
                                          style: TextStyle(
                                            fontSize: 12,
                                            color: Colors.white,
                                          )),
                                      SizedBox(height: 7),
                                      SizedBox(
                                        height: 2,
                                        width: 80,
                                        child: pressurec,
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  margin: const EdgeInsets.all(8.0),
                                  child: Column(
                                    children: <Widget>[
                                      Text("Humidity",
                                          style: TextStyle(
                                            fontSize: 14,
                                            color: Colors.white,
                                          )),
                                      SizedBox(height: 12),
                                      Text(humidity.toString(),
                                          style: TextStyle(
                                            fontSize: 22,
                                            color: Colors.white,
                                          )),
                                      SizedBox(height: 10),
                                      Text("%",
                                          style: TextStyle(
                                            fontSize: 12,
                                            color: Colors.white,
                                          )),
                                      SizedBox(height: 7),
                                      SizedBox(
                                        height: 2,
                                        width: 80,
                                        child: humidityc,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
