import 'package:flutter/material.dart';
import 'package:waven_app/models/ShushuOfflineModel.dart';

class ShushusDetailTileName extends StatelessWidget {
  final ShushuOfflineModel shushuModel;
  final double padding;

  ShushusDetailTileName(this.shushuModel, this.padding);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(padding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            shushuModel.heroName,
            style: Theme.of(context).textTheme.subtitle,
          ),


        ],
      ),
    );
  }
}