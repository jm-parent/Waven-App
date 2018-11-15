import 'package:flutter/material.dart';

class NavigationBottomAppBar extends StatefulWidget {
  @override
  _NavigationBottomAppBarState createState() => _NavigationBottomAppBarState();
}

class _NavigationBottomAppBarState extends State<NavigationBottomAppBar> {
  @override
  Widget build(BuildContext context) {
   return BottomAppBar(
     child: Row(
       mainAxisSize: MainAxisSize.max,
       mainAxisAlignment: MainAxisAlignment.spaceBetween,
       children: <Widget>[],
     ),
     shape: CircularNotchedRectangle(),
     color: Colors.blueGrey,
   );
  }
}
