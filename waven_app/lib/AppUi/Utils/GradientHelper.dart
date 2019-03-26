import 'package:flutter/material.dart';
import 'package:waven_app/AppUi/ColorsHelper.dart';

Decoration GradientBg() => new BoxDecoration(
    gradient: new LinearGradient(
      begin: Alignment.centerLeft,
      end: Alignment.centerRight,
      stops: [0.0,0.5,1.0],
      colors: [
        mainDarkBlueD2(),
        Colors.transparent,
        mainDarkBlueD2(),
      ],
    ));
  Decoration GradientIop() => new BoxDecoration(
    gradient: new LinearGradient(
      begin: Alignment.centerLeft,
      end: Alignment.centerRight,
      stops: [0.0,0.5,1.0],
      colors: [
        Color(0xFF972E21),
        Color(0xFFF3844A),
        Color(0xFF972E21),
      ],
    ));
  Decoration GradientXelor()
  => new BoxDecoration(
        gradient: new LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          stops: [0.0,0.5,1.0],
          colors: [
            Color(0xFF081041),
            Color(0xFF253BCC),
            Color(0xFF081041),
          ],
        ));
  Decoration GradientCra()
  => new BoxDecoration(
        gradient: new LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          stops: [0.0,0.5,1.0],
          colors: [
            Color(0xFF0A2132),
            Color(0xFF459588),
            Color(0xFF0A2132),
          ],
        ));
  Decoration GradientEni()
  => new BoxDecoration(
        gradient: new LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          stops: [0.0,0.5,1.0],
          colors: [
            Color(0xFF212932),
            Color(0xFFD47248),
            Color(0xFF212932),
          ],
        ));

  Decoration GradientSram()
  => new BoxDecoration(
        gradient: new LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          stops: [0.0,0.5,1.0],
          colors: [
            Color(0xFF0B1828),
            Color(0xFF464995),
            Color(0xFF0B1828),
          ],
        ));
  Decoration GradientOsa()
  => new BoxDecoration(
        gradient: new LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          stops: [0.0,0.5,1.0],
          colors: [
            Color(0xFF0B1828),
            Color(0xFF454995),
            Color(0xFF0B1828),
          ],
        ));
