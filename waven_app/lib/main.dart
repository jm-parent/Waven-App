import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'package:waven_app/pages/AnimatedTabBarPage.dart';
import 'package:waven_app/pages/BottomAppBarPage.dart';
import 'package:waven_app/pages/HomeDrawerPage.dart';
import 'package:waven_app/pages/IntroSlidePage.dart';
import 'package:waven_app/pages/SplashscreenPage.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      theme: new ThemeData(
        brightness: Brightness.dark,
      ),
      home: new SplashScreenPage(),
      routes: <String, WidgetBuilder>{
        '/Mainhome': (BuildContext context) => new Scaffold(body: new HomeDrawerPage()),
        '/IntroSlide': (BuildContext context) => new IntroSliderPage(),
      },
    );
  }
}
