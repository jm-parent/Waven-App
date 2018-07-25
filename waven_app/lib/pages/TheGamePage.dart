import 'package:flutter/material.dart';
import 'package:waven_app/widgets/FixedAppBar.dart';
import 'package:waven_app/widgets/FlexibleAppBar.dart';

class TheGamePage extends StatefulWidget {
  @override
  TheGamePageState createState() => new TheGamePageState();
}

class TheGamePageState extends State<TheGamePage> {
  ScrollController _scrollViewController;

  @override
  void initState() {
    super.initState();

    _scrollViewController = ScrollController(initialScrollOffset: 0.0);
  }

  @override
  Widget build(BuildContext context) {
    return NestedScrollView(
      controller: _scrollViewController,
      headerSliverBuilder: (BuildContext context, bool boxIsScrolled) {
        return <Widget>[
          new SliverAppBar(
            expandedHeight: 200.0,
            title: Text("Le Jeu",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                )),
            forceElevated: boxIsScrolled,
            floating: true,
            pinned: true,
            flexibleSpace: new FlexibleSpaceBar(
              centerTitle: true,
              background:
                new Image.asset('images/background_the_game.jpg'),
            ),
          ),
        ];
      },
      body:new Material(
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: <Widget>[
                      new Text("ligne atq"),
                      new Text("ligne pv"),
                      new Text("ligne pm"),
                    ],
                  ),
                )
              ],
            ),
            Row(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: <Widget>[
                      new Text("ligne Adjacent"),
                      new Text("ligne Autour"),
                      new Text("ligne Compagnon"),
                      new Text("ligne Héros"),
                      new Text("ligne PA"),
                      new Text("ligne PE"),
                      new Text("ligne Mécanisme"),
                      new Text("ligne Réserve"),
                    ],
                  ),
                ),
                Column(
                  children: <Widget>[
                    new Text("ligne AR"),
                    new Text("ligne Blindage"),
                    new Text("ligne Assomer"),
                    new Text("ligne Charge"),
                    new Text("ligne Rembobinage"),
                    new Text("ligne Mouillé"),
                    new Text("ligne Boueux"),
                    new Text("ligne Huilé"),
                    new Text("ligne Eventé"),
                  ],
                ),
              ],
            )
          ],
        ),
      ),
      );



  }
}
