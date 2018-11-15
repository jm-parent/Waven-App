import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:waven_app/models/DashboardFanArtItemModel.dart';
import 'package:waven_app/util/MockDataHelper.dart';

class BackFanArtListItem extends StatelessWidget {
  DashboardFanArtItemModel fanArt;


  BackFanArtListItem(this.fanArt);

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
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
            Text('Réalisé par :'),
            Text(fanArt.artisteName),
          ]
          ),
        ),
      ),
    );
  }


}
