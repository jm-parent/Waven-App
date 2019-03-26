import 'package:clippy_flutter/point.dart';
import 'package:flutter/material.dart';
import 'package:waven_app/AppUi/ColorsHelper.dart';
import 'package:waven_app/AppUi/GameDataSection/GameDataHelper.dart';
import 'package:waven_app/AppUi/Utils/widget_utils.dart';

class GameDataCard extends StatefulWidget {
  final String titleText;
  final String descText;
  final String urlImage;
  final String assetUrlImage;
  final Widget descWidget;
  final bool isEnableBackground;
  final Function(int) callbackOnTapNavigation;
  final GameDataMenu menu;

  const GameDataCard(
      {Key key,
      this.titleText,
      this.descWidget,
      this.urlImage: null,
      this.assetUrlImage: null,
      this.isEnableBackground: false,
      this.descText, @required this.callbackOnTapNavigation,@required this.menu,
       })
      : super(key: key);

  @override
  GameDataCardState createState() {
    return new GameDataCardState();
  }
}

class GameDataCardState extends State<GameDataCard> {



  @override
  Widget build(BuildContext context) {
    var boxHeight = ScreenAwareHelper.screenAwareSize(80, context);
    return new InkWell(
      onTap: () => widget.callbackOnTapNavigation(widget.menu.index),
      child: Stack(
        children: <Widget>[
          SizedBox(
            height: ScreenAwareHelper.screenAwareSize(boxHeight, context),
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.only(left: 8,right: 20),
              child: Card(
                child: Stack(
                  children: <Widget>[
                    Positioned.fill(child:
                    ClipRRect(borderRadius: BorderRadius.circular(10),child:Image.asset('images/ClassesBg/Dieux.png',fit: BoxFit.cover,) ,)),
                    Positioned.fill(child: ClipRRect(borderRadius: BorderRadius.circular(10),child:Container(color: Colors.black.withOpacity(0.80),) ,)),
                   
                    Positioned(
                      bottom: 0,
                      left: 0,
                      child: Point(
                        triangleHeight: ScreenAwareHelper.screenAwareSize(20, context),
                        clipShadows: [ClipShadow(color: mainYellowL1())],
                        edge: Edge.RIGHT,
                        child:  Container(
                          width: ScreenAwareHelper.screenAwareSize(150, context),
                          height: boxHeight/3,
                          color: mainYellow(),
                          child: Center(child:Text(widget.titleText,style: TextStyle(color: mainDarkBlueD3()),)),
                        ),
                      ),
                    )
                  ],
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                elevation: 2,
                margin: EdgeInsets.all(5),
              ),
            ),
          ),
          Positioned(
              right: 0,
              top: 0,
              bottom: 0,
              child: Image.asset('images/GodIcon/IconCra.png',height: 70,))
        ],
      ),
    );
  }

  GetBackgroundGradient()
  {
      return new BoxDecoration(
          gradient: new LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            stops: [0.0,0.4,0.6,1.0],
            colors: [
            Colors.black12,
            Colors.black.withOpacity(0.6),
            Colors.black.withOpacity(0.6),
            Colors.black12,
            ],
          ));
  }


}
