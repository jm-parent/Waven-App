import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';
import 'package:waven_app/models/HeroModelV2.dart';

class HeroListItem extends StatefulWidget {
  final HeroClassV2 _heroData;

  HeroListItem(this._heroData);

  @override
  _HeroListItemState createState() => _HeroListItemState();
}

class _HeroListItemState extends State<HeroListItem> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            child: SizedBox(
              height: 120.0,
              child: Stack(
                children: <Widget>[
                  Positioned(
                    top: 16.0,
                    left: 50.0,
                    right: 8.0,
                    bottom: 8.0,
                    child: Card(
                      child: Column(children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(left: 70.0,top:4.0,bottom: 4.0,right: 4.0),
                          child: Text(widget._heroData.heroName,style: TextStyle(fontSize: 18.0),),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 70.0,top:4.0,bottom: 4.0,right: 4.0),
                          child: Text(widget._heroData.lore,style: TextStyle(fontSize: 14.0),overflow: TextOverflow.ellipsis,maxLines: 3,),
                        ),
                      ],),
                    ),
                  ),
                  Positioned(
                    top: 4.0,
                    left: 4.0,
                    child: FittedBox(
                      fit: BoxFit.scaleDown,
                      alignment: Alignment.centerLeft,
                      child: Hero(
                        tag: widget._heroData.tag,
                        child: FadeInImage.memoryNetwork(
                          placeholder: kTransparentImage,
                          image: widget._heroData.img,
                          height: 80.0,
                        ),
                      ),
                    ),
                  ),

                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
