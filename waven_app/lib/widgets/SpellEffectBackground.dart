import 'package:flutter/material.dart';

class SpellEffectWidget extends StatelessWidget {
  var titleText;

  SpellEffectWidget(this.titleText);

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      child: Container(
        color: Colors.grey.withOpacity(0.2),
       child: Center(child: Padding(
         padding: const EdgeInsets.only(top:10.0,bottom: 15.0),
         child: Text(titleText, style: TextStyle(fontSize: 22.0,fontStyle: FontStyle.italic)),
       )),
      ),
      clipper: BottomFangsClipper(),
    );
  }
}

class BottomFangsClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {

    var path = new Path();

    //widths
    var firstdownpointwidth = size.width/20;
    var firstuppointwidth = size.width/10;
    var seconddownpointwidth = size.width - size.width/10;
    var seconduppointwidth = size.width - size.width/20;

    //height
    var uppointheight = size.height - size.height/4;


    path.lineTo(0.0, uppointheight);
    path.lineTo(firstdownpointwidth, size.height);
    path.lineTo(firstuppointwidth, uppointheight);
    path.lineTo(seconddownpointwidth, uppointheight);
    path.lineTo(seconduppointwidth, size.height );
    path.lineTo(size.width, uppointheight);
    path.lineTo(size.width, 0.0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}