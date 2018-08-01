import 'package:flutter/material.dart';
import 'package:waven_app/models/HeroModel.dart';
import 'package:waven_app/models/HeroModelV2.dart';

class GridLoreItem extends StatelessWidget {
  String imgUrl;
  String loreStr;
  String loreTitle;
  final HeroClassV2 heroData;
  static const double height = 220.0;

  GridLoreItem(
      {Key key,
      @required this.loreTitle,
      @required this.loreStr,
      @required this.heroData,
      this.imgUrl})
      : assert(loreTitle != null),
        assert(loreStr != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final TextStyle titleStyle =
        theme.textTheme.headline.copyWith(color: Colors.white);
    final TextStyle descriptionStyle = theme.textTheme.subhead;
    return new SafeArea(
        top: false,
        bottom: false,
        child: new Container(
          padding: const EdgeInsets.all(3.0),
          height: height,
          child: new Card(
              child: Container(
            decoration: new BoxDecoration(
              border: new Border.all(color: Colors.orange),
              image: new DecorationImage(
                image: new Image.network(imgUrl).image,
                fit: BoxFit.cover,
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                new Container(
                    margin: const EdgeInsets.only(right: 15.0),
                    padding: const EdgeInsets.all(15.0),
                    child: new Column(
                      children: <Widget>[
                        new Text(
                          loreTitle,
                          style: titleStyle,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: new RichText(
                            text: new TextSpan(
                                text: loreStr, style: descriptionStyle),
                          ),
                        ),
                      ],
                    )),
              ],
            ),
          )),
        ));
  }
}
