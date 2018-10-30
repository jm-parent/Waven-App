import 'package:flutter/material.dart';

class WidgetPositionData {
  final GlobalKey globalKey;

  double widgetHeight;
  double get height => widgetHeight??0.0;
  double widgetWidth;
  double get width => widgetWidth??0.0;

  double get centerOffsetHeight => height == null ? 0.0 : height/2;
  double get centerOffsetWidth => width == null ? 0.0 : width/2;


  WidgetPositionData( this.globalKey);

  //A appeler dans un AfterLayout
  void UpdateDatas() {
    final RenderBox renderBoxBorderElement =
    globalKey.currentContext.findRenderObject();
    final sizeBorderElement = renderBoxBorderElement.size;

    widgetHeight = sizeBorderElement.height;
    widgetWidth = sizeBorderElement.width;
  }
}