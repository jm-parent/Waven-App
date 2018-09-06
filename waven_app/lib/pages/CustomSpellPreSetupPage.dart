import 'package:flutter/material.dart';
import 'package:waven_app/pages/CustomSpellPage.dart';

class CustomSpellPreSetupPage extends StatelessWidget {

  var contextClass;

  @override
  Widget build(BuildContext context) {
    contextClass = context;
    return buildSubmitButton();
  }


  buildSubmitButton() {
    const double rad = 40.0;
    return Center(
      child: Card(
        margin: EdgeInsets.all(8.0),
        child: new GridTile(
          header: Center(
            child: Text("Bienvenue dans le Waven Spell Maker",style:  Theme.of(contextClass).textTheme.headline.copyWith(
                color: Colors.white70),),
          ),
          child: Center(
            child: new InkResponse(
              onTap: () => _onTileClicked(),
              child:  new Text('I\'m Ready'),
                ),
          ),
            ),
          ),
        );
  }


  _onTileClicked() {
    Navigator.push(contextClass, new MaterialPageRoute(builder: (context) {
      return new CustomSpellPage(initialSpellCost: 0,);
    }));
  }
}
