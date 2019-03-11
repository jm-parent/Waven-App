import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:waven_app/AppUi/ColorsHelper.dart';
import 'package:waven_app/AppUi/GameDataSection/GameDataHelper.dart';
import 'package:waven_app/util/widget_utils.dart';
import 'dart:math' as math;

class GameDataCardV2 extends StatefulWidget {
  final String titleTextP1;
  final String titleTextP2;
  final String urlImage;
  final Function(int) callbackOnTapNavigation;
  final bool isSwapped;
  final GameDataMenu menu;

  const GameDataCardV2(
      {Key key,
        this.titleTextP1,
        this.titleTextP2,
        this.urlImage: null,
        @required this.callbackOnTapNavigation,@required this.menu, this.isSwapped : false,
      })
      : super(key: key);

  @override
  GameDataCardV2State createState() {
    return new GameDataCardV2State();
  }
}

class GameDataCardV2State extends State<GameDataCardV2> {



  @override
  Widget build(BuildContext context) {
    var boxHeight = ScreenAwareHelper.screenAwareSize(80, context);
    return new InkWell(
      onTap: () => widget.callbackOnTapNavigation(widget.menu.index),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          decoration: new BoxDecoration(
              border: new Border.all(color: mainYellow(),width: 1)
          ),
          child: Stack(
            children: <Widget>[
              SizedBox(
                height: ScreenAwareHelper.screenAwareSize(boxHeight, context),
                width: double.infinity,
                child: Stack(
                  children: <Widget>[
                       _buildChildren(),
                    Center(
                      child:Transform.rotate(angle: - math.pi / 4,
                          child: Container(height: boxHeight/4,width: boxHeight/4,
                              decoration: new BoxDecoration(
                                color: mainYellow(),
                                boxShadow: [
                                  BoxShadow(
                                    color: mainYellowD3(),
                                    blurRadius: 10.0, // has the effect of softening the shadow
                                    spreadRadius: 2.0, // has the effect of extending the shadow

                                  )
                                ],)
                          )
                      ),
                    )
                  ],
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }

  _buildChildren() {
    return widget.isSwapped ?
    Row(
        children: <Widget>[
          Expanded(
            child: Image.asset(widget.urlImage,fit: BoxFit.cover,),
          ),
          Expanded(
          child: Container(
            color: mainDarkBlueD1(),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                AutoSizeText(widget.titleTextP1,style: TextStyle(color: mainWhite(),fontSize: 30,fontWeight: FontWeight.bold),maxLines: 1,),
                AutoSizeText(widget.titleTextP2,style: TextStyle(color: mainYellow(),fontSize: 30,fontWeight: FontWeight.bold),maxLines: 1,)
              ],
            ),
          ),
        ),
       ])
        :
    Row(
      children: <Widget>[ Expanded(
      child: Container(
        color: mainDarkBlueD1(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(widget.titleTextP1,style: TextStyle(color: mainWhite(),fontSize: 30,fontWeight: FontWeight.bold)),
            Text(widget.titleTextP2,style: TextStyle(color: mainYellow(),fontSize: 30,fontWeight: FontWeight.bold))
          ],
        ),
      ),
    ),
    Expanded(
    child: Image.asset(widget.urlImage,fit: BoxFit.cover,),
    )]);
  }
}
