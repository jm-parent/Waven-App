import 'dart:async';
import 'package:waven_app/util/ThemeHelper.dart';
import 'package:waven_app/widgets/CarouselSlider.dart';
import 'package:webfeed/webfeed.dart';
import 'package:flutter/material.dart';
import 'package:waven_app/models/NewsArticleModel.dart';
import 'package:waven_app/util/NewsHelper.dart';
import 'package:http/http.dart' as http;
import 'package:waven_app/widgets/NewsCardItem.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class NewsPage extends StatefulWidget {
  //Constructeur avec paramètre
  final GlobalKey<ScaffoldState> scaffoldKey;

  NewsPage({Key key, this.scaffoldKey}) : super(key: key);

  @override
  NewsPageState createState() => new NewsPageState();
}

var client = new http.Client();

Color _nameToColor(String name) {
  assert(name.length > 1);
  final int hash = name.hashCode & 0xffff;
  final double hue = (360.0 * hash / (1 << 15)) % 360.0;
  return new HSVColor.fromAHSV(1.0, hue + hue, hue, 1.0).toColor();
}

class NewsPageState extends State<NewsPage> {
  final GlobalKey<ScaffoldState> scaffoldKey;

  NewsPageState({this.scaffoldKey});

  RssFeed newsDatas;
  RssItem newsLast;
  int newsDatasItemsCount;

  //Plan des news
  List<StaggeredTile> _staggeredTiles = <StaggeredTile>[
    const StaggeredTile.count(4, 4),
  ];

  //Cards des news
  List<Widget> _tiles = <Widget>[];

  final List<String> imgList = [
    'images/HeroImages/iop03.png',
    'images/HeroImages/iop_base.png',
    'images/HeroImages/iop_bouvaliere.png',
    'images/HeroImages/iop_coeurfroid.png',
    'images/HeroImages/xelor_base.png',
    'images/HeroImages/xelor_catalyseur_f.png',
    'images/HeroImages/xelor_regulatrice.png',
    'images/HeroImages/xelor_synchronisatrice.png',
    'images/HeroImages/xelor_trotteuse.png',
  ];

  List<T> map<T>(List list, Function handler) {
    List<T> result = [];
    for (var i = 0; i < list.length; i++) {
      result.add(handler(i, list[i]));
    }

    return result;
  }

  Future<RssFeed> _getNewsData() async {
    var response = await client.get("https://waven-game.com/fr/feed/");

    if (response.statusCode == 200) {
      this.setState(() {
        newsDatas = new RssFeed.parse(response.body);
        newsDatasItemsCount = newsDatas.items.length;
      });
      newsLast = newsDatas.items[0];
      newsDatas.items.removeAt(0);

      for (var test in newsDatas.items) {
        _staggeredTiles.add(const StaggeredTile.count(2, 2));
      }
      const rad = 5.0;
//      _tiles.add(
//      NewsCardItem(
//          news: newsLast,
//          shape: const RoundedRectangleBorder(
//            borderRadius: BorderRadius.all(
//                Radius.circular(rad)
//            ),
//          )));
      _tiles.add(new CarouselSlider(
        height: 400.0,
        items: imgList.map((url) {
          return Stack(
            children:<Widget>[
              Container(
              margin: new EdgeInsets.all(5.0),
              decoration: ImageDecoration(url, BoxFit.contain),
              child: null
            ),
              Container(
                decoration: BoxDecoration(
                  gradient:  LinearGradient(
                    stops: [0.0, 0.3, 0.7, 1.0],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      const Color(0x00000000),
                      const Color(0xAA000000),
                      const Color(0xAA000000),
                      const Color(0x00000000),
                    ],
                  ),
                ),
              ),
              Container(
                child: Column(
                  children: <Widget>[
                    Expanded(
                      flex: 2,
                      child: Container(
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: new Row(
                        children: <Widget>[
                          Transform(
                            transform: new Matrix4.identity()..scale(0.9),
                            child: new Chip(
                              label: new Text(
                                "ACTION",
                                overflow: TextOverflow.ellipsis,
                                style: new TextStyle(color: Colors.white),
                              ),
                              backgroundColor: Colors.pinkAccent[400],
                            ),
                          ),
                          Transform(
                            transform: new Matrix4.identity()..scale(0.9),
                            child: new Chip(
                              label: new Text(
                                "E3 2018",
                                overflow: TextOverflow.ellipsis,
                                style: new TextStyle(color: Colors.white),
                              ),
                              backgroundColor: Colors.pinkAccent[400],
                            ),
                          ),
                          Transform(
                            transform: new Matrix4.identity()..scale(0.9),
                            child: new Chip(
                              label: new Text(
                                "PGW",
                                overflow: TextOverflow.ellipsis,
                                style: new TextStyle(color: Colors.white),
                              ),
                              backgroundColor: Colors.pinkAccent[400],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 4,
                      child: Container(
                        child: Text("Waven sera à la PGW 2018 !" ,style: TextStyle(fontSize: 36.0),),
                      ),
                    ),
                  ],
                ),
              )
          ]
          );
        }).toList(),
        viewportFraction: 0.9,
        aspectRatio: 2.0,
        autoPlay: false,
      ));
      for (var news in newsDatas.items) {
        _tiles.add(NewsCardItem(
            news: news,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(rad)),
            )));
      }

      return newsDatas;
    } else {
      throw Exception('Failed to load Waven News');
    }
  }

  @override
  void initState() {
    this._getNewsData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (newsDatas == null) return _loadingView;
    return Container(
      decoration: DrawerMenuGradientBg(),
      child: AnimatedCrossFade(
        firstChild: _loadingView,
        secondChild: buildStaggeredGridView(),
        crossFadeState: newsDatas == null
            ? CrossFadeState.showFirst
            : CrossFadeState.showSecond,
        duration: Duration(seconds: 1),
      ),
    );
  }

  StaggeredGridView buildStaggeredGridView() {
    return StaggeredGridView.count(
      crossAxisCount: 4,
      staggeredTiles: _staggeredTiles,
      children: _tiles,
      mainAxisSpacing: 4.0,
      crossAxisSpacing: 4.0,
      padding: const EdgeInsets.all(4.0),
    );
  }

  Widget get _loadingView {
    return new Center(
      child: new CircularProgressIndicator(),
    );
  }
}
