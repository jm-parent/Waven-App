import 'package:flutter/material.dart';
import 'dart:async';

import 'package:waven_app/util/widget_utils.dart';
import 'package:waven_app/widgets/ShadowText.dart';

class SpellPlaceholderPage extends StatefulWidget {
  @override
  _SpellPlaceholderPageState createState() => new _SpellPlaceholderPageState();
}

class _SpellPlaceholderPageState extends State<SpellPlaceholderPage> {

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        new Image.asset("images/spellmaker_res/air1.png",
          width: ScreenAwareHelper.screenAwareSizePercentWidth(30, context),
        ),
        new Image.asset(
          'images/spell_cadre/spell_air.png',
          width: ScreenAwareHelper.screenAwareSizePercentWidth(30, context),
        ),
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
