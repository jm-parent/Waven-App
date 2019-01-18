import 'package:flutter/material.dart';

class BottomWaveClipper extends CustomClipper<Path> {

  var factor = 2;
  @override
  Path getClip(Size size) {
    var path = new Path();
    path.lineTo(0.0, size.height );

    var firstControlPoint = Offset(size.width / 4, size.height);
    var firstEndPoint = Offset(size.width / 2.25, size.height - 6.0*factor);
    path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy,
        firstEndPoint.dx, firstEndPoint.dy);

    var secondControlPoint =
    Offset(size.width - (size.width / 3.25), size.height - 13*factor);
    var secondEndPoint = Offset(size.width, size.height - 8*factor);
    path.quadraticBezierTo(secondControlPoint.dx, secondControlPoint.dy,
        secondEndPoint.dx, secondEndPoint.dy);

    path.lineTo(size.width, size.height - 4*factor);
    path.lineTo(size.width, 0.0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}