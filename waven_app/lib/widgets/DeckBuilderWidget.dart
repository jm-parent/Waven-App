import 'package:flutter/material.dart';


class DeckBuilderWidget extends StatefulWidget {
  @override
  _DeckBuilderWidgetState createState() => _DeckBuilderWidgetState();
}

class _DeckBuilderWidgetState extends State<DeckBuilderWidget>{



  @override
  Widget build(BuildContext context) {
   
    return Card(
      margin: EdgeInsets.all(5.0),
      color: Colors.teal,
      child: Column(
        children: <Widget>[
          Row(),
          Row(),
        ],
      ),
      
      
    );
    
    
  }


}