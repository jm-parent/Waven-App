import 'package:flutter/material.dart';

Decoration GradientBackground()
{
  return    new BoxDecoration(
      gradient: new LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      stops: [0.2, 0.4, 0.6, 0.8],
      colors: [
        Color.fromRGBO(60,71,106, 1.0),
        Color.fromRGBO(60,71,106, 0.7),
        Color.fromRGBO(60,71,106, 0.4),
        Color.fromRGBO(60,71,106, 0.1),
      ],
  ));
}
