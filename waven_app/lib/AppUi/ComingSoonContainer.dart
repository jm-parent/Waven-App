import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:waven_app/AppUi/ColorsHelper.dart';

class ComingSoonContainer extends StatefulWidget {
  final Widget child;

  const ComingSoonContainer({Key key, this.child}) : super(key: key);

  @override
  _ComingSoonContainerState createState() => _ComingSoonContainerState();
}

class _ComingSoonContainerState extends State<ComingSoonContainer> {
  @override
  Widget build(BuildContext context) {

    double sizeComingFont = 30;
    double sizeSoonFont = sizeComingFont- sizeComingFont/6;

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Stack(
        children: <Widget>[
          widget.child,
          Positioned.fill(child:     Container(
            color: Colors.black87,
          ),),
          Positioned.fill(child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              AutoSizeText(
                "Coming",
                style: TextStyle(color: mainWhite(),fontSize: sizeComingFont),
              ),
              AutoSizeText(
                "Soon",
                style: TextStyle(color: mainYellow(),fontSize: sizeSoonFont),
              ),
            ],
          ))

        ],
      ),
    );
  }
}
