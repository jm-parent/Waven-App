import 'package:flutter/material.dart';

class ElementalWavenWidget extends StatefulWidget {

  final Widget imageChild;
  final String textChild;
  final double fontsizeChild;
  const ElementalWavenWidget({Key key, this.imageChild, this.textChild, this.fontsizeChild : 18}) : super(key: key);

  @override
  _ElementalWavenWidgetState createState() => _ElementalWavenWidgetState();
}

class _ElementalWavenWidgetState extends State<ElementalWavenWidget> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: <Widget>[
        widget.imageChild,
        Text(widget.textChild,style: TextStyle(fontSize: widget.fontsizeChild,fontWeight: FontWeight.bold,),)
      ],
    );
  }
}
