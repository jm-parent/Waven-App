import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:http/http.dart' as http;
import 'package:waven_app/AppUi/CommonWidget/WavenCompanionAppBar.dart';
import 'package:waven_app/AppUi/NewsSection/NewsCardItem.dart';
import 'package:waven_app/AppUi/NewsSection/NewsEnterAnimation.dart';
import 'package:webfeed/webfeed.dart';

class NewsPage extends StatefulWidget {


  NewsPage({@required AnimationController controller,}) : animation = new NewsEnterAnimation(controller);
  final NewsEnterAnimation animation;

  @override
  NewsPageState createState() => new NewsPageState();
}

var client = new http.Client();

class NewsPageState extends State<NewsPage> {

  RssFeed newsDatas;
  int newsDatasItemsCount;

  //Plan des news
  List<StaggeredTile> _staggeredTiles = <StaggeredTile>[
    const StaggeredTile.count(2, 2),
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
    var response = await client.get("https://blog.waven-game.com/fr/feed/");

    if (response.statusCode == 200) {
      this.setState(() {
        newsDatas = new RssFeed.parse(response.body);
        newsDatasItemsCount = newsDatas.items.length;
      });
      //newsLast = newsDatas.items[0];
      //newsDatas.items.removeAt(0);

      for (var test in newsDatas.items) {
        _staggeredTiles.add(const StaggeredTile.count(2, 2));
      }
      const rad = 5.0;

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
    return Scaffold(
      appBar: WavenCompanionAppbar(),
      body: newsDatas == null ? _loadingView : buildStaggeredGridView(),
    );
  }

  Widget buildStaggeredGridView() {
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
