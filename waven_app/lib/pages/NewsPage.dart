import 'dart:async';
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
    const StaggeredTile.count(4, 2),
  ];

  //Cards des news
  List<Widget> _tiles = <Widget>[];



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
      _tiles.add(NewsCardItem(
          news: newsLast,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
             Radius.circular(rad)
            ),
          )));

      for (var news in newsDatas.items) {
        _tiles.add(NewsCardItem(
            news: news,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                  Radius.circular(rad)
              ),
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

    return new Padding(
        padding: const EdgeInsets.only(top: 12.0),
        child: new StaggeredGridView.count(
          crossAxisCount: 4,
          staggeredTiles: _staggeredTiles,
          children: _tiles,
          mainAxisSpacing: 4.0,
          crossAxisSpacing: 4.0,
          padding: const EdgeInsets.all(4.0),
        ));
  }

  Widget get _loadingView {
    return new Center(
      child: new CircularProgressIndicator(),
    );
  }
}
