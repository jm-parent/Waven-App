import 'package:flutter/material.dart';

class DashboardItemImage extends StatelessWidget {
  DashboardItemImage({
    Key key,
    this.photo,
  }) : super(key: key);

  final String photo;

  Widget build(BuildContext context) {
    return new Material(
      color: Colors.transparent,
      child: Image.asset(
        photo,
        fit: BoxFit.fill,
      ),
    );
  }
}