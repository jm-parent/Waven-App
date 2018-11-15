import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:waven_app/HeroList/HeroListItem.dart';
import 'package:waven_app/models/HeroModel.dart';
import 'package:waven_app/models/HeroModelV2.dart';
import 'package:waven_app/pages/HeroDetailPage.dart';
import 'package:waven_app/util/HeroesHelper.dart';
import 'dart:async';
import 'package:transparent_image/transparent_image.dart';
import 'package:waven_app/util/ThemeHelper.dart';
import 'package:waven_app/util/widget_utils.dart';
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
    return Container(
      color: Colors.black12,
        child: _buildHeroList(heroDatasItemsCount)
    );
  }

  Widget get _loadingView {
    return new Center(
      child: new CircularProgressIndicator(),
    );
  }

  _onTileClicked(i) {
    print(data.heroes[i].heroName);
    Navigator.push(context, new MaterialPageRoute(builder: (context) {
      return new HeroDetailPage(data.heroes[i]);
    }));
  }

  Widget _buildHeroList(numberOfHeroes) {
    return Stack(
      children: <Widget>[

        ListView.builder(
            shrinkWrap: true,
            itemCount: numberOfHeroes,
            itemBuilder: (BuildContext context, int index) {
              return  InkWell(child: HeroListItem(data.heroes[index]),
                  onTap: () => _onTileClicked(index)
              );
            }),
      ],
    );
  }
}


//
//Padding(
//padding: const EdgeInsets.only(top:4.0,left: 4.0,right: 4.0),
//child: new ClipRRect(
//borderRadius: new BorderRadius.circular(20.0),
//child: Card(
//color: DarkColor(),
//child: ListTile(
//contentPadding: EdgeInsets.all(12.0),
//leading:  new Hero(
//tag: data.heroes[index].tag,
//child: new CachedNetworkImage(
//width: ScreenAwareHelper.screenAwareSize(90.0, context),
//height: ScreenAwareHelper.screenAwareSize(70.0, context),
//imageUrl: data.heroes[index].img,
//
//placeholder: new Center(
//child: new CircularProgressIndicator(),
//),
//errorWidget: new Icon(Icons.error),
//),
//),
//onTap: () => _onTileClicked(index),
//title: new Text(data.heroes[index].heroName),
//subtitle: new Text(data.heroes[index].lore,maxLines: 3,overflow: TextOverflow.ellipsis,),
//
//),
//),
//),
//);

