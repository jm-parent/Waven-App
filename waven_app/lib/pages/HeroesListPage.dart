import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:waven_app/models/HeroModel.dart';
import 'package:waven_app/models/HeroModelV2.dart';
import 'package:waven_app/pages/HeroDetailPage.dart';
import 'package:waven_app/util/HeroesHelper.dart';
import 'dart:async';
import 'package:transparent_image/transparent_image.dart';
import 'dart:ui' as ui;

import 'package:waven_app/widgets/FixedAppBar.dart';

class HeroesListPage extends StatefulWidget {

  HeroesListPage({Key key}) : super(key: key);


  @override
  HeroesListPageState createState({Key key}) => new HeroesListPageState();
}

class HeroesListPageState extends State<HeroesListPage> {
  HeroListV2 data;

  int heroDatasItemsCount;

  Future<HeroListV2> _getHeroesData() async {
    data = await HeroesV2Helper.loadHeroes();
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
    return _heroesListWidget;

  }

  Widget get _loadingView {
    return new Center(
      child: new CircularProgressIndicator(),
    );
  }

  Widget get _heroesListWidget {
    return new Material(
        child: new GridView.extent(
      maxCrossAxisExtent: 240.0,
      children: _buildHeroGridTiles(heroDatasItemsCount),
     // mainAxisSpacing: 10.0,
     // crossAxisSpacing: 10.0,
     // padding: EdgeInsets.all(8.0),
    ));
  }

  _onTileClicked(i) {
    print(data.heroes[i].heroName);
    Navigator.push(context, new MaterialPageRoute(builder: (context) {
      return new HeroDetailPage(data.heroes[i]);
    }));
  }

  List<Widget> _buildHeroGridTiles(numberOfHeroes) {
    List<Container> containers =
        new List<Container>.generate(numberOfHeroes, (int index) {
      return Container(
        child: new GridTile(
          footer: new Center(child: new Text(data.heroes[index].heroName)),
          child: new InkResponse(
            onTap: () => _onTileClicked(index),
            child: new Hero(
                tag: data.heroes[index].tag,
                child:  new CachedNetworkImage(
                  imageUrl: data.heroes[index].img,

                  placeholder: new Center(
                    child: new CircularProgressIndicator(),
                  ),
                  errorWidget: new Icon(Icons.error),

                ),
            ),
          ),
        ),
      );
    });
    return containers;
  }
}

/*
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

}*/
