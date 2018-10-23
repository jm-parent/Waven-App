import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:html/parser.dart' as htmlParser;
import 'package:waven_app/pages/ArticleWebViewPage.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:webfeed/domain/rss_item.dart';
import 'package:auto_size_text/auto_size_text.dart';

class NewsCardItem extends StatefulWidget {
  NewsCardItem({Key key, @required this.news, this.shape})
      : assert(news != null),
        super(key: key);

   final RssItem news;
  final ShapeBorder shape;

  static const double height = 220.0;

  @override
  NewsCardItemState createState() {
    return new NewsCardItemState();
  }
}

class NewsCardItemState extends State<NewsCardItem> {
  var blurDouble = 5.0;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final TextStyle titleStyle =
        theme.textTheme.headline.copyWith(color: Colors.white70);
    final TextStyle descriptionStyle = theme.textTheme.subhead;
    String imgUrl = widget.news.content.images.first;
    print(imgUrl);

    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => new ArticleWebViewPage(item: widget.news)),
        );
      },
      child: new Card(
        shape: widget.shape,
        child: new Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            // photo and title
            Expanded(
              flex:3,
              child: new Stack(
                children: <Widget>[
                  new Positioned.fill(
                    child:
                  new CachedNetworkImage(
                    imageUrl: imgUrl,
                    fit: BoxFit.cover,
                    placeholder: new Center(
                      child: new CircularProgressIndicator(),
                    ),
                    errorWidget: new Icon(Icons.error),
                  ),
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: const EdgeInsets.only(left:15.0,right: 20.0),
                      child: Container(
                        color: Colors.black54,
                        child: new AutoSizeText.rich(
                          new TextSpan(
                              text: widget.news.title,
                          style: TextStyle(fontSize: 15.0)),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            // description and share/explore buttons
           new Expanded(
             flex: 2,
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
                          widget.news.pubDate,
                          style: descriptionStyle.copyWith(
                              color: Colors.white70, fontSize: 10.0),
                        ),
                      ),
                      new AutoSizeText.rich(
                        new TextSpan(
                            text: _parseHtmlString(widget.news.description)),
                        style: TextStyle(fontSize: 18.0),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 3,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            // share, explore buttons
          ],
        ),
      ),
    );
  }
}

String _parseHtmlString(String htmlString) {
  var document = htmlParser.parse(htmlString);
  String parsedString =
      htmlParser.parse(document.body.text).documentElement.text;
  return parsedString;
}
