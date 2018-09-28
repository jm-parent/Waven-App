import 'package:waven_app/cards/CardTitle.dart';
import 'package:flutter/material.dart';
import 'package:waven_app/util/EnumHelper.dart';

import 'package:waven_app/util/widget_utils.dart';

class PickAClassCard extends StatefulWidget {
  final WavenPrimaryClass initialPrimaryClass;

  const PickAClassCard({Key key, this.initialPrimaryClass}) : super(key: key);

  @override
  _PickAClassCardState createState() => _PickAClassCardState();
}
class _PickAClassCardState extends State<PickAClassCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: SizedBox(
        width: double.infinity,
        child: Padding(
          padding: EdgeInsets.only(top: ScreenAwareHelper.screenAwareSize(8.0, context)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              CardTitle("GENDER"),
            ],
          ),
        ),
      ),
    );
  }
}