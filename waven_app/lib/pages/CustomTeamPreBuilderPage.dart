


import 'package:flutter/material.dart';
import 'package:waven_app/pages/CustomTeamBuilderPage.dart';

class CustomTeamPreBuilderPage extends StatefulWidget {
  @override
  CustomTeamPreBuilderPageState createState() => new CustomTeamPreBuilderPageState();
}

class CustomTeamPreBuilderPageState extends State<CustomTeamPreBuilderPage> {

  var contextClass;

  @override
  Widget build(BuildContext context) {
    contextClass = context;
    return buildSubmitButton();
  }


  buildSubmitButton() {
    const double rad = 40.0;
    return Column(
      children: <Widget>[
        Text("Bienvenue dans le Waven Team Maker",style:  Theme.of(contextClass).textTheme.headline.copyWith(
            color: Colors.white70),),
        Card(
            margin: EdgeInsets.all(40.0),
            child: FlatButton(onPressed: _onTileClicked, child: Text('I\'m Ready'))
        ),
      ],
    );
  }


  _onTileClicked() {
    Navigator.push(contextClass, new MaterialPageRoute(builder: (context) {
      return new CustomTeamBuilderPage();
    }));
  }
}