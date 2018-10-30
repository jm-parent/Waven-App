

import 'package:flutter/material.dart';
import 'package:waven_app/util/ThemeHelper.dart';
import 'package:waven_app/util/WidgetPositionData.dart';
import 'package:waven_app/util/widget_utils.dart';

class ParallelogramContainer extends StatefulWidget {
  Widget widgetParam;

  ParallelogramContainer(this.widgetParam);

  @override
  ParallelogramContainerState createState() {
    return new ParallelogramContainerState();
  }
}

class ParallelogramContainerState extends State<ParallelogramContainer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: <Widget>[
          ClipPath(
            clipper: ParallelogramClipper(),
            child: Container(
              color: Color.fromRGBO(16,37,64,1.0),
              child: Center(child: Padding(
                padding: EdgeInsets.all(ScreenAwareHelper.screenAwareSize(15.0, context)),
                child: widget.widgetParam,
              )),
            ),
          ),
          //La bordure
        ],
      ),
    );
  }

}


class ParallelogramClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    return GetPath(size);
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}


Path GetPath(Size size) {

  var widthOffset = size.width/15;

  var path = new Path();
  path.moveTo(widthOffset,0.0);
  path.lineTo(0.0,size.height);
  path.lineTo(size.width - widthOffset,size.height);
  path.lineTo(size.width, 0.0 );
  path.close();

  return path;
}
//
//class BorderPainter extends CustomPainter {
//  @override
//  void paint(Canvas canvas, Size size) {
//    Paint paint = Paint()
//      ..style = PaintingStyle.stroke
//      ..strokeWidth = 1.0
//      ..color = Colors.white.withOpacity(0.4);
//
//    canvas.drawPath(GetPath(size), paint);
//  }
//
//  @override
//  bool shouldRepaint(CustomPainter oldDelegate) => true;
//}
