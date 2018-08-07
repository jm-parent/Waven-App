import 'package:flutter/material.dart';


class DeckBuilderTopBarStatWidget extends StatefulWidget {
  @override
  _DeckBuilderTopBarStatWidgetState createState() => _DeckBuilderTopBarStatWidgetState();
}

class _DeckBuilderTopBarStatWidgetState extends State<DeckBuilderTopBarStatWidget>{

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black87,
      child: Row(
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                children: <Widget>[
                  Expanded(
                    flex: 1,
                    child: Text("Attaque"),
                  ),
                  Expanded(
                    flex: 1,
                    child: Text("PDV"),
                  ),
                  Expanded(
                    flex: 1,
                    child: Text("PM"),
                  ),
                ],
              )
            ],
          ),
          Column(crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            RaisedButton(
              child: Text("Enregistrer le build"),
              onPressed: ()=> SnackBar(content: Text('Deck Enregitré'),),
            )
          ],)

        ],
      ),
    );
  }
}