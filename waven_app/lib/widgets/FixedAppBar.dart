import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class FixedAppBar extends SliverAppBar {

  FixedAppBar(String title,BuildContext context) : super(
    pinned: true,

    leading: IconButton(
      icon: const Icon(FontAwesomeIcons.bars),
      onPressed: () {
        Scaffold.of(context).openDrawer();
      },
    ),
     flexibleSpace: new FlexibleSpaceBar(
      title: new Text(title),
    ),
  );

}