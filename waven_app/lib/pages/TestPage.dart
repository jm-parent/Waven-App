import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:waven_app/models/GodModel.dart';
import 'package:waven_app/models/HeroModel.dart';
import 'package:waven_app/models/HeroModelV2.dart';
import 'package:waven_app/pages/HeroDetailPage.dart';
import 'package:waven_app/util/HeroesHelper.dart';
import 'dart:async';
import 'package:transparent_image/transparent_image.dart';
import 'package:waven_app/util/ThemeHelper.dart';
import 'package:waven_app/widgets/ArrowMenuContainer.dart';
import 'dart:ui' as ui;

import 'package:waven_app/widgets/FixedAppBar.dart';

class TestPage extends StatefulWidget {

  TestPage({Key key}) : super(key: key);


  @override
  TestPageState createState({Key key}) => new TestPageState();
}

class TestPageState extends State<TestPage> {


  int heroDatasItemsCount;
  List<GodModel> godList;


  @override
  void initState() {
    godList = new List<GodModel>();
    godList.add(new GodModel("Cra","images/GodsImages/LevelUpCra.png"));
    godList.add(new GodModel("Ecaflip","images/GodsImages/LevelUpEcaflip.png"));
    godList.add(new GodModel("Eliotrope","images/GodsImages/LevelUpEliotrope.png"));
    godList.add(new GodModel("Eniripsa","images/GodsImages/LevelUpEniripsa.png"));
    godList.add(new GodModel("Enutrof","images/GodsImages/LevelUpEnutrof.png"));
    godList.add(new GodModel("Feca","images/GodsImages/LevelUpFeca.png"));
    godList.add(new GodModel("Huppermage","images/GodsImages/LevelUpHuppermage.png"));
    godList.add(new GodModel("Iop","images/GodsImages/LevelUpIop.png"));
    godList.add(new GodModel("Osamodas","images/GodsImages/LevelUpOsamodas.png"));
    godList.add(new GodModel("Ouginak","images/GodsImages/LevelUpOuginak.png"));
    godList.add(new GodModel("Pandawa","images/GodsImages/LevelUpPandawa.png"));
    godList.add(new GodModel("Roublard","images/GodsImages/LevelUpRoublard.png"));
    godList.add(new GodModel("Sacrieur","images/GodsImages/LevelUpSacrieur.png"));
    godList.add(new GodModel("Sram","images/GodsImages/LevelUpSram.png"));
    godList.add(new GodModel("Steamer","images/GodsImages/LevelUpSteamer.png"));
    godList.add(new GodModel("Xelor","images/GodsImages/LevelUpXelor.png"));
    godList.add(new GodModel("Zobal","images/GodsImages/LevelUpZobal.png"));


        super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return   Material(child: _godsListWidget);
  }

  Widget get _loadingView {
    return new Center(
      child: new CircularProgressIndicator(),
    );
  }


  Widget get _godsListWidget {
    return new Material(
    child: new GridView.extent(
      maxCrossAxisExtent: 180.0,
      children: _buildGodsGridTiles(godList.length),
      // mainAxisSpacing: 10.0,
      // crossAxisSpacing: 10.0,
      // padding: EdgeInsets.all(8.0),
    ));
  }

  List<Widget> _buildGodsGridTiles(numberOfItems) {
    List<Container> containers =
    new List<Container>.generate(numberOfItems, (int index) {
      return Container(
        child: Card(
          child: new GridTile(
            footer: Padding(
              padding: const EdgeInsets.only(bottom: 5.0),
              child: new Center(child: new Text(godList[index].godName)),
            ),
            child: Container(
                child: Image.asset(godList[index].imgUrl,fit:BoxFit.fitHeight )),
            ),
        ),
        );
    });
    return containers;
  }




}
