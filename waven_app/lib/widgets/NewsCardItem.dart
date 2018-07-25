

import 'package:feedparser/feedparser.dart';
import 'package:flutter/material.dart';
import 'package:waven_app/models/NewsArticleModel.dart';

class NewsCardItem extends StatelessWidget {
  NewsCardItem({ Key key, @required this.news, this.shape })
      : assert(news != null),
        super(key: key);

  static const double height = 120.0;
  final FeedItem news;
  final ShapeBorder shape;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final TextStyle titleStyle = theme.textTheme.headline.copyWith(color: Colors.white);
    final TextStyle descriptionStyle = theme.textTheme.subhead;

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
                height: 100.0,
                child: new Stack(
                  children: <Widget>[
                    new Positioned.fill(
                      child: new Image.asset(
                        'images/background_the_game.jpg',
                        fit: BoxFit.cover,
                      ),
                    ),
                    new Positioned(
                      bottom: 16.0,
                      left: 16.0,
                      right: 16.0,
                      child: new FittedBox(
                        fit: BoxFit.scaleDown,
                        alignment: Alignment.centerLeft,
                        child: new Text(news.title,
                          style: titleStyle,
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
                            style: descriptionStyle.copyWith(color: Colors.black54),
                          ),
                        ),

                        new Text.rich(new TextSpan(text: news.description),
                          overflow: TextOverflow.ellipsis,maxLines: 3,style: new TextStyle(fontSize: 10.0),),
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

