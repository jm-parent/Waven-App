import 'package:flutter/material.dart';
import 'package:waven_app/models/HeroModelV2.dart';
import 'package:waven_app/widgets/GridHeroRoleStatsItem.dart';

class HeroDetailStatDescBlock extends StatelessWidget {
  final HeroClassV2 heroData;
  static const double height = 220.0;

  HeroDetailStatDescBlock({Key key, @required this.heroData})
      : assert(heroData != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final TextStyle titleStyle =
    theme.textTheme.headline.copyWith(color: Colors.yellow);
    final TextStyle descriptionStyle = theme.textTheme.subhead.copyWith(color: Colors.white70);

    return  new Column(
      children: <Widget>[
        new Text(heroData.heroName,
          style: titleStyle,
        ),
        Padding(
          padding: const EdgeInsets.all(15.0),
          child: new RichText(
            text: new TextSpan(
                text: heroData.lore,
                style: descriptionStyle
            ),
          ),
        ),
      ],
    );
  }
}
