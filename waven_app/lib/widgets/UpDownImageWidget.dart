import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:html/parser.dart' as htmlParser;
import 'package:waven_app/pages/ArticleWebViewPage.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:waven_app/util/EnumHelper.dart';
import 'package:waven_app/widgets/ShadowText.dart';
import 'package:webfeed/domain/rss_item.dart';
import 'package:auto_size_text/auto_size_text.dart';

class UpDownImageWidget extends StatefulWidget {


  final String imageUrl;
  final bool isDesignMode;
  int enterValue;
  final WavenElementalType spellElement;
  final Color colorIcon;
  final Function(responseUpDownModel) callbackUpDownImage;
  UpDownImageWidget({Key key, @required this.imageUrl,this.isDesignMode,this.enterValue,this.spellElement,this.callbackUpDownImage,this.colorIcon = Colors.white})
      : assert(imageUrl != null),
        super(key: key);

  @override
  UpDownImageWidgetState createState() {
    return new UpDownImageWidgetState();
  }
}

class UpDownImageWidgetState extends State<UpDownImageWidget> {

  @override
  Widget build(BuildContext context) {
    return AnimatedCrossFade(
      firstChild: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Image.asset(widget.imageUrl,),
          ShadowText(
            widget.enterValue == null ? '0' : widget.enterValue.toString(),
            style: TextStyle(fontSize: 22.0),
          ),
        ],
      ),
      secondChild: new Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            width: 40,
            child: IconButton(
              icon: Icon(FontAwesomeIcons.plus,color: widget.colorIcon,),
              onPressed: () => setState(() {
                if (widget.enterValue < 20) {
                  widget.enterValue = widget.enterValue + 1;
                  var response = responseUpDownModel(
                      widget.enterValue, widget.spellElement);
                  widget.callbackUpDownImage(response);
                }
              }),
            ),
          ),
          Stack(
            alignment: Alignment.center,
            children: <Widget>[
              Image.asset(widget.imageUrl),
              ShadowText(
                widget.enterValue == null
                    ? '0'
                    : widget.enterValue.toString(),
                style: TextStyle(fontSize: 22.0),
              ),
            ],
          ),
          Container(
            width: 40,
            alignment: Alignment.center,
            child: IconButton(
              icon: Icon(FontAwesomeIcons.minus,color: widget.colorIcon,),
              onPressed: () => setState(() {
                if (widget.enterValue > 0) {
                  widget.enterValue = widget.enterValue - 1;
                  var response = responseUpDownModel(
                      widget.enterValue, widget.spellElement);
                  widget.callbackUpDownImage(response);
                }
              }),
            ),
          ),
        ],
      ),
      crossFadeState:
      widget.isDesignMode ? CrossFadeState.showFirst : CrossFadeState.showSecond,
      duration: Duration(milliseconds: 400),
      firstCurve: Curves.ease,
      secondCurve: Curves.ease,
    );
  }
}


class responseUpDownModel{

  int newValue;
  WavenElementalType elementalType;

  responseUpDownModel(this.newValue, this.elementalType);
}