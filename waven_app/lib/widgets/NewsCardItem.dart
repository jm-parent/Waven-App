import 'dart:ui' as ui;
import 'package:feedparser/feedparser.dart';
import 'package:flutter/material.dart';
import 'package:html/parser.dart' as htmlParser;
import 'package:waven_app/pages/ArticleWebViewPage.dart';
import 'package:cached_network_image/cached_network_image.dart';

class NewsCardItem extends StatelessWidget {

  NewsCardItem({ Key key, @required this.news, this.shape })
      : assert(news != null),
        super(key: key);

  final FeedItem news;
  final ShapeBorder shape;

  static const double height = 220.0;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final TextStyle titleStyle = theme.textTheme.headline.copyWith(
        color: Colors.white70);
    final TextStyle descriptionStyle = theme.textTheme.subhead;
    String imgUrl = getEnteteUrl(news.description);
    print(imgUrl);

    return new SafeArea(
      top: false,
      bottom: false,
      child: new Container(
        padding: const EdgeInsets.all(0.0),
        height: height,
        child: InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => new ArticleWebViewPage(item: news)),
            );
          },
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
                        child: new CachedNetworkImage(
                          imageUrl: imgUrl,
                          fit: BoxFit.cover,
                          placeholder: new Center(
                            child: new CircularProgressIndicator(),
                          ),
                          errorWidget: new Icon(Icons.error),

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
                              style: descriptionStyle.copyWith(
                                  color: Colors.white70, fontSize: 10.0),
                            ),
                          ),
                          new Text.rich(new TextSpan(
                              text: _parseHtmlString(news.description)),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 3,
                            style: new TextStyle(fontSize: 11.0),),
                        ],
                      ),
                    ),
                  ),
                ),
                // share, explore buttons
              ],
            ),
          ),
        ),
      ),
    );
  }
}

var bodyProgress =
new Container(
    alignment: AlignmentDirectional.center,
    decoration: new BoxDecoration(
      color: Colors.white70,
    ),
    child: new Container(
      decoration: new BoxDecoration(
          color: Colors.blue[200],
          borderRadius: new BorderRadius.circular(10.0)
      ),
      width: 300.0,
      height: 200.0,
      alignment: AlignmentDirectional.center,
      child: new Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          new Center(
            child: new SizedBox(
              height: 50.0,
              width: 50.0,
              child: new CircularProgressIndicator(
                value: null,
                strokeWidth: 7.0,
              ),
            ),
          ),
          new Container(
            margin: const EdgeInsets.only(top: 25.0),
            child: new Center(
              child: new Text(
                "loading.. wait...",
                style: new TextStyle(
                    color: Colors.white
                ),
              ),
            ),
          ),
        ],
      ),
    ));

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