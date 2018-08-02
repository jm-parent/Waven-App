

import 'dart:convert';
import 'dart:ui' as ui;
import 'package:feedparser/feedparser.dart';
import 'package:flutter/material.dart';
import 'package:waven_app/models/NewsArticleModel.dart';
import 'package:html/parser.dart' as htmlParser;


class NewsCardItem extends StatelessWidget {
  NewsCardItem({ Key key, @required this.news, this.shape })
      : assert(news != null),
        super(key: key);

  static const double height = 220.0;
  final FeedItem news;
  final ShapeBorder shape;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final TextStyle titleStyle = theme.textTheme.headline.copyWith(color: Colors.white70);
    final TextStyle descriptionStyle = theme.textTheme.subhead;

    String imgUrl = getEnteteUrl(news.description);
    print(imgUrl);


    return new SafeArea(
      top: false,
      bottom: false,
      child: new Container(
        padding: const EdgeInsets.all(0.0),
        height: height,
        child: new Card(
          shape: shape,
          child: new Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              // photo and title
              new SizedBox(
                height: 120.0,
                child: new Stack(
                  children: <Widget>[
                    new Positioned.fill(
                      child: new Image.network(
                        imgUrl,
                        fit: BoxFit.cover,
                      ),
                    ),
                    new Positioned(
                      bottom: 16.0,
                      left: 8.0,
                      right: 8.0,
                      child:
                      new FittedBox(
                            fit: BoxFit.scaleDown,
                            alignment: Alignment.centerLeft,
                            child: Container(
                              color: Colors.black54,
                              child: new BackdropFilter(
                              filter: new ui.ImageFilter.blur(
                                sigmaX: 10.0,
                                sigmaY: 10.0,
                              ),
                              child: new Text(news.title,
                              style: titleStyle,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              // description and share/explore buttons
              new Expanded(
                child: new Padding(
                  padding: const EdgeInsets.fromLTRB(8.0, 8.0, 8.0, 0.0),
                  child: new DefaultTextStyle(
                    softWrap: false,
                    overflow: TextOverflow.ellipsis,
                    style: descriptionStyle,
                    child: new Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        // three line description
                        new Padding(
                          padding: const EdgeInsets.only(bottom: 0.0),
                          child: new Text(
                            news.pubDate,
                            style: descriptionStyle.copyWith(color: Colors.white70,fontSize: 10.0),
                          ),
                        ),
                        new Text.rich(new TextSpan(text: _parseHtmlString(news.description)),
                          overflow: TextOverflow.ellipsis,maxLines: 3,style: new TextStyle(fontSize: 11.0),),
                      ],
                    ),
                  ),
                ),
              ),
              // share, explore buttons
            /*  new ButtonTheme.bar(
                child: new ButtonBar(
                  alignment: MainAxisAlignment.start,
                  children: <Widget>[
                    new FlatButton(
                      child: const Text('Partager'),
                      textColor: Colors.amber.shade500,
                      onPressed: () { *//* do nothing *//* },
                    ),
                    new FlatButton(
                      child: const Text('Plus...'),
                      textColor: Colors.amber.shade500,
                      onPressed: () { *//* do nothing *//* },
                    ),
                  ],
                ),
              ),*/
            ],
          ),
        ),
      ),
    );
  }


}

String getEnteteUrl(String description) {
    var indexOfHttp = description.indexOf("https");
    var indexOfjpg = description.indexOf(".jpg");
    var indexOfpng = description.indexOf(".png");
    indexOfjpg = indexOfjpg == -1 ? 9999: indexOfjpg;
    indexOfpng = indexOfpng == -1 ? 9999: indexOfpng;
    var endindex = indexOfjpg > indexOfpng ? indexOfpng : indexOfjpg;
    var url = description.substring(indexOfHttp,endindex+4);
    return url;
  }

String _parseHtmlString(String htmlString) {
  var document = htmlParser.parse(htmlString);
  String parsedString = htmlParser.parse(document.body.text).documentElement.text;
  return parsedString;
}