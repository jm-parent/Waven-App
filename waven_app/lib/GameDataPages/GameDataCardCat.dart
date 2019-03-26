import 'package:flutter/material.dart';
import 'package:waven_app/DashboardPages/DashboardTitleCat.dart';

class GameDataCardCat extends StatefulWidget {

  final String titleText;
  final String descText;
  final String urlImage;
  final String assetUrlImage;
  final Widget descWidget;
  final bool isEnableBackground;
  const GameDataCardCat({Key key, this.titleText, this.descWidget, this.urlImage : null,this.assetUrlImage : null,this.isEnableBackground:false, this.descText})
      : super(key: key);

  @override
  GameDataCardCatState createState() {
    return new GameDataCardCatState();
  }
}

class GameDataCardCatState extends State<GameDataCardCat> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        color: Colors.black26,
          child: Stack(
            children: <Widget>[
              widget.isEnableBackground == true?
              new Positioned.fill(
                child:widget.urlImage != null?
                  Image.network(widget.urlImage):
                  Image.asset(widget.assetUrlImage,fit: BoxFit.cover,)
              ):Container(),
              Column(
                children: <Widget>[
                  DashboardTitleCat(titleCat: widget.titleText,isMoreShowed: false,),
                  widget.descWidget,

                ],
              ),
            ],
          )
      ),
    );
  }

  BuildMore()
  {
    return Row(
      children: <Widget>[
        Text("more",style:TextStyle(
          fontSize: 18.0,
          fontFamily: "BebasNeue",)),
        Icon(Icons.chevron_right)

      ],
    );
  }
}

