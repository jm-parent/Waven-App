import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:waven_app/models/HeroModel.dart';
import 'package:waven_app/models/HeroModelV2.dart';

class HeroRoleStatsItem extends StatelessWidget {

  final String statName;
  final double statValuePercent;
  final String imgUrl;
  final String imgAsset;
  final Color barColor;
  static const double height = 100.0;
  int animationTimeInMs = 1500;
  double statBarWidth = 250.0;
  double lineHeight = 10.0;

  HeroRoleStatsItem(this.statName, this.statValuePercent,this.imgUrl,this.imgAsset,this.barColor);

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return new SafeArea(
        top: false,
        bottom: false,
        child: new Row(
          children: <Widget>[
            imgUrl == null ? new Image.asset(imgAsset,height: 25.0,) :CachedNetworkImage(
      imageUrl: imgUrl,
      placeholder: new CircularProgressIndicator(),
      errorWidget: new Icon(Icons.error),
    ),
            Expanded(child: new Text(statName)),
            Expanded(
              flex: 3,

                child: LinearPercentIndicator(
                    animation: true,
                    animationDuration: animationTimeInMs,
                    width: statBarWidth,
                    backgroundColor: Colors.black,
                    lineHeight: 10.0,
                    percent: statValuePercent,
                    progressColor: barColor),

            ),
          ],
        )

    );
  }
}
