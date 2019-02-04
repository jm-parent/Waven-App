import 'package:flutter/material.dart';

final GradientEni =new LinearGradient(
  begin: Alignment.centerLeft,
  end: Alignment.centerRight,
  stops: [0.0,0.55,1],
  colors: [
    Color(0xFFFF9A8B),
    Color(0xFFFF6A88),
    Color(0xFFFF99AC),
  ],
);



final GradientKrosmoz =new LinearGradient(
  begin: Alignment.bottomLeft,
  end: Alignment.topRight,
  stops: [0.0,0.55,1],
  colors: [
    Color(0xFFFF3CAC),
    Color(0xFF784BA0),
    Color(0xFF2B86C5),
  ],
);


final GradientBlue =new LinearGradient(
  begin: Alignment.bottomLeft,
  end: Alignment.topRight,
  stops: [0.0,1],
  colors: [
    Color(0xFF0A5EA7),
    Color(0xFF080A2F),
  ],
);


final GradientAppBar =new LinearGradient(
  begin: Alignment.centerLeft,
  end: Alignment.centerRight,
  stops: [0.0,0.33,0.66,1],
  colors: [
    Color(0xFF610305),
    Color(0xFF230648),
    Color(0xFF1F185A),
    Color(0xFF025173),
  ],
);
