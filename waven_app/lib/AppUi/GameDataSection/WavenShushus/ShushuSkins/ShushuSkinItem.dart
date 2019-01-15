import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:transparent_image/transparent_image.dart';
import 'package:waven_app/AppUi/CommonPages/ImageViewerPage.dart';
import 'package:waven_app/SpellBuilderWidgets/AnimatedRadialFab.dart';
import 'package:waven_app/models/SkinOfflineModel.dart';
import 'package:waven_app/util/ThemeHelper.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class ShushuSkinItem extends StatefulWidget {
  SkinOfflineModel skinModel;

  ShushuSkinItem({Key key, this.skinModel}) : super(key: key);

  @override
  _ShushuSkinItemState createState() => new _ShushuSkinItemState();
}

class _ShushuSkinItemState extends State<ShushuSkinItem> {
  @override
  Widget build(BuildContext context) {
    debugPrint('skinImage${widget.skinModel.skinImageUrl}');
    return AnimatedContainer(
      height: 200,
      width: MediaQuery.of(context).size.width,
      duration: Duration(milliseconds: 500),
      child: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          GestureDetector(
            onTap: ()=>  Navigator.push(context,
                PageTransition(type: PageTransitionType.rightToLeft, child: ImageViewerPage(imageUrl:widget.skinModel.skinImageUrl,skinName: widget.skinModel.skinName,))),
            child: FittedBox(
              child: Hero(
                tag: 'skinImage${widget.skinModel.skinName}',
                child: FadeInImage.assetNetwork(
                    placeholder: 'images/loading.gif',
                    image: widget.skinModel.skinImageUrl),
              ),
              fit: BoxFit.cover,
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              SizedBox(
                height: 50,
                child: Stack(
                  fit: StackFit.expand,
                  alignment: Alignment.center,
                  children: [
                    Container(color: Colors.black54,),
                    _textOverlay(),
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
    _textOverlay() {
    return Row(
      children: <Widget>[
        SizedBox(width: 5.0,),
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
                AutoSizeText(widget.skinModel.skinName,minFontSize: 2,style: TextStyle(fontWeight: FontWeight.bold),),
              _skinPrice(),
            ],
          ),
        ),
        IconButton(icon: Icon(Icons.shopping_cart), onPressed: ()=>_showDialog()),
      ],
    );
  }

  void _showDialog() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Coming soon...'),
            actions: <Widget>[
              FlatButton(
                child: Text('close'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              )
            ],
          );
        });
  }

  _skinPrice() {
    if(widget.skinModel.skinPrice != null && widget.skinModel.skinPrice != 0.0)
          return Row(
      children: <Widget>[
        AutoSizeText(widget.skinModel.skinPrice.toString(),style: TextStyle(color: Colors.blueGrey[200]),),
        Icon(Icons.euro_symbol,size: 15,color: Colors.blueGrey[200]),
      ],
    );
    else
      return Container();
  }
}
