import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';
import 'package:waven_app/models/HeroModelV2.dart';
import 'package:waven_app/models/HeroSpellModelV2.dart';
import 'package:waven_app/pages/HeroDetailStatDescBlock.dart';
import 'package:waven_app/util/HeroSpellsHelper.dart';
import 'package:waven_app/util/ThemeHelper.dart';
import 'package:waven_app/widgets/GridLoreItem.dart';
import 'package:waven_app/widgets/HeroDetailStatRoleTile.dart';
import 'package:waven_app/widgets/HeroDetailStatStatsBlock.dart';

class DeckListPage extends StatefulWidget {
  DeckListPage();

  @override
  DeckListPageState createState() {
    return new DeckListPageState();
  }
}

class DeckListPageState extends State<DeckListPage>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return new ListView.builder(
        itemCount: 20,
        itemBuilder: (BuildContext context, int index) {
          return Card(
            elevation: 6.0,
            child: Container(
              decoration: ImageDecoration("images/Backgrounds/fond-characters.jpg",BoxFit.fitWidth),
              child: new Row(
                children: <Widget>[
                  leftSection,
                  middleSection,
                  rightSection
                ],
              ),
            ),
          );

  });

  }


  final leftSection = new Container(
    child: Image.asset("images/HeroPortraits/Iop-Bouvalier-Female-CC.png",fit: BoxFit.contain,height: 80.0,)
  );

  final middleSection = new Expanded(
    child: new Container(
      padding: new EdgeInsets.only(left: 8.0),
      child: new Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          new Text("Nom du deck",
            style: new TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w600,
              fontSize: 16.0,
            ),),
          new Text("Description du deck", style:
          new TextStyle(color: Colors.grey),),
        ],
      ),
    ),
  );

  final rightSection = new Container(

    child: new Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        new Text("Nom du Créateur",
          style: new TextStyle(
              color: Colors.grey,
              fontSize: 12.0),),
        Row(
          children: <Widget>[
            new Text("10/11/2018",
              style: new TextStyle(
                  color: Colors.lightGreen,
                  fontSize: 12.0),),
            Padding(
              padding: const EdgeInsets.only(left: 4.0),
              child: new CircleAvatar(
                  backgroundColor: Colors.green,
                  radius: 4.0,
                  child:Container()),
            )
          ],

        ),

      ],
    ),
  );
}
