import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class FrostTransition extends AnimatedWidget {
  final Widget child;
  final Animation<double> animation;

  FrostTransition({this.animation, this.child}) : super(listenable: animation);

  @override
  Widget build(BuildContext context) => new BackdropFilter(
    filter: new ImageFilter.blur(sigmaX: animation.value, sigmaY: animation.value),
    child: new Container(
      child: child,
    ),
  );
}