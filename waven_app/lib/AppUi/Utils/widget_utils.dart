import 'package:flutter/material.dart';


class ScreenAwareHelper {

  static const double baseHeight = 650.0;


  static double screenAwareSize(double size, BuildContext context) {
    return size * MediaQuery
        .of(context)
        .size
        .height / baseHeight;
  }

  static const int basePercent = 100;

  static double screenAwareSizePercentHeight(int percent, BuildContext context) {
    return percent * (MediaQuery
        .of(context)
        .size
        .height - 80.0) / basePercent;

  }

  static double screenAwareSizePercentWidth(int percent, BuildContext context) {
    return percent * MediaQuery
        .of(context)
        .size
        .width / basePercent;
  }

  static double screenAwareSizePercentWidthCentered(int percent, BuildContext context,double widgetWidth) {
    return percent * ( MediaQuery
        .of(context)
        .size
        .width - (widgetWidth/2)) / basePercent;
  }
}