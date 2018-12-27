import 'dart:ui' as ui;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:html/parser.dart' as htmlParser;
import 'package:waven_app/pages/ArticleWebViewPage.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:waven_app/util/ThemeHelper.dart';
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
    final TextStyle descriptionStyle = theme.textTheme.subhead;
    String imgUrl = widget.news.content.images.first;
    print(imgUrl);

    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          CupertinoPageRoute(
              builder: (context) => new ArticleWebViewPage(item: widget.news)),
        );
      },
      child: new Card(
        color: Color.fromRGBO(72, 61, 139, 0.4),
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

                ],
              ),
            ),
            // description and share/explore buttons
           new Expanded(
             flex: 2,
              child: new Padding(
                padding: const EdgeInsets.fromLTRB(8.0, 0.0, 8.0, 0.0),
                child: new DefaultTextStyle(
                  softWrap: false,
                  overflow: TextOverflow.ellipsis,
                  style: descriptionStyle,
                  child: new Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                   mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      new AutoSizeText.rich(
                        new TextSpan(
                            text: widget.news.title,
                            style: TitleNewsStyle(context)),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                        minFontSize: 16.0,
                      ),
                      new AutoSizeText.rich(
                        new TextSpan(
                            text: _parseHtmlString(widget.news.description)),
                        style: TextStyle(fontSize: 18.0),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
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
