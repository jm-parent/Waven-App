
import 'package:flutter/material.dart';
import 'package:waven_app/models/SpellMakerModel.dart';

class CustomSpellEffectsPage extends StatefulWidget {
  const CustomSpellEffectsPage({Key key, this.spellModel}) : super(key: key);

  final SpellMakerModel spellModel;
  @override
  _CustomSpellEffectsPageState createState() => new _CustomSpellEffectsPageState();
}

class _CustomSpellEffectsPageState  extends State<CustomSpellEffectsPage> {
  SpellMakerModel spellModel;

  _CustomSpellEffectsPageState({this.spellModel});

  @override
  Widget build(BuildContext context) {

   return new Scaffold(
    body: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
    mainAxisAlignment: MainAxisAlignment.center,
    children: <Widget>[
      new Text('Page Effect :$spellModel'),
      ],
    ),
    );
  }


}