import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'dart:ui' as ui;

class BlurredImageBackground extends StatelessWidget {

  final Widget child;
  final String urlBackground;
  final double blurDouble;

  BlurredImageBackground({
    key,
    @required this.child,
    @required this.urlBackground,
    this.blurDouble = 3.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new Stack(
      children: <Widget>[
        new Positioned.fill(
          child: new CachedNetworkImage(
            imageUrl: urlBackground,
            fit: BoxFit.cover,
            placeholder: new Center(
              child: new CircularProgressIndicator(),
            ),
            errorWidget: new Icon(Icons.error),
          ),
        ),
        Container(
          alignment: Alignment.centerLeft,
          child: new BackdropFilter(
            filter: new ui.ImageFilter.blur(sigmaX: 3.0, sigmaY: 3.0),
            child: new Container(
              //you can change opacity with color here(I used black) for background.
              decoration: new BoxDecoration(color: Colors.black.withOpacity(0.4)),
              child: child,
            ),
          ),
        ),
      ],
    );
  }
}