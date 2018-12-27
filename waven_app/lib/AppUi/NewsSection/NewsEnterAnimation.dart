import 'package:flutter/animation.dart';

class NewsEnterAnimation {
  NewsEnterAnimation(this.controller)
      : backdropOpacity = new Tween(begin: 0.0, end: 1.0).animate(
          new CurvedAnimation(
            parent: controller,
            curve: Curves.ease,
          ),
        );

  final AnimationController controller;
  final Animation<double> backdropOpacity;
}
