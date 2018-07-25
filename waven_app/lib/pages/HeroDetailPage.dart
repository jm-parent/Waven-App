import 'dart:async';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:transparent_image/transparent_image.dart';
import 'dart:ui' as ui;
import 'package:waven_app/models/HeroModel.dart';

import 'dart:math' as math;
import 'package:percent_indicator/percent_indicator.dart';
import 'package:waven_app/models/HeroSpellModel.dart';
import 'package:waven_app/util/HeroSpellsHelper.dart';


class HeroDetailPage extends StatefulWidget {
  final HeroClass hero;

  HeroDetailPage(this.hero);

  @override
  HeroDetailPageState createState() {
    return new HeroDetailPageState(hero);
  }
}

class HeroDetailPageState extends State<HeroDetailPage>
    with SingleTickerProviderStateMixin {
  final HeroClass hero;

  HeroDetailPageState(this.hero);

  TabController _tabController;

  ScrollController _scrollViewController;

  HeroSpellList spellsData;
  int spellDatasItemsCount;

  Future<HeroSpellList> _getHeroSpellData() async {
    spellsData = await HeroSpellsHelper.loadSpellsByGodId(hero.godId);
    this.setState(() {
      spellDatasItemsCount = spellsData.spells.length;
    });
    return spellsData;
  }

  @override
  void initState() {
    this._getHeroSpellData();
    super.initState();
    _tabController = new TabController(length: 6, vsync: this);
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
            title: Text(hero.heroName,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                )),
            forceElevated: boxIsScrolled,
            floating: true,
            pinned: true,
            flexibleSpace: new FlexibleSpaceBar(
              centerTitle: true,
              background: new Stack(
                fit: StackFit.expand,
                children: <Widget>[
                  new Hero(
                    tag: hero.tag,
                    child: new Image.network(
                      hero.background,
                      fit: BoxFit.scaleDown,
                    ),
                  )
                ],
              ),
            ),
            bottom: TabBar(
                  isScrollable: true,
                  tabs: <Widget>[
                    Tab(
                      text :"Généralités"
                      ),
                    Tab(
                      text: "Builds",
                    ),
                    Tab(
                      text: "Arme Shushu",
                    ),
                    Tab(
                      text: "Sorts",
                    ),
                    Tab(
                      text: "Histoire",
                    ),
                    Tab(
                      text: "Skins",
                    ),
                  ],
                  controller: _tabController,
                ),
          ),
        ];
      },
      body: Material(
        child: TabBarView(
          children: <Widget>[
            _heroDetailStatRow,
            Center(
              child: new Text("Page 2",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15.0,
                  )),
            ),

            Center(
              child: new Text("Page 3",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15.0,
                  )),
            ),
            _heroDetailSpellsRow,
            _heroDetailLoreRow,
            Center(
              child: new Text("Page 6",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15.0,
                  )),
            ),
          ],
          controller: _tabController,
        ),
      ),
    );
  }
var r = 0;
  // Ligne de Stat
  var attackMax = 12;

  Widget get _heroDetailStatRow {
    final ThemeData theme = Theme.of(context);

    int animationTimeInMs = 1500;

    return new Container(

        child: new Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: new Container(
          child: null,
      decoration: new BoxDecoration (
            borderRadius: new BorderRadius.all(new Radius.circular(10.0)),
            color: Colors.black
      ),
    ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: new LinearPercentIndicator(
            leading: Padding(
              padding: const EdgeInsets.fromLTRB(0.0,0.0,30.0,0.0),
              child:
              Row(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: new Icon(FontAwesomeIcons.heart),
                  ),
                  new Text("Point de vie : " + hero.hp.toString() ),
                ],
              ),
            ),
            animation: true,
            animationDuration: animationTimeInMs,
            width: 200.0,
            lineHeight: 10.0,
            percent: hero.hp/100,
            progressColor: Colors.red,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: new LinearPercentIndicator(
            leading: Padding(
              padding: const EdgeInsets.fromLTRB(0.0,0.0,30.0,0.0),
              child:   Row(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: new Icon(FontAwesomeIcons.dumbbell),
                  ),
                  new Text("Attaque : "+ hero.attack.toString() ),
                ],
              ),
            ),
            animation: true,
            animationDuration: animationTimeInMs,
            width: 200.0,
            lineHeight: 10.0,
            percent: hero.attack/10,
            progressColor: Colors.orange,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: new LinearPercentIndicator(
            leading: Padding(
              padding: const EdgeInsets.fromLTRB(0.0,0.0,30.0,0.0),
              child:   Row(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: new Icon(FontAwesomeIcons.binoculars),
                  ),
                  new Text("Portée : "+ hero.range.toString()),
                ],
              ),
            ),
            animation: true,
            animationDuration: animationTimeInMs,
            width: 200.0,
            lineHeight: 10.0,
            percent: hero.range/10,
            progressColor: Colors.green,
          ),
        ),
          ],
        )
    );
  }

  Widget get _heroDetailLoreRow {
    return Material(
      child: Center(
        child: new Container(
            child: new Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: new Text("Histoire",
                    style: new TextStyle(
                      color: Colors.orange,
                      fontSize: 18.0,
                      fontFamily:"Rock Salt"
                    )
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: new RichText(
                    text: new TextSpan(
                      text: hero.lores == null ? "Histoire Vide" : hero.lores,
                    ),
                  ),
                ),
              ],
            )
        ),
      ),
    );
  }

  Widget get _heroDetailSpellsRow{
    final Orientation orientation = MediaQuery
        .of(context)
        .orientation;
    if (spellsData == null) return _loadingView;
    return new GridView.builder
      (
        itemCount: spellDatasItemsCount,
        gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: (orientation == Orientation.portrait) ? 4 : 3),
        itemBuilder: (context, index) {
          return Material(
            child: Card(
              child: new GridTile(
                  footer: new Center(
                      child: new Text(spellsData.spells[index].name)),

                  child: new FadeInImage.memoryNetwork(
                    placeholder: kTransparentImage,
                    image: spellsData.spells[index].img,
                  )
              ),
            ),
          );
        }
    );
  }
}

Widget get _loadingView {
  return new Center(
    child: new CircularProgressIndicator(),
  );

}

