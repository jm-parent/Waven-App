

import 'package:flutter/material.dart';
import 'package:waven_app/util/WidgetPositionData.dart';

class ArrowMenuContainer extends StatefulWidget {
  var titleText;

  ArrowMenuContainer(this.titleText);

  @override
  ArrowMenuContainerState createState() {
    return new ArrowMenuContainerState();
  }
}

class ArrowMenuContainerState extends State<ArrowMenuContainer> {

  static GlobalKey _keyArrow = GlobalKey();
  WidgetPositionData _keyArrowDesign = new WidgetPositionData(_keyArrow);

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback(_afterLayout);
    super.initState();
  }
  _afterLayout(_) {
    setState(() {
      _keyArrowDesign.UpdateDatas();
    });
  }

  @override
  Widget build(BuildContext context) {
   return Container(
     key: _keyArrow,
     child: Stack(
        children: <Widget>[
          ClipPath(
              clipper: ArrowClipper(),
              child: Container(
                color: Colors.black54,
                child: Center(child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text(widget.titleText, style: TextStyle(fontSize: 22.0,fontWeight: FontWeight.bold,color: Colors.white.withOpacity(0.9))),
                )),
              ),
          ),
          CustomPaint(
            painter: BorderPainter(),
            child: Container(
              height: _keyArrowDesign.height,
            ),
          ),
        ],
      ),
   );
  }

}

class ArrowClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    return GetPath(size);
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

Path GetPath(Size size) {

  var halfHeight = size.height/2;
  var widthOffset = size.width/15;

  var path = new Path();
  path.lineTo(widthOffset, halfHeight);
  path.lineTo(0.0,size.height);
  path.lineTo(size.width - widthOffset, size.height );
  path.lineTo(size.width, halfHeight );
  path.lineTo(size.width- widthOffset, 0.0);
  path.close();

  return path;
}

class BorderPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.0
      ..color = Colors.white.withOpacity(0.4);

    canvas.drawPath(GetPath(size), paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
