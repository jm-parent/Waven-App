import 'package:flutter/material.dart';

class SimpleRoundText extends StatelessWidget {

final String value;

  const SimpleRoundText({Key key, this.value}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.only(left: 8.0,bottom: 4.0,right: 8.0),
      child: ClipRRect(
          borderRadius: new BorderRadius.circular(8.0),
          child: Container(
            color: Color(0xFF263238),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8,vertical: 4),
              child: Text(value),
            ),
          )
      ),
    );
  }
}
