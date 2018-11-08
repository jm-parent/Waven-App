import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:waven_app/models/DeckModel.dart';
import 'package:waven_app/pages/DeckDetailPage.dart';

class FadeRoute<T> extends MaterialPageRoute<T> {
  FadeRoute({ WidgetBuilder builder, RouteSettings settings })
      : super(builder: builder, settings: settings);

  @override
  Widget buildTransitions(BuildContext context,
      Animation<double> animation,
      Animation<double> secondaryAnimation,
      Widget child) {
    if (settings.isInitialRoute)
      return child;
    // Fades between routes. (If you don't want any animation,
    // just return child.)
    return new FadeTransition(opacity: animation, child: child);
  }
}


class DeckDetailPageTransition extends CupertinoPageRoute {
  DeckModel deck;
  DeckDetailPageTransition({this.deck})
      : super(builder: (BuildContext context) => new DeckDetailPage(deck));


  // OPTIONAL IF YOU WISH TO HAVE SOME EXTRA ANIMATION WHILE ROUTING
  @override
  Widget buildPage(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation) {
    return new FadeTransition(opacity: animation, child: new DeckDetailPage(deck));
  }
}