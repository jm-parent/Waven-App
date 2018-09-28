import 'dart:async';
import 'dart:ui';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';
import 'package:waven_app/models/HeroSpellModelV2.dart';
import 'package:waven_app/util/HeroSpellsHelper.dart';

class CustomTeamBuilderPage extends StatefulWidget {
  @override
  CustomTeamBuilderPageState createState() => new CustomTeamBuilderPageState();
}

class CustomTeamBuilderPageState extends State<CustomTeamBuilderPage> {
  var contextClass;

  HeroSpellV2List spellsData;

  var spellDatasItemsCount;

  @override
  void initState() {
    this._getHeroSpellData();
    this.setState(() {
      spellDatasItemsCount = spellsData.spells.length;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Stack(
        children: <Widget>[
          new Container(
            decoration: new BoxDecoration(
              image: new DecorationImage(
                image: new AssetImage('images/normalbg.png'),
                fit: BoxFit.cover,
              ),
            ),
            child: new BackdropFilter(
              filter: new ImageFilter.blur(
                sigmaX: 3.0,
                sigmaY: 3.0,
              ),
              child: new Container(
                decoration: new BoxDecoration(
                  color: Colors.black.withOpacity(0.2),
                ),
              ),
            ),
          ),
          new AppBar(
            title: new Text("App bar"),
            backgroundColor: Colors.transparent,
            elevation: 0.0,
          ),
          new Positioned(
            top: 80.0,
            left: 0.0,
            bottom: 0.0,
            right: 0.0,
            //here the body
            child: new Column(
              children: <Widget>[
                new Expanded(
                  child: Container(
                    color: Colors.transparent,
                    child: buildPage(),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  buildPage() {
    var nbSpellPage = spellDatasItemsCount/10+1;
    var nbSpellLastPage = spellDatasItemsCount%10;
    return Column(
      children: <Widget>[
        Expanded(
            flex: 4,
            child: new Row(
              children: <Widget>[
                Expanded(child: Center(child: Text('Image Comp'))),
                Expanded(child: Center(child: Text('Image Class'))),
                Expanded(child: Center(child: Text('Image Build'))),
              ],
            )),
        Expanded(
            flex: 1,
            child: new Swiper(
              itemBuilder: (BuildContext context, int indexPage) {
                return BuildSpellsSwiper(indexPage,nbSpellPage,nbSpellLastPage);
              },
              itemCount: nbSpellPage,
              viewportFraction: 0.8,
              scale: 0.9,
            )),
      ],
    );
  }

  Future<HeroSpellV2List> _getHeroSpellData() async {
    spellsData = await HeroSpellsV2Helper.loadSpellsByGodId(2);

    return spellsData;
  }

  BuildSpellsSwiper(int indexPage,int nbSpellPage,int nbSpellForLastPage) {
    if(indexPage+1 == nbSpellPage)
    return BuildPageSwiper(indexPage,nbSpellForLastPage,nbSpellPage);
    else
      return BuildPageSwiper(indexPage,nbSpellPage,nbSpellPage);
  }

  BuildPageSwiper(int pageindex,int spellCount,int nbMaxSpellPerPage) {
    final Orientation orientation = MediaQuery.of(context).orientation;
    if (spellsData == null) return _loadingView;
    return new GridView.builder(
        itemCount: spellCount,
        gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 5 ),
        itemBuilder: (context, index) {
          return Material(
            child: Card(
              child: new GridTile(
                  footer: new Center(
                      child: new Text(spellsData.spells[index+(pageindex*nbMaxSpellPerPage)].spellname)),
                  child: spellsData.spells[index+(pageindex*nbMaxSpellPerPage)].spellicon == "NULL"
                      ? new FadeInImage.memoryNetwork(
                    placeholder: kTransparentImage,
                    image: "https://www.verdantis.com/wp-content/uploads/2016/04/noimg.jpg",
                  )
                      : new FadeInImage.memoryNetwork(
                    placeholder: kTransparentImage,
                    image: spellsData.spells[index+(pageindex*nbMaxSpellPerPage)].spellicon,
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