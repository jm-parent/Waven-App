import 'package:flutter/material.dart';
import 'package:waven_app/models/HeroModel.dart';
import 'package:waven_app/pages/HeroDetailPage.dart';
import 'package:waven_app/util/HeroesHelper.dart';
import 'dart:async';
import 'package:transparent_image/transparent_image.dart';
import 'dart:ui' as ui;

import 'package:waven_app/widgets/FixedAppBar.dart';

class HeroesListPage extends StatefulWidget {
  @override
  HeroesListPageState createState() => new HeroesListPageState();
}

class HeroesListPageState extends State<HeroesListPage> {
  HeroList data;

  int heroDatasItemsCount;

  Future<HeroList> _getHeroesData() async {
    data = await HeroesHelper.loadHeroes();
    this.setState(() {
      heroDatasItemsCount = data.heroes.length;
    });
    print(data);
    return data;
  }

  @override
  void initState() {
    this._getHeroesData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (data == null) return _loadingView;
    return
      NestedScrollView(
          body: _heroesListWidget,
          headerSliverBuilder: (BuildContext context, bool boxIsScrolled) {
            return <Widget>[

            ];

          }
    );
  }

  Widget get _loadingView {
    return new Center(
      child: new CircularProgressIndicator(),
    );
  }

  Widget get _heroesListWidget {
    final Orientation orientation = MediaQuery
        .of(context)
        .orientation;
    return  new GridView.builder
      (
        itemCount: heroDatasItemsCount,
        gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: (orientation == Orientation.portrait) ? 2 : 3),
        itemBuilder: (context, index) {
          return Material(
            child: new RaisedButton(
                color: Colors.transparent,animationDuration: Duration(seconds: 4),
                child: new GridTile(

                  footer: new Center(
                      child: new Text(data.heroes[index].heroName)),
                  child: new Hero(tag: data.heroes[index].tag,
                      child: new FadeInImage.memoryNetwork(
                        placeholder: kTransparentImage,
                        image: data.heroes[index].heroImgUrl,
                      )
                  ),
                ),

                padding: const EdgeInsets.all(2.0),
                onPressed: () {
                  print(data.heroes[index].heroName);
                  Navigator.push(
                      context, new MaterialPageRoute(builder: (context) {
                    return new HeroDetailPage(data.heroes[index]);
                  }
                  )
                  );
                }
            ),
          );
        }
    );
  }

}
