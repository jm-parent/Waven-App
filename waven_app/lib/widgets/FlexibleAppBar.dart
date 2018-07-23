import 'package:flutter/material.dart';

class FlexibleAppBar extends SliverAppBar {
  static const double height = 256.0;
  static bool isAssetValue = false;
  FlexibleAppBar(String title, String imageUrl,bool isAsset) : super(
    pinned: true,
    backgroundColor: Colors.blueGrey,
      flexibleSpace: new FlexibleSpaceBar(
          title: new Text(title),
          background: _buildBackground(imageUrl),

      ),
    expandedHeight : height,

  )
  {
    isAssetValue = isAsset;
  }

  static Widget _buildBackground(String imageUrl) {
    return new Stack (
        children: <Widget>[
          isAssetValue ?
          new Image.asset(imageUrl,fit: BoxFit.cover,height: height):
          new Image.network(
              imageUrl,
              fit: BoxFit.cover,
              height: height
          ),
          new DecoratedBox(
              decoration: new BoxDecoration(
                  gradient: new LinearGradient(
                      begin: const FractionalOffset(0.5, 0.6),
                      end: const FractionalOffset(0.5, 1.0),
                      colors: <Color>[const Color(0x00000000), const Color(0x70000000)]
                  )
              )
          )
        ]
    );
  }

}