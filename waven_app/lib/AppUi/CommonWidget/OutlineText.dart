import 'package:flutter/material.dart';

class OutlineText extends StatelessWidget {

  final String data;
  final TextStyle style;

  final Color innerColor;
  final Color borderColor;
  final double shadowIntensity;
  const OutlineText(this.data, {
    Key key,
    this.style,
    this.innerColor, this.borderColor, this.shadowIntensity : 1,
  }) : assert(data != null);

  Widget build(BuildContext context) {
    return Text(data,
      style: TextStyle(
        inherit: true,
        fontSize: style.fontSize,
        color: innerColor,
        shadows: [
          Shadow( // bottomLeft
              offset: Offset(-shadowIntensity, -shadowIntensity),
              color:borderColor
          ),
          Shadow( // bottomRight
              offset: Offset(shadowIntensity, -shadowIntensity),
              color: borderColor
          ),
          Shadow( // topRight
              offset: Offset(shadowIntensity, shadowIntensity),
              color: borderColor
          ),
          Shadow( // topLeft
              offset: Offset(-shadowIntensity, shadowIntensity),
              color: borderColor
          ),
        ],
      ),
    );
  }
}