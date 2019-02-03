import 'package:flutter/material.dart';

class BorderContainer extends StatelessWidget {

 final Widget child;
 final Color borderColor;
 final double borderWidth;
 final double borderRadius;
  const BorderContainer({Key key, this.borderColor = Colors.transparent, this.borderWidth=4,@required this.child, this.borderRadius=8}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new Container(
      decoration: new BoxDecoration(
          border: new Border.all(
              color: borderColor,
            width: borderWidth,
          ),
        borderRadius: BorderRadius.all(Radius.circular(borderRadius))
      ),

      child: child,
    );
  }
}
