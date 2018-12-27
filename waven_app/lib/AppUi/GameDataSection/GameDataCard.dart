import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';
import 'package:waven_app/AppUi/GameDataSection/GameDataHelper.dart';
import 'package:waven_app/DashboardPages/DashboardDescCat.dart';
import 'package:waven_app/DashboardPages/DashboardTitleCat.dart';

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
    return new InkWell(
      onTap: () => widget.callbackOnTapNavigation(widget.menu.index),
      child: SizedBox(
        height: 120.0,
        child: Card(
          semanticContainer: true,
          clipBehavior: Clip.antiAliasWithSaveLayer,
          child: Stack(
            fit: StackFit.expand,
            children: <Widget>[
              widget.isEnableBackground == true
                  ? widget.urlImage != null
                      ? new FadeInImage.memoryNetwork(
                          placeholder: kTransparentImage,
                          image: widget.urlImage,
                          fit: BoxFit.cover,
                        )
                      : Image.asset(
                          widget.assetUrlImage,
                          fit: BoxFit.cover,
                        )
                  : Container(),
              //Container(decoration: GetBackgroundGradient(),),
              Container(color:  Colors.black.withOpacity(0.6),),
              Center(
                child: Text(widget.titleText,
                style: TextStyle(
                  fontSize: 26.0
                ),),
              ),
            ],
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          elevation: 5,
          margin: EdgeInsets.all(5),
        ),
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
