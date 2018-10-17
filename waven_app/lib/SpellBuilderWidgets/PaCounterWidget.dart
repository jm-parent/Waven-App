import 'package:flutter/material.dart';
import 'dart:async';

import 'package:waven_app/util/widget_utils.dart';
import 'package:waven_app/widgets/ShadowText.dart';

class PaCounterWidget extends StatefulWidget {
  @override
  _PaCounterWidgetState createState() => new _PaCounterWidgetState();
}

class _PaCounterWidgetState extends State<PaCounterWidget> {

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Stack(
          alignment: Alignment.center,
          children: <Widget>[
            new Image.asset(
              'images/spell_cadre/spell_pa_icon.png',
            ),
            ShadowText(
              "4",
              style: TextStyle(fontSize: 22.0),
            ),
          ],
        ),
      ],
    );
  }
}
