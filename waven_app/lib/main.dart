import 'package:flutter/material.dart';
import 'package:waven_app/pages/HomeDrawerPage.dart';
import 'package:waven_app/pages/SplashscreenPage.dart';
void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      theme: new ThemeData(
        brightness: Brightness.dark,
        primarySwatch: Colors.purple,
        accentColor: Colors.green
      ),
      home: new SplashScreenPage(),
      routes: <String, WidgetBuilder>{
        '/HomeScreen': (BuildContext context) => new HomeDrawerPage()
      },
    );
  }
}
