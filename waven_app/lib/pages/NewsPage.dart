import 'dart:async';

import 'package:flutter/material.dart';
import 'package:waven_app/models/NewsArticleModel.dart';
import 'package:waven_app/util/NewsHelper.dart';
import 'package:feedparser/feedparser.dart';
import 'package:http/http.dart' as http;
import 'package:waven_app/widgets/FixedAppBar.dart';


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
      throw Exception('Failed to load Waven NEws');
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

    if(newsDatas == null)
      return _loadingView;
    return
      NestedScrollView(
        body:  ListView.builder(
          itemBuilder: (context, position) {
            return Padding(
              padding: const EdgeInsets.fromLTRB(0.0, 0.5, 0.0, 0.5),
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      new Chip(
                        key: new ValueKey<String>(
                            newsDatas.items[position].link),
                        backgroundColor: _nameToColor(
                            newsDatas.items[position].link),
                        label: new Text(
                          newsDatas.items[position].link,
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w500,
                              fontSize: 10.0),
                        ),
                      ),
                      Padding(
                          padding: const EdgeInsets.fromLTRB(
                              0.0, 1.0, 0.0, 0.0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Expanded(
                                child: Column(
                                  children: <Widget>[
                                    Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                      children: <Widget>[
                                        Flexible(
                                          child: Text(
                                            newsDatas.items[position].title,
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 22.0),
                                          ),
                                          flex: 3,
                                        ),
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                      children: <Widget>[
                                        Column(
                                          crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                          children: <Widget>[
                                            Text(
                                              newsDatas.items[position]
                                                  .link,
                                              style: TextStyle(
                                                  fontSize: 18.0),
                                            ),
                                            Text(
                                              newsDatas.items[position]
                                                  .pubDate,
                                              style: TextStyle(
                                                  color: Colors.grey,
                                                  fontWeight: FontWeight
                                                      .w500),
                                            )
                                          ],
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment
                                    .center,
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: <Widget>[
                                  Container(
                                    height: 80.0,
                                    width: 100.0,
                                    child: Image.network(
                                      "https://i0.wp.com/waven-game.com/wp-content/uploads/2018/06/Waven_Interfaces.png",
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ))
                    ],
                  ),
                ),
              ),
            );
          },
          itemCount: newsDatasItemsCount,
        ),
        controller: _scrollViewController,
        headerSliverBuilder: (BuildContext context, bool boxIsScrolled) {
          return <Widget>[
            new FixedAppBar("titre", context),

          ];

        }
    );

  }

  Widget get _loadingView {
    return new Center(
      child: new CircularProgressIndicator(),
    );
  }

}

