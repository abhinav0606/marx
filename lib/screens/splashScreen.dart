import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:marx/main.dart';
import 'package:marx/screens/dashboard.dart';

class SplashScreen extends StatefulWidget {
  SplashScreen({Key key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  AnimationController _animationController;
  Animation _logoAnimation;
  Timer _timer;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
    );
    _logoAnimation = Tween<double>(begin: 70, end: 120).animate(CurvedAnimation(
      curve: Interval(0.0, 1, curve: Curves.easeInOut),
      parent: _animationController,
    ));

    _logoAnimation.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        setState(() {});
      }
    });
    _animationController.forward();
    startTimer();
  }

  void startTimer() {
    const oneSec = const Duration(seconds: 6);
    _timer = new Timer.periodic(
        oneSec,
            (Timer timer) => Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) {
              return Dashboard();
            },
          ),
        ));
  }

  @override
  void dispose() {
    super.dispose();
    _animationController.dispose();
    _timer.cancel();
  }

  @override
  Widget build(BuildContext context) {
    final _height = MediaQuery.of(context).size.height;
    final _width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Center(
            child: Opacity(
              opacity: 0.5,
              child: Image.asset(
                'assets/grey_background.jpg',
                width: _width,
                height: _height,
                fit: BoxFit.fill,
              ),
            ),
          ),
          Center(
            child: SizedBox(
              width: _width,
              height: _height,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(top: _height * 0.2),
                      child: AnimatedBuilder(
                        animation: _logoAnimation,
                        builder: (context, child) {
                          return Container(
                            height: _logoAnimation.value,
                            width: _logoAnimation.value,
                            child:
                            Image.asset("assets/icons8-martian-64.png"),
                          );
                        },
                      ),
                    ),
                    Opacity(
                      opacity: _animationController == null ||
                          _animationController.value != 1
                          ? 0.0
                          : 1.0,
                      child: Column(
                        children: <Widget>[
                          Text(
                            "MarX",
                            style: Theme.of(context)
                                .textTheme
                                .title
                                .copyWith(color: Colors.black),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                        ],
                      ),
                    ),
                  ]),
            ),
          ),
        ],
      ),
    );
  }
}
