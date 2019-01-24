import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:waven_app/AppUi/GameDataSection/WavenGallery/GalleryItems.dart';
import 'package:waven_app/util/ThemeHelper.dart';
import 'package:url_launcher/url_launcher.dart';

class ArtistCard extends StatefulWidget {

  final ArtistOfflineModel artistItem;

  const ArtistCard({Key key, this.artistItem}) : super(key: key);

  @override
  _ArtistCardState createState() => _ArtistCardState();
}

class _ArtistCardState extends State<ArtistCard> {

  static const double heightCard =140.0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0,vertical: 4.0),
      child: Container(
        height: heightCard,
        decoration:GetBackgroundGradient(),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            _buildHeader(),
            _buildListDrawing()
          ],
        ),
      ),
    );
  }

  _buildListDrawing() {
    var galleryFiltered = GalleryItems.where((draw) => draw.artistName == widget.artistItem.artistName).toList();
    debugPrint('widget.artistItem.artistName :${widget.artistItem.artistName}');
    debugPrint('gallery :${galleryFiltered.length}');
    return Container(
      height: heightCard*2/3,
      child: Padding(
        padding: const EdgeInsets.all(6.0),
        child: ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: galleryFiltered.length,
            itemBuilder: (BuildContext context, int index) {
          return ConstrainedBox(
              constraints: BoxConstraints(maxWidth: 140.0,maxHeight: 150.0),
              child: Padding(
                padding: const EdgeInsets.all(2.0),
                child: CachedNetworkImage(
                  imageUrl: galleryFiltered[index].imageUrl,
                  fit: BoxFit.cover,
                  placeholder: new Center(
                    child: new CircularProgressIndicator(),
                  ),
                  errorWidget: new Icon(Icons.error),
                ),
              ),
          );
        },),
      ),
    );

  }
  _launchURL() async {
    if (await canLaunch(widget.artistItem.refSiteUrl)) {
      await launch(widget.artistItem.refSiteUrl);
    } else {
      throw 'Could not launch ${widget.artistItem.refSiteUrl}';
    }
  }
  _buildHeader() {
        return GestureDetector(
          onTap: _launchURL,
          child: Padding(
            padding: const EdgeInsets.only(top: 3.0,left: 8.0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
              new Container(
                  width: 35.0,
                  height: 35.0,
                  decoration: new BoxDecoration(
                      shape: BoxShape.circle,
                      image: new DecorationImage(
                        fit: BoxFit.fill,
                        image: CachedNetworkImageProvider(widget.artistItem.imagePortraitUrl,),
                      )
                  )),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Text(widget.artistItem.artistName,style: TextStyle(
                            color: Colors.lightBlueAccent,
                            fontSize: 17.0
                          ),),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 3.0),
                            child: widget.artistItem.fromAnkama ? Image.asset('images/Logo_Ankama.png',height: 16.0,):Container(),
                          ),
                        ],
                      ),
                      Text(widget.artistItem.artistDesc,style: TextStyle(
                      color: Colors.grey,
                          fontSize: 12.0
                      ),)
                    ],
                  ),
                ),
              ),
              Row(
                children: <Widget>[
                  Text('more',style: TextStyle(
                    color: Colors.grey
                  ),),
                  Icon(Icons.arrow_forward_ios,color: Colors.grey,),
                ],
              )

            ],),
          ),
        );

  }


  GetBackgroundGradient()
  {
    return new BoxDecoration(
        gradient: new LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          stops: [0.0,0.5,1.0],
          colors: [
            Color(0xFF000000),
            Color(0xFF04353E),
            Color(0xFF0C0C0B),
          ],
        ));
  }
}
