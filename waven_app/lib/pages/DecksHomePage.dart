import 'package:flutter/material.dart';
import 'package:waven_app/cards/PickAClassCard.dart';
import 'package:waven_app/util/widget_utils.dart' show screenAwareSize;

class DecksHomePage extends StatefulWidget {

  @override
  DecksHomePageState createState() => new DecksHomePageState();
}

class DecksHomePageState extends State<DecksHomePage> {

  //List de Mes Decks : List<WavenDeck> items;
  List<String> items;

  TextEditingController controller = new TextEditingController();
  String filter;


  @override
  void initState() {
    items = new List<String>();
    items.add("Apple");
    items.add("Bananas");
    items.add("Milk");
    items.add("Water");
    controller.addListener(() {
      setState(() {
        filter = controller.text;
      });
    });
    super.initState();
  }

    @override
    void dispose() {
      controller.dispose();
      super.dispose();
    }

  @override
  Widget build(BuildContext context) {
    return new Column(
        children: <Widget>[
          new Padding(
            padding: new EdgeInsets.only(top: 20.0),
          ),
          new TextField(
            decoration: new InputDecoration(
                labelText: "Search something"
            ),
            controller: controller,
          ),
          new Expanded(
            child: new ListView.builder(
              itemCount: items.length,
              itemBuilder: (BuildContext context, int index) {
                return filter == null || filter == "" ? new Card(child: new Text(items[index])) : items[index].toLowerCase().contains(filter.toLowerCase()) ? new Card(child: new Text(items[index])) : new Container();
              },
            ),
          ),
        ],

    );
  }
}
