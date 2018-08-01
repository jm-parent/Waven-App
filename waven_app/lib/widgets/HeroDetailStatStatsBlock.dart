import 'package:flutter/material.dart';
import 'package:waven_app/models/HeroModelV2.dart';
import 'package:waven_app/widgets/GridHeroRoleStatsItem.dart';

class HeroDetailStatStatsBlock extends StatelessWidget {
  final HeroClassV2 heroData;
  static const double height = 220.0;

  HeroDetailStatStatsBlock({Key key, @required this.heroData})
      : assert(heroData != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final TextStyle titleStyle =
    theme.textTheme.headline.copyWith(color: Colors.yellow);
    final TextStyle descriptionStyle = theme.textTheme.subhead.copyWith(color: Colors.white70);
    const paddingVal = 3.0;
    return  new Row(
      children: <Widget>[

        //Column de gauche
    Expanded(
          child: new Column(
            children: <Widget>[
              new Row(
                children: <Widget>[
                  new Expanded(child: new Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(paddingVal),
                          child: new Text("Santé:", style: descriptionStyle),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(paddingVal),
                          child: new Text("PA:", style: descriptionStyle),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(paddingVal),
                          child: new Text("PM:", style: descriptionStyle),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(paddingVal),
                          child: new Text("Attaque:", style: descriptionStyle),
                        ),

                    ],
                  )
                  ),
                  new Expanded(child: new Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                     Padding(
                       padding: const EdgeInsets.all(paddingVal),
                       child: new Text(heroData.hp.toString(), style: descriptionStyle),
                     ),
                     Padding(
                       padding: const EdgeInsets.all(paddingVal),
                       child: new Text(heroData.pa.toString(), style: descriptionStyle),
                     ),
                     Padding(
                       padding: const EdgeInsets.all(paddingVal),
                       child: new Text(heroData.pm.toString(), style: descriptionStyle),
                     ),
                     Padding(
                       padding: const EdgeInsets.all(paddingVal),
                       child: new Text(heroData.attack.toString(), style: descriptionStyle),
                     ),

                    ],
                  )
                  )
                ],
              )

            ],
          ),
        ),
        Expanded(
          child: new Column(
            children: <Widget>[
          new Row(
          children: <Widget>[
          new Expanded(child: new Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[ Padding(
              padding: const EdgeInsets.all(paddingVal),
              child: new Text("Portée:", style: descriptionStyle),
            ),
            Padding(
              padding: const EdgeInsets.all(paddingVal),
              child: new Text("Armure:", style: descriptionStyle),
            ),
            Padding(
              padding: const EdgeInsets.all(paddingVal),
              child: new Text("Blindage:", style: descriptionStyle),
            ),]
          )
        ),
          new Expanded(child: new Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[  Padding(
                padding: const EdgeInsets.all(paddingVal),
                child: new Text(heroData.range.toString(), style: descriptionStyle),
              ),
              Padding(
                padding: const EdgeInsets.all(paddingVal),
                child: new Text(heroData.armor.toString(), style: descriptionStyle),
              ),
              Padding(
                padding: const EdgeInsets.all(paddingVal),
                child: new Text(heroData.shield.toString(), style: descriptionStyle),
              ),]
          )
          )
        ]
          )
            ],
          ),
        )
      ],

    );
  }
}
