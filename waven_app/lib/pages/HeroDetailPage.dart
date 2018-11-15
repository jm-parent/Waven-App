import 'dart:async';

import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';
import 'package:waven_app/models/HeroModelV2.dart';
import 'package:waven_app/models/HeroSpellModelV2.dart';
import 'package:waven_app/pages/HeroDetailStatDescBlock.dart';
import 'package:waven_app/util/HeroSpellsHelper.dart';
import 'package:waven_app/widgets/GridLoreItem.dart';
import 'package:waven_app/widgets/HeroDetailStatRoleTile.dart';
import 'package:waven_app/widgets/HeroDetailStatStatsBlock.dart';

class HeroDetailPage extends StatefulWidget {
  final HeroClassV2 hero;

  HeroDetailPage(this.hero);

  @override
  HeroDetailPageState createState() {
    return new HeroDetailPageState(hero);
  }
}

class HeroDetailPageState extends State<HeroDetailPage>
    with SingleTickerProviderStateMixin {
  final HeroClassV2 hero;

  HeroDetailPageState(this.hero);

  TabController _tabController;

  ScrollController _scrollViewController;

  HeroSpellV2List spellsData;
  int spellDatasItemsCount;

  Future<HeroSpellV2List> _getHeroSpellData() async {
    spellsData = await HeroSpellsV2Helper.loadSpellsByGodId(hero.godid);
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
                Tab(text: "Généralités"),
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
    var godId = hero.godid;
    if (hero == null) return _loadingView;
    return Stack(children: <Widget>[
      Container(
//          decoration: new BoxDecoration(
//        image: new DecorationImage(
//          image:
//              new Image.asset("images/background_logo/logo_$godId.png").image,
//          fit: BoxFit.contain,
//        ),
//      )
      ),
      new ListView(
        children: <Widget>[
          Divider(),
          HeroDetailStatDescBlock(heroData: hero),
          Divider(),
          HeroDetailStatRoleBlock(heroData: hero),
          Divider(),
          HeroDetailStatStatsBlock(heroData: hero),
          Divider(),
        ],
      )
    ]);
  }

  //Grid d'histoire "infini" TODO CREER GRID ITEM
  Widget get _heroDetailLoreRow {
    final Orientation orientation = MediaQuery.of(context).orientation;
    return new GridView.builder(
        itemCount: 4,
        gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: (orientation == Orientation.portrait) ? 1 : 1),
        itemBuilder: (context, index) {
          return GridLoreItem(
              heroData: hero,
              loreStr: " lore act " + index.toString(),
              loreTitle: "Title ${index.toString()}",
              imgUrl: hero.background);
        });
  }

  Widget get _heroDetailSpellsRow {
    final Orientation orientation = MediaQuery.of(context).orientation;
    if (spellsData == null) return _loadingView;
    return new GridView.builder(
        itemCount: spellDatasItemsCount,
        gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: (orientation == Orientation.portrait) ? 4 : 3),
        itemBuilder: (context, index) {
          return Material(
            child: Card(
              child: new GridTile(
                  footer: new Center(
                      child: new Text(spellsData.spells[index].spellname)),
                  child: spellsData.spells[index].spellicon == "NULL"
                      ? new FadeInImage.memoryNetwork(
                          placeholder: kTransparentImage,
                          image: hero.img,
                        )
                      : new FadeInImage.memoryNetwork(
                          placeholder: kTransparentImage,
                          image: spellsData.spells[index].spellicon,
                        )),
            ),
          );
        });
  }
}

Widget get _loadingView {
  return new Center(
    child: new CircularProgressIndicator(),
  );
}
