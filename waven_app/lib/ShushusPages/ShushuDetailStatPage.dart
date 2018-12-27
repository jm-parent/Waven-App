import 'dart:convert';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:waven_app/ShushusPages/ShushuDetailsEnterAnimation.dart';
import 'package:waven_app/WavenModels/WeaponDefModel.dart';
import 'package:waven_app/util/ThemeHelper.dart';

class ShushuDetailStatPage extends StatefulWidget {
  ShushuDetailStatPage({
    @required this.IdWeapon,
    @required AnimationController controller,
  }) : animation = new ShushuDetailsEnterAnimation(controller);

  final int IdWeapon;
  final ShushuDetailsEnterAnimation animation;

  @override
  ShushuDetailStatPageState createState() {
    return new ShushuDetailStatPageState();
  }
}

class ShushuDetailStatPageState extends State<ShushuDetailStatPage> {
  double indexLvl = 9;
  WeaponDefModel shushuModel;
  Future<WeaponDefModel> _getShushuData() async {
    String jsonHeroes = await _loadShushusAsset(widget.IdWeapon);
    try{
      final jsonResponse = json.decode(jsonHeroes);
      shushuModel= WeaponDefModel.fromJson(jsonResponse);
    }
    catch (e) {
      print(e.toString());
    }
    return shushuModel;
  }

  Future<String> _loadShushusAsset(int shushuId) async {
    return await rootBundle
        .loadString('assets/weapons/${shushuId.toString()}.json');
  }

  @override
  void initState() {
    super.initState();
  }

  Widget _buildAnimation(BuildContext context, Widget child) {
    return _buildContent();
  }

  Widget _buildContent() {
    return FutureBuilder<WeaponDefModel>(
        future: _getShushuData(),
        builder: (context, snapshot) {
          if (snapshot.hasError) print(snapshot.error);
          if (!snapshot.hasData) {
            return Center(child: CircularProgressIndicator());
          } else {
            return new SingleChildScrollView(
              child: new Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  _buildInfo(snapshot),
                  _buildStats(snapshot),
                  _buildSliderLvl(snapshot),
                ],
              ),
            );
          }
        });
  }

  Widget _buildInfo(AsyncSnapshot<WeaponDefModel> snapshot) {
    return new Padding(
      padding: const EdgeInsets.only(top: 16.0, left: 16.0, right: 16.0),
      child: new Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          new Text(
            snapshot.data.textFr.name,
            style: new TextStyle(
              color:
                  Colors.white.withOpacity(widget.animation.nameOpacity.value),
              fontWeight: FontWeight.bold,
              fontSize: 30.0,
            ),
          ),
          new Text(
            "Mocked DATA",
            style: new TextStyle(
              color: Colors.white
                  .withOpacity(widget.animation.locationOpacity.value),
              fontWeight: FontWeight.w500,
            ),
          ),
          new Container(
            color: Colors.white.withOpacity(0.85),
            margin: const EdgeInsets.symmetric(vertical: 16.0),
            width: widget.animation.dividerWidth.value,
            height: 1.0,
          ),
          new Text(
            "Mocked DATA",
            style: new TextStyle(
              color: Colors.white
                  .withOpacity(widget.animation.biographyOpacity.value),
              height: 1.4,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStats(AsyncSnapshot<WeaponDefModel> snapshot) {
    return new Padding(
      padding: const EdgeInsets.only(top: 16.0, left: 16.0, right: 16.0),
      child: new Transform(
        transform: new Matrix4.translationValues(
          widget.animation.videoScrollerXTranslation.value,
          0.0,
          0.0,
        ),
        child: new Opacity(
          opacity: widget.animation.videoScrollerOpacity.value,
          child: new Wrap(
            alignment: WrapAlignment.spaceBetween,
            children: <Widget>[
              IconStatWidget(
                animation: widget.animation,
                assetIcon: "images/ShushuStatUi/icon_life.png",
                value: snapshot.data.life.values[indexLvl.truncate()-1].toString(),
              ),
              IconStatWidget(
                animation: widget.animation,
                assetIcon: "images/ShushuStatUi/icon_attack.png",
                value: snapshot.data.actionValue.values[indexLvl.truncate()-1].toString(),
              ),
              IconStatWidget(
                animation: widget.animation,
                assetIcon: "images/ShushuStatUi/icon_movement.png",
                value: snapshot.data.movementPoints.value.toString(),
              ),
              IconStatWidget(
                  animation: widget.animation,
                  assetIcon: "images/ShushuStatUi/icon_ranged.png",
                  value: snapshot.data.actionRange.toString()),
            ],
          ),
        ),
      ),
    );
  }

  _buildSliderLvl(AsyncSnapshot<WeaponDefModel> snapshot) {
    return Column(
      children: <Widget>[
        SizedBox(height: 30.0,),
        Row(
          children: <Widget>[
            Text("Level : "),
            Expanded(
              child: Slider(
                value: indexLvl,
                  onChanged: ((val) => setState(() => indexLvl = val)),
              min: 1,
              max: 10,
              ),
            ),
          ],
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return new AnimatedBuilder(
      animation: widget.animation.controller,
      builder: _buildAnimation,
    );
  }
}



class IconStatWidget extends StatelessWidget {
  final String value;
  final ShushuDetailsEnterAnimation animation;
  final String assetIcon;

  const IconStatWidget({Key key, this.value, this.animation, this.assetIcon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new Stack(
      alignment: Alignment.center,
      children: <Widget>[
        new Image.asset(
          assetIcon,
          height: 40.0,
        ),
        Positioned(
          child: Text(
            value,
            style: new TextStyle(
              color: Colors.white.withOpacity(animation.nameOpacity.value),
              fontWeight: FontWeight.bold,
              fontSize: 16.0,
            ),
          ),
          right: 15.0,
        )
      ],
    );
  }
}
