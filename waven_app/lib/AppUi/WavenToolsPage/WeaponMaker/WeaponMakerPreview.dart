import 'dart:io';
import 'dart:ui' as ui;

import 'package:auto_size_text/auto_size_text.dart';
import 'package:esys_flutter_share/esys_flutter_share.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:waven_app/AppUi/ColorsHelper.dart';
import 'package:waven_app/AppUi/CommonWidget/SnapshotNullLoadingIndicator.dart';
import 'package:waven_app/AppUi/CommonWidget/WavenCompanionAppBar.dart';
import 'package:waven_app/AppUi/WavenToolsPage/WeaponMaker/WeaponMakerModel.dart';

class WeaponMakerPreview extends StatefulWidget {
  final WeaponMakerModel model;

  const WeaponMakerPreview({Key key, this.model}) : super(key: key);
  @override
  _WeaponMakerPreviewState createState() => _WeaponMakerPreviewState();
}

class _WeaponMakerPreviewState extends State<WeaponMakerPreview> {

  static GlobalKey previewWeaponMaker = new GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: new FloatingActionButton(
        foregroundColor: mainDarkBlue(),
        backgroundColor: mainYellowD1(),
        onPressed: takeScreenShot,
        child: Icon(Icons.share),
      ),
      backgroundColor: mainDarkBlueD2(),
      appBar: WavenCompanionAppbar(),
      body: Padding(
        padding: const EdgeInsets.only(top:20.0,left: 20,right: 20,bottom: 40),
        child: RepaintBoundary(
          key: previewWeaponMaker,
          child: ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(12.0)),
            child: Container(
              color: mainDarkBlue(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  _buildTitle(widget.model.name,30),
                  _buildWeaponImage(),
                  Expanded(
                    child: Column(
                      children: <Widget>[
                        _buildTitle('PASSIF',30),
                        _buildWeaponDesc(),
                      ],
                    ),
                  ),
                 Expanded(
                   flex: 2,
                   child: Column(
                     children: <Widget>[
                       _buildTitle('ACTIF',30),
                       Row(
                         children: <Widget>[
                           Column(
                             crossAxisAlignment: CrossAxisAlignment.start,
                             children: <Widget>[
                               _buildActifName(),
                               _buildActifCost(),
                             ],
                           ),
                           Spacer(),
                           _buildActifImage(),
                         ],
                       ),
                       _buildActifDesc(),
                     ],
                   ),
                 )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  _buildTitle(String s, double i) {
    return Padding(
      padding: const EdgeInsets.only(left:8.0,right: 8.0,top: 8.0,bottom: 4.0),
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Text(s??'',textAlign: TextAlign.left,style: TextStyle(fontFamily: "BebasNeue",fontSize: i),),
            ],
          ),
          SizedBox(height: 2.0,
              child: Container(color: mainYellowL2()))
        ],
      ),
    );
  }

  _buildWeaponImage() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Center(
        child: Container(
          width:  MediaQuery.of(context).size.width*0.75,
          height: 150.0,
          child: Center(
            child: Hero(
              tag: 'WeaponImageTag',
              child: widget.model.weaponImage == null ? SnapshotLoadingIndicator()
                :Image.file(File.fromUri(Uri.file(widget.model.weaponImage)),
            ),
          ),
        ),
      ),
    ));
  }

  _buildWeaponDesc() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: AutoSizeText(widget.model.passifDesc??'',minFontSize: 15,maxFontSize: 25,maxLines: 4, style: TextStyle(fontFamily: 'Roboto',fontWeight: FontWeight.w300,fontStyle: FontStyle.normal),),
    );
  }
  _buildActifName() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal:8.0,vertical: 4.0),
      child: Text(widget.model.actifName?.toUpperCase()??'',style: TextStyle(fontFamily: 'BebasNeue',fontWeight: FontWeight.w300,fontStyle: FontStyle.normal,fontSize: 20),),
    );
  }
  _buildActifImage() {
    return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Container(
            child: Center(
              child: Hero(
                tag: 'ActifImageTag',
                child: widget.model.actifImage == null ? SnapshotLoadingIndicator()
                    :Image.file(File.fromUri(Uri.file(widget.model.actifImage),),
                  height: 40,
                ),
              ),
            ),
          ),
        ));
  }
  _buildActifDesc() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal:8.0),
      child: AutoSizeText(widget.model.actifDesc??'',minFontSize: 15,maxFontSize: 25,maxLines: 4, style: TextStyle(fontFamily: 'Roboto',fontWeight: FontWeight.w300,fontStyle: FontStyle.normal),),
    );
  }
  _buildActifCost() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal:8.0),
      child:  Text(widget.model.actifCost?.toUpperCase()??'',style: TextStyle(fontFamily: 'BebasNeue',fontWeight: FontWeight.w300,fontStyle: FontStyle.normal,fontSize: 16),),
    );
  }

  takeScreenShot() async {
    RenderRepaintBoundary boundary =
    previewWeaponMaker.currentContext.findRenderObject();
    ui.Image image = await boundary.toImage();
    ByteData byteData = await image.toByteData(format: ui.ImageByteFormat.png);
    await EsysFlutterShare.shareImage(
        '${widget.model.name}.png',
        byteData,'${widget.model.name}');
  }
}
