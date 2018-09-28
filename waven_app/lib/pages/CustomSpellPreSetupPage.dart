import 'package:flutter/material.dart';
import 'package:waven_app/pages/AnimatedSpellMakerPage.dart';
import 'package:waven_app/pages/CustomSpellPage.dart';
import 'package:waven_app/pages/SpellMakerPage.dart';

class CustomSpellPreSetupPage extends StatelessWidget {

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
        Text("Bienvenue dans le Waven Spell Maker",style:  Theme.of(contextClass).textTheme.headline.copyWith(
            color: Colors.white70),),
        Card(
          margin: EdgeInsets.all(40.0),
          child: FlatButton(onPressed: _onTileClicked, child: Text('to spellmaker'))
            ),
        Card(
            margin: EdgeInsets.all(40.0),
            child: FlatButton(onPressed: _onTileDirectClicked, child: Text('to AnimatedMaker'))
        ),
      ],
    );
  }


  _onTileClicked() {
    Navigator.push(contextClass, new MaterialPageRoute(builder: (context) {
      return new SpellMakerPage();
    }));
  }

  _onTileDirectClicked() {
    Navigator.push(contextClass, new MaterialPageRoute(builder: (context) {
      return new AnimatedSpellMakerPage();
    }));
  }
}
