import 'package:flutter/material.dart';
import 'dart:math' as math;

import 'package:waven_app/util/EnumHelper.dart';
import 'package:waven_app/util/widget_utils.dart';

class AnimatedFab extends StatefulWidget {
  final VoidCallback onClick;
  final bool isClickable;
  final Function(WavenEffectType) callbackEffect;
  const AnimatedFab({Key key, this.onClick,this.callbackEffect,this.isClickable = true}) : super(key: key);

  @override
  _AnimatedFabState createState() => new _AnimatedFabState();
}

class _AnimatedFabState extends State<AnimatedFab>
    with SingleTickerProviderStateMixin {
  AnimationController _animationController;
  Animation<Color> _colorAnimation;
  final double expandedSize = 120.0;
  final double hiddenSize = 20.0;
  Color backgroundColor;
  String selectedEffectImage;
  WavenEffectType selectedEffectType;


  @override
  void initState() {
    super.initState();
    backgroundColor = Colors.blueGrey.withOpacity(0.5);
    selectedEffectType = null;
    selectedEffectImage = "";
    _animationController = new AnimationController(
        vsync: this, duration: Duration(milliseconds: 200));
    _colorAnimation =
        new ColorTween(begin: Colors.amber, end: Colors.amber[800])
            .animate(_animationController);
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new SizedBox(
      width: expandedSize,
      height: expandedSize,
      child: new AnimatedBuilder(
        animation: _animationController,
        builder: (BuildContext context, Widget child) {
          return new Stack(
            alignment: Alignment.center,
            children: <Widget>[
              _buildExpandedBackground(),
              _buildOptionImage(
                  WavenEffectType.air, math.pi * 3 / 4, Colors.purple),
              _buildOptionImage(
                  WavenEffectType.earth, -math.pi * 3 / 4, Colors.green),
              _buildOptionImage(
                  WavenEffectType.fire, math.pi / 4, Colors.deepOrange),
              _buildOptionImage(
                  WavenEffectType.water, -math.pi / 4, Colors.lightBlueAccent),
              _buildFabCore(),
            ],
          );
        },
      ),
    );
  }

  Widget _buildFabCore() {
    double scaleFactor = 2 * (_animationController.value - 0.5).abs();
    return Container(
      width: ScreenAwareHelper.screenAwareSize(30.0, context),
      child: new FloatingActionButton(

        onPressed: _onFabTap,
        child: new Transform(
            alignment: Alignment.center,
            transform: new Matrix4.identity()..scale(1.0, scaleFactor),
            child: _animationController.value > 0.5
                ? new Icon(
                    Icons.close,
                    color: Colors.white,
                    size: 20.0,
                  )
                : selectedEffectType != WavenEffectType.noeffect
                    ? new Image.asset(
                        selectedEffectImage,
                        width: 20.0,
                      )
                    : new Icon(
                        Icons.add,
                        color: Colors.white,
                        size: 20.0,
                      )),

        backgroundColor: backgroundColor, //_colorAnimation.value,
      ),
    );
  }

  Widget _buildExpandedBackground() {
    double size =
        hiddenSize + (expandedSize - hiddenSize) * _animationController.value;
    return new Container(
      height: size,
      width: size,
      decoration:
          new BoxDecoration(shape: BoxShape.circle, color: backgroundColor),
    );
  }

  Widget _buildOption(IconData icon, double angle) {
    double iconSize = 0.0;
    if (_animationController.value > 0.8) {
      iconSize = 26.0 * (_animationController.value - 0.8) * 5;
    }
    return new Transform.rotate(
      angle: angle,
      child: new Align(
        alignment: Alignment.topCenter,
        child: new Padding(
          padding: new EdgeInsets.only(top: 8.0),
          child: new IconButton(
            onPressed: null,
            icon: new Transform.rotate(
              angle: -angle,
              child: new Icon(
                icon,
                color: Colors.white,
              ),
            ),
            iconSize: iconSize,
            alignment: Alignment.center,
            padding: new EdgeInsets.all(0.0),
          ),
        ),
      ),
    );
  }

  Widget _buildOptionImage(WavenEffectType effect, double angle, Color bg) {
    print("$effect");
    var imagePath = EffectToImageurl[effect];
    print("avant imagePath");
    print("$imagePath");
    print("après imagePath");
    double iconSize = 0.0;
    if (_animationController.value > 0.8) {
      iconSize = 26.0 * (_animationController.value - 0.8) * 5;
    }
    return new Transform.rotate(
      angle: angle,
      child: new Align(
        alignment: Alignment.topCenter,
        child: new Padding(
          padding: new EdgeInsets.only(top: 1.0),
          child: new IconButton(
            onPressed: () {
              _onFabTap();
              backgroundColor = bg.withOpacity(0.5);
              selectedEffectImage = imagePath;
              selectedEffectType = effect;
              widget.callbackEffect(effect);
            },
            icon: new Transform.rotate(
              angle: -angle,
              child: new Image.asset(
                imagePath,
                width: iconSize,
              ),
            ),
            iconSize: iconSize,
            alignment: Alignment.center,
            padding: new EdgeInsets.all(0.0),
          ),
        ),
      ),
    );
  }

  WavenEffectType getSelectedElement() {
    return selectedEffectType;
  }

  open() {
    if (_animationController.isDismissed && widget.isClickable) {
      _animationController.forward();
    }
  }

  close() {
    if (_animationController.isCompleted && widget.isClickable) {
      _animationController.reverse();
    }
  }

  _onFabTap() {
    if (_animationController.isDismissed && widget.isClickable) {
      open();
    } else if(widget.isClickable) {
      if (selectedEffectType != null) {
        backgroundColor = Colors.blueGrey.withOpacity(0.5);
        selectedEffectImage = "";
        selectedEffectType = WavenEffectType.noeffect;
      }
      close();
    }
  }
}

Map<WavenEffectType, String> EffectToImageurl = new Map.from({
  WavenEffectType.air:
  'images/spellmaker_res/character_ui_elementary_state_air.png',
  WavenEffectType.earth:
  'images/spellmaker_res/character_ui_elementary_state_earth.png',
  WavenEffectType.fire:
  'images/spellmaker_res/character_ui_elementary_state_fire.png',
  WavenEffectType.water:
  'images/spellmaker_res/character_ui_elementary_state_water.png',
});
