import 'package:flutter/material.dart';

class WavenPageWithBackground extends StatelessWidget {
  final Widget child;

  const WavenPageWithBackground({Key key, this.child}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
        image: DecorationImage(image: Image.asset('images/Backgrounds/Background.jpg',).image,fit: BoxFit.cover)
    ),
      child: child,
    );
  }
}
