


import 'package:flutter/material.dart';

Widget linkWidgetVisibilityToBool(bool condition,Widget container)
{

  return    AnimatedCrossFade(
    duration: Duration(milliseconds: 500),
    firstChild: container,
    secondChild: Container(),
    firstCurve: Curves.bounceIn,
    secondCurve: Curves.bounceOut,
    crossFadeState: condition?CrossFadeState.showFirst:CrossFadeState.showSecond,
  );
}




