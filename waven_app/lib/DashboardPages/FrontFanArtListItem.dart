import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:waven_app/models/DashboardFanArtItemModel.dart';

class FrontFanArtListItem extends StatelessWidget {
  DashboardFanArtItemModel fanArt;
  final fontsize = 15.0;

  FrontFanArtListItem(this.fanArt);

  @override
  Widget build(BuildContext context) {

    return SafeArea(
        top: false,
        bottom: false,
        child: Card(
        child: Container(
          decoration: BoxDecoration(
              border: Border.all(color: Colors.white,width: 1.0)
          ),
          child: Stack(
            children: <Widget>[
              Positioned.fill(
                child: CachedNetworkImage(
                  imageUrl: fanArt.imageNetUrl,
                  fit: BoxFit.cover,
                  placeholder: new CircularProgressIndicator(),
                  errorWidget: new Icon(Icons.error),
                ),
              ),
              Positioned(
                bottom: 13.0,
                left: 0.0,
                right: 0.0,
                child: Container(
                    color: Colors.black38,
                    child: AutoSizeText(fanArt.title,style: TextStyle(fontSize: fontsize+3,color: Colors.transparent)),
              )),
              Positioned(
                bottom: 16.0,
                left: 16.0,
                right: 16.0,
                child: AutoSizeText(fanArt.title,maxLines: 2,style: TextStyle(fontSize: fontsize),),
              ),
            ],
          ),
        ),
        ),
    );
  }
}
