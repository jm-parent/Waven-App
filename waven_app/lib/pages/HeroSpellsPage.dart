import 'dart:async';

import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';
import 'package:waven_app/models/HeroModel.dart';
import 'package:waven_app/models/HeroSpellModel.dart';
import 'package:waven_app/util/HeroSpellsHelper.dart';

class HeroSpellsPage extends StatefulWidget {
  final HeroClass hero;

  HeroSpellsPage(this.hero);

  @override
  HeroSpellsPageState createState() {
    return new HeroSpellsPageState(hero);
  }
}


class HeroSpellsPageState extends State<HeroSpellsPage> {

  final HeroClass hero;

  HeroSpellsPageState(this.hero);

  HeroSpellList data;
  int spellDatasItemsCount;

  Future<HeroSpellList> _getHeroSpellData() async {
    data = await HeroSpellsHelper.loadSpellsByGodId(hero.godId);
    this.setState(() {
      spellDatasItemsCount = data.spells.length;
    });
    return data;
  }

  @override
  void initState() {
    this._getHeroSpellData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final Orientation orientation = MediaQuery
        .of(context)
        .orientation;
    if (data == null) return _loadingView;
    return new GridView.builder
      (
        itemCount: spellDatasItemsCount,
        gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: (orientation == Orientation.portrait) ? 2 : 3),
        itemBuilder: (context, index) {
          return Material(
            child: new GridTile(
                footer: new Center(
                    child: new Text(data.spells[index].name)),

                child: new FadeInImage.memoryNetwork(
                  placeholder: kTransparentImage,
                  image: data.spells[index].img,
                )
            ),
          );
        }
    );
  }

  Widget get _loadingView {
    return new Center(
      child: new CircularProgressIndicator(),
    );
  }
}