import 'dart:async';

import 'package:flutter/material.dart';
import 'package:waven_app/models/NewsArticleModel.dart';
import 'package:waven_app/util/NewsHelper.dart';
import 'package:feedparser/feedparser.dart';
import 'package:http/http.dart' as http;
import 'package:waven_app/widgets/FixedAppBar.dart';
import 'package:waven_app/widgets/NewsCardItem.dart';

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

  Feed newsDatas;
  int newsDatasItemsCount;

  Future<Feed> _getNewsData() async {
    var response = await client.get("https://waven-game.com/feed/");

    if (response.statusCode == 200) {
      this.setState(() {
        newsDatas = parse(response.body);
        newsDatasItemsCount = newsDatas.items.length;
      });

      return newsDatas;
    } else {
      throw Exception('Failed to load Waven News');
    }
  }

  ScrollController _scrollViewController;

  @override
  void initState() {
    this._getNewsData();
    super.initState();
    _scrollViewController = ScrollController(initialScrollOffset: 0.0);
  }

  @override
  Widget build(BuildContext context) {
    final Orientation orientation = MediaQuery
        .of(context)
        .orientation;
    if (newsDatas == null) return _loadingView;
    return new Container(
      color: Colors.transparent,
      child: new Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text("Nouvelles"),
              ],
            ),
          ),
          Expanded(
            child: GridView.builder(gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: (orientation == Orientation.portrait) ? 2 : 3),
              itemBuilder: (context, position) {
                return Padding(
                      padding: const EdgeInsets.all(3.0),
                      child: NewsCardItem(news: newsDatas.items[position],shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20.0),
                topRight: Radius.circular(20.0),
                bottomLeft: Radius.circular(20.0),
                bottomRight: Radius.circular(20.0),
                ),)
                    ),


                );
              },
              itemCount: newsDatasItemsCount,
            ),
          ),
        ],
      ),
    );
  }

  Widget get _loadingView {
    return new Center(
      child: new CircularProgressIndicator(),
    );
  }

  Widget get _newsListWidget {
    final Orientation orientation = MediaQuery
        .of(context)
        .orientation;
    return  new GridView.builder
      (
        itemCount: newsDatasItemsCount,
        gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: (orientation == Orientation.portrait) ? 2 : 3),
        itemBuilder: (context, index) {
          return Material(
           child: RaisedButton(
              onPressed: () {
            final snackBar = SnackBar(
              content: Text('Yay! A SnackBar!'),
              action: SnackBarAction(
                label: 'Undo',
                onPressed: () {
                  // Some code to undo the change!
                },
              ),
            );

            // Find the Scaffold in the Widget tree and use it to show a SnackBar!
            Scaffold.of(context).showSnackBar(snackBar);
          },
           ),
                  );
                }

          );
        }
  }
