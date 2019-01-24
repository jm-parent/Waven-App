import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:giffy_dialog/giffy_dialog.dart';
import 'package:waven_app/AppUi/DeckBuilderSection/TestWidgets/GiffyDialog.dart';


class DeckBuilderListPage extends StatefulWidget {
  @override
  _DeckBuilderListPageState createState() => _DeckBuilderListPageState();
}

class _DeckBuilderListPageState extends State<DeckBuilderListPage> {
  bool _dialVisible = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[ IconButton(icon: Icon(Icons.add_circle_outline),
          onPressed: _OpenDialogNewDeck,
        ),],
        centerTitle: true,
        title: Text(
          "Deck builder",
          style: Theme.of(context).textTheme.title,
        ),
      ),
      body: _buildDeckList(),
    );
  }

  _buildDeckList() {
    return ListView.builder(
        shrinkWrap: true,
        itemCount: 12,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              height: 100,
              width: MediaQuery.of(context).size.width,
              child: Container(
                color: Colors.lightBlue,
              ),
            ),
          );
        });
  }



  _OpenDialogNewDeck() {
    showDialog(
      context: context,builder: (_) =>GiffyDialog(

        imageUrl:'https://imgur.com/vF0VgLK.gif',
        title: Text('Create a new Deck ?',
          textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: 22.0,
              fontWeight: FontWeight.w600)),

      onOkButtonPressed: () {},
      ),
    );
  }
}
