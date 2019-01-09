import 'package:flutter/material.dart';

class RoundConnerBottomSheet extends StatelessWidget {
  final Widget child;
  final Color backgroundColor;

  const RoundConnerBottomSheet({Key key, this.backgroundColor, this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new Container(
      color: Colors.transparent,
      child: new Container(
          decoration: new BoxDecoration(
              color: backgroundColor ?? Colors.grey,
              borderRadius: new BorderRadius.only(
                  topLeft: const Radius.circular(10.0),
                  topRight: const Radius.circular(10.0))),
          child: child),
    );
  }
}