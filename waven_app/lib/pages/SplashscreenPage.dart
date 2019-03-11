import 'package:flutter/material.dart';
import 'dart:async';

import 'package:waven_app/AppUi/ColorsHelper.dart';
import 'package:waven_app/util/widget_utils.dart';

class SplashScreenPage extends StatefulWidget {
  @override
  _SplashScreenState createState() => new _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreenPage> {
  startTime() async {
    var _duration = new Duration(seconds: 2);
    return new Timer(_duration, navigationPage);
  }

  void navigationPage() {
    Navigator.of(context).pushReplacementNamed('/Mainhome');
  }

  @override
  void initState() {
    super.initState();
    startTime();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: mainDarkBlue(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 80),
        child: new Center(
          child: new Image.asset('images/Waven_Companion.png'),
        ),
      ),
    );
  }
}