import 'package:flutter/material.dart';
import 'package:waven_app/models/HeroModelV2.dart';
import 'package:waven_app/widgets/GridHeroRoleStatsItem.dart';

class HeroDetailStatRoleBlock extends StatelessWidget {
  final HeroClassV2 heroData;
  static const double height = 220.0;

  HeroDetailStatRoleBlock({Key key, @required this.heroData})
      : assert(heroData != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return new Column(
      children: <Widget>[
        new HeroRoleStatsItem("Entrave", heroData.entrave / 10, null,
            "images/role_1.png", Colors.white70),
        new HeroRoleStatsItem("Tank", heroData.tank / 10, null,
            "images/role_2.png", Colors.cyanAccent),
        new HeroRoleStatsItem("Protection", heroData.protection / 10, null,
            "images/role_3.png", Colors.orange),
        new HeroRoleStatsItem("Soins", heroData.soins / 10, null,
            "images/role_4.png", Colors.pink),
        new HeroRoleStatsItem("Dégats", heroData.degats / 10, null,
            "images/role_5.png", Colors.red),
        new HeroRoleStatsItem("Placement", heroData.placement / 10, null,
            "images/role_6.png", Colors.lightGreenAccent),
        new HeroRoleStatsItem("Invocation", heroData.invocation / 10, null,
            "images/role_7.png", Colors.purple),
        new HeroRoleStatsItem("Amélioration", heroData.amelioration / 10,
            null, "images/role_8.png", Colors.blue),
      ],
    );
  }
}
