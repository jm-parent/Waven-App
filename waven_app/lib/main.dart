import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:waven_app/AppUi/FluidNavBar/FluidNavBarPage.dart';
import 'package:waven_app/SplashscreenPage.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    runApp(new MyApp());
  });
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      theme: new ThemeData(
        brightness: Brightness.dark,
      ),
      debugShowCheckedModeBanner: false,
      home: new SplashScreenPage(),
      routes: <String, WidgetBuilder>{
        '/Mainhome': (BuildContext context) => new FluidNavBarPage(),
      },
    );
  }
}
