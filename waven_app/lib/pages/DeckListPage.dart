import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';
import 'package:waven_app/CustomContainers/ParallelogramContainer.dart';
import 'package:waven_app/models/HeroModelV2.dart';
import 'package:waven_app/models/HeroSpellModelV2.dart';
import 'package:waven_app/pages/HeroDetailStatDescBlock.dart';
import 'package:waven_app/util/HeroSpellsHelper.dart';
import 'package:waven_app/util/ThemeHelper.dart';
import 'package:waven_app/util/widget_utils.dart';
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
    return Container(
      color: Color.fromRGBO(30,55,83,1.0),
      child: new ListView.builder(
          shrinkWrap: true,
          itemCount: 20,
          itemBuilder: (BuildContext context, int index) {
            return  Padding(
              padding: EdgeInsets.all(ScreenAwareHelper.screenAwareSize(8.0, context)),
              child: ParallelogramContainer(  new Row(
                children: <Widget>[
                  leftSection,
                  buildMiddleSection(context),
                  Padding(
                    padding: const EdgeInsets.only(left:8.0),
                    child: rightSection,
                  )
                ],
              ),
                ),
            );
          }),
    );
  }

  final leftSection =

 Image.asset(
        "images/HeroPortraits/Iop-Bouvalier-Female-CC.png",
        fit: BoxFit.contain,
        height: 80.0,
      );

  final rightSection = new Container(
    child: Padding(
      padding: const EdgeInsets.only(right: 8.0),
      child: new Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          new Text(
            "Nom du Créateur",
            style: new TextStyle(color: Colors.grey, fontSize: 12.0),
          ),
          Row(
            children: <Widget>[
              new Text(
                "10/11/2018",
                style: new TextStyle(color: Colors.lightGreen, fontSize: 12.0),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 4.0),
                child: new CircleAvatar(
                    backgroundColor: Colors.green,
                    radius: 4.0,
                    child: Container()),
              )
            ],
          ),
        ],
      ),
    ),
  );

  buildMiddleSection(BuildContext context) {
    return new Expanded(
      child: Padding(
        padding: EdgeInsets.only(left:ScreenAwareHelper.screenAwareSize(15.0, context)),
        child: Transform(
          transform: Matrix4.skewX(-0.15),
          child: new Container(
            decoration: new BoxDecoration(
                border: new Border(
                    left: new BorderSide(width: 1.0, color: Colors.white24))),
            child: Padding(
              padding: EdgeInsets.only(left:ScreenAwareHelper.screenAwareSize(5.0, context)),
              child: new Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  new Text(
                    "Deck Op Go Nerf",
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: new TextStyle(
                      color: Colors.grey[400],
                      fontWeight: FontWeight.w600,
                      fontSize: 16.0,
                    ),
                  ),
                  new Text(
                    "Curabitur vehicula eleifend tortor, ac faucibus diam ultricies ut. Sed quis dolor tempor, egestas enim at, eleifend justo. Curabitur at enim id orci ultricies sollicitudin.",
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                    style: new TextStyle(color: Colors.grey,fontSize: 12.0),
                  ),
                  Row(
                    children: <Widget>[
                      Icon(Icons.linear_scale, color: Colors.yellowAccent),
                      Text(" Intermediate", style: TextStyle(color: Colors.white))
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
