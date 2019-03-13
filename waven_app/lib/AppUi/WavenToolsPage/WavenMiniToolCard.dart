import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:waven_app/AppUi/ColorsHelper.dart';
import 'package:waven_app/AppUi/CommonWidget/SnapshotNullLoadingIndicator.dart';
import 'package:waven_app/AppUi/WavenToolsPage/WavenToolsMenuModel.dart';

class WavenMiniToolCard extends StatefulWidget {
  final WavenToolsMenuModel model;

  const WavenMiniToolCard({Key key, this.model, }) : super(key: key);
  @override
  _WavenMiniToolCardState createState() => _WavenMiniToolCardState();
}

class _WavenMiniToolCardState extends State<WavenMiniToolCard> {
  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.all(4.0),
      child: ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(12.0)),
        child: Container(
          width: 80,
          color: mainDarkBlueD1(),
          child: Column(
            children: <Widget>[
              Expanded(
                flex:2,
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CachedNetworkImage(
                      imageUrl: widget.model.imageUrl,
                      fit: BoxFit.cover,
                      placeholder: (context, url) => SnapshotLoadingIndicator(),
                      errorWidget: (context, url, error) => new Icon(Icons.error),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal:4.0),
                    child: AutoSizeText(widget.model.name,
                      maxLines: 1,
                      style:
                    TextStyle(
                        fontWeight: FontWeight.bold,
                        color: mainYellowL1(),
                    ),),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
