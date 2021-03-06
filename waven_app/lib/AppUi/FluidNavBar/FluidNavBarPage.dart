import 'package:flutter/material.dart';
import 'package:waven_app/AppUi/AboutSection/AboutPage.dart';
import 'package:waven_app/AppUi/DashboardSection/DashboardPage.dart';
import 'package:waven_app/AppUi/FluidNavBar/FluidNavBar.dart';
import 'package:waven_app/AppUi/GameDataSection/GameDataPage.dart';
import 'package:waven_app/AppUi/NewsSection/NewsAnimatedContainer.dart';
import 'package:waven_app/AppUi/WavenToolsPage/WavenToolsPage.dart';

class FluidNavBarPage extends StatefulWidget {
  @override
  _FluidNavBarPageState createState() => _FluidNavBarPageState();
}

class _FluidNavBarPageState extends State<FluidNavBarPage> {
  int indexPage = 2;
  @override
  Widget build(BuildContext context) {
    return Scaffold(

        body: Stack(children: <Widget>[
          _children[indexPage],
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              FluidNavBar(_callbackIndex),
            ],
          ),
        ])
    );
  }
  final List<Widget> _children = [
    NewsAnimatedContainer(),
    GameDataPage(),
    DashboardPage(),
    WavenToolsPage(),
    AboutPage(),
  ];

  _callbackIndex(selectedIndex) {
    setState(() {
      indexPage = selectedIndex;
    });
  }
}
