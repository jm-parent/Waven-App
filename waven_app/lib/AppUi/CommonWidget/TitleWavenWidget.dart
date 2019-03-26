import 'package:flutter/material.dart';

class TitleWavenWidget extends StatefulWidget {

  final String title;
  final double titleSize;
  final Color titleColor;
  final Color leadingIconColor;
  final IconData leadingIcon;
  final Color underLineColor;
  final double underLineHeight;
  final double underLineWidth;
  const TitleWavenWidget({Key key, this.title :"",
    this.titleColor,
    this.leadingIconColor,
    this.leadingIcon : Icons.arrow_right,
    this.underLineColor,
    this.underLineHeight : 2,
    this.underLineWidth : 80,
    this.titleSize:20}) : super(key: key);

  @override
  _TitleWavenWidgetState createState() => _TitleWavenWidgetState();
}

class _TitleWavenWidgetState extends State<TitleWavenWidget> {
  @override
  Widget build(BuildContext context) {
    return new Padding(
      padding: const EdgeInsets.only(top: 16.0, left: 16.0, right: 16.0),
      child: new Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              new Icon(widget.leadingIcon,color: widget.leadingIconColor,),
              new Text(
                widget.title,
                style: new TextStyle(
                  color: widget.titleColor,
                  fontWeight: FontWeight.bold,
                  fontSize: widget.titleSize,
                ),
              ),
            ],
          ),
          new Container(
            color: widget.underLineColor,
            margin: const EdgeInsets.symmetric(vertical: 3.0),
            width: widget.underLineWidth,
            height: widget.underLineHeight,
          ),
        ],
      ),
    );
  }
}
