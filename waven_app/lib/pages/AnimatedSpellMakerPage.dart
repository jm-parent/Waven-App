import 'dart:io';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:image_picker/image_picker.dart';
import 'package:waven_app/SpellBuilderWidgets/AnimatedRadialFab.dart';

import 'package:waven_app/SpellBuilderWidgets/SpellPlaceholder.dart';
import 'package:waven_app/models/SpellMakerModel.dart';
import 'package:waven_app/util/BlurredImageBackground.dart';
import 'package:waven_app/util/EnumHelper.dart';
import 'package:waven_app/util/VisibilityTool.dart';
import 'package:waven_app/util/WidgetPositionData.dart';
import 'package:waven_app/util/widget_utils.dart';
import 'package:waven_app/widgets/PlaceholderWidget.dart';
import 'package:waven_app/widgets/ShadowText.dart';
import 'package:waven_app/widgets/SpellEffectBackground.dart';

class AnimatedSpellMakerPage extends StatefulWidget {
  @override
  _AnimatedSpellMakerPageState createState() =>
      new _AnimatedSpellMakerPageState();
}

class _AnimatedSpellMakerPageState extends State<AnimatedSpellMakerPage>
    with TickerProviderStateMixin {
  AnimationController _controllerPaAnim;
  Animation _animationPa;
  AnimationController _controllerBorderShiver;
  Animation _animationBorderShiver;

  //radialEffect
  WidgetPositionData _radialEffectEdit;
  WidgetPositionData _radialEffectDesign;
  WidgetPositionData _skillDescDesign;
  WidgetPositionData _borderElement;

  WidgetPositionData _logoPAElementEdit;

  bool isDesignMode = true;
  final _scaffoldKey = new GlobalKey<ScaffoldState>();

  SpellMakerModel customSpellModel =
      new SpellMakerModel(); // Model de données du sort
  var borderElementPosition;
  var screenHeightMax;
  var screenWidthMax;
  int positionBorderElementHeight = 1;
  int positionBorderElementWidth = 1;
  double percentTopBorderElementHeight = 1.0;
  int percentBorderElementWidth = 1;
  double borderElementHeight;
  double borderElementWidth;

  //Translate PA
  var translateX = Tween<double>(begin: 0.0, end: -100.0);
  Future<File> _imageFile; // Image chargée
  bool stepImageLoaded = false;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback(_afterLayout);

    super.initState();
    _controllerPaAnim = new AnimationController(
        duration: new Duration(milliseconds: 400), vsync: this)
      ..addListener(() {
        this.setState(() {});
      });
    Tween _twTranslateX = new Tween<double>(
      begin: 0.0,
      end: 100.0,
    );
    _animationPa = _twTranslateX.animate(_controllerPaAnim);
    _controllerPaAnim.reverse();

    _skillDescDesign = new WidgetPositionData(_keySkillDescDesign);
    _borderElement = new WidgetPositionData(_keyBorderElement);
    _radialEffectEdit = new WidgetPositionData(_keyRadialEffectEdit);
    _radialEffectDesign = new WidgetPositionData(_keyRadialEffectDesign);
  }

// ...Boilerplate...

  _afterLayout(_) {
    _updateBorderElementPositions();
    setState(() {
      _borderElement.UpdateDatas();
      _radialEffectEdit.UpdateDatas();
      _radialEffectDesign.UpdateDatas();
      _skillDescDesign.UpdateDatas();
    });
  }

  @override
  Widget build(BuildContext context) {
    screenHeightMax =
        ScreenAwareHelper.screenAwareSizePercentHeight(100, context);
    screenWidthMax =
        ScreenAwareHelper.screenAwareSizePercentWidth(100, context);

    var borderElementYPercentPosition = 65;
    //Valeur
    var radialEffectTopOffset = isDesignMode == true
        ? _radialEffectDesign.height / 2
        : _radialEffectEdit.height / 2;
    var radialEffectLeftOffset =
        isDesignMode == true ? _radialEffectDesign.width / 2 : 0;
    var borderElementLeftOffset =
        (_borderElement.width == null ? 0 : _borderElement.width / 2);
    var radialEffectTopLeftOffsetBorderOnImage = isDesignMode == true
        ? ScreenAwareHelper.screenAwareSize(12.0, context)
        : 0;

    if (_radialEffectEdit != null && _radialEffectEdit.height != null)
      print("Height Radial Menu = " + _radialEffectEdit.height.toString());
    return new Scaffold(
      key: _scaffoldKey,
      floatingActionButton: buildSpeedDial(),
      //  appBar: AppBar(key: _appBarKey, title: GetTitle()),
      body: Container(
        decoration: new BoxDecoration(
          gradient: new LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            stops: [0.1, 0.5, 0.7, 0.9],
            colors: [
              Colors.blueGrey[800],
              Colors.blueGrey[700],
              Colors.blueGrey[600],
              Colors.blueGrey[500],
            ],
          ),
        ),
        child: Column(
          children: <Widget>[
            Expanded(
              child: Stack(
                children: <Widget>[
                  Positioned(
                    child: BuildRealBorderElement(),
                    top: ScreenAwareHelper.screenAwareSizePercentHeight(
                        borderElementYPercentPosition, context),
                    left: ScreenAwareHelper.screenAwareSizePercentWidth(
                            50, context) -
                        borderElementLeftOffset,
                  ),
                  Positioned(
                    child: BuildPaElement(),
                    top: ScreenAwareHelper.screenAwareSizePercentHeight(
                        borderElementYPercentPosition, context),
                    left: ScreenAwareHelper.screenAwareSizePercentWidth(
                            50, context) -
                        borderElementLeftOffset -
                        _animationPa.value,
                  ),
                  Positioned(
                    child: SpellPlaceholderPage(),
                    top: ScreenAwareHelper.screenAwareSizePercentHeight(
                        borderElementYPercentPosition + 10, context),
                    left: ScreenAwareHelper.screenAwareSizePercentWidth(
                            5, context) -
                        _animationPa.value * 2,
                  ),
                  Positioned(
                    child: SpellPlaceholderPage(),
                    top: ScreenAwareHelper.screenAwareSizePercentHeight(
                        borderElementYPercentPosition + 10, context),
                    left: ScreenAwareHelper.screenAwareSizePercentWidth(
                            -25, context) -
                        _animationPa.value,
                  ),
                  Positioned(
                    child: buildPickColorField(),
                    top: ScreenAwareHelper.screenAwareSizePercentHeight(
                        borderElementYPercentPosition + 20, context),
                    left: ScreenAwareHelper.screenAwareSizePercentWidth(
                        20, context),
                    right: ScreenAwareHelper.screenAwareSizePercentWidth(
                        20, context),
                  ),
                  //Pour test:
                  Positioned(
                      child: Container(),
                      top: ScreenAwareHelper.screenAwareSizePercentHeight(
                          borderElementYPercentPosition - 40, context),
                      left: ScreenAwareHelper.screenAwareSizePercentWidth(
                          20, context),
                      right: ScreenAwareHelper.screenAwareSizePercentWidth(
                          20, context)),
                  Positioned(
                    child: Container(child: buildRadialEffect()),
                    top: ScreenAwareHelper.screenAwareSizePercentHeight(
                            borderElementYPercentPosition, context) +
                        _borderElement.height / 2 -
                        radialEffectTopOffset * (_animationPa.value / 100.0) -
                        ScreenAwareHelper.screenAwareSize(12.0, context) *
                            (1 - _animationPa.value / 100.0),
                    left: ScreenAwareHelper.screenAwareSizePercentWidth(
                            50, context) +
                        borderElementLeftOffset -
                        _radialEffectDesign.width /
                            2 *
                            (1 - _animationPa.value / 100.0) -
                        ScreenAwareHelper.screenAwareSize(12.0, context) *
                            (1 - _animationPa.value / 100.0),
                  ),
                  Positioned(
                    child: buildSkillDesc(),
                    top: ScreenAwareHelper.screenAwareSizePercentHeight(
                        30, context),
                    left: ScreenAwareHelper.screenAwareSizePercentWidth(
                            50, context) -
                        _skillDescDesign.width / 2,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

//creating Key for BorderElement
  GlobalKey _keyBorderElement = GlobalKey();
  GlobalKey _keySkillDescDesign = GlobalKey();

//creating Key for BorderElement
  GlobalKey _keyRadialEffectEdit = GlobalKey();
  GlobalKey _keyRadialEffectDesign = GlobalKey();

  ///Update Data
  _updateBorderElementPositions() {
    final RenderBox renderBoxBorderElement =
        _keyBorderElement.currentContext.findRenderObject();
    final positionBorderElement =
        renderBoxBorderElement.localToGlobal(Offset.zero);
    final sizeBorderElement = renderBoxBorderElement.size;

    setState(() {
      borderElementHeight = sizeBorderElement.height;
      print(" borderElementHeight: $borderElementHeight ");
      borderElementWidth = sizeBorderElement.width;
      print(" borderElementWidth: $borderElementWidth ");

      positionBorderElementHeight =
          (positionBorderElement.dy - 80 - borderElementHeight).round();
      print(" borderElementHeight:" + borderElementHeight.toString());
      print(" positionBorderElement.dy:" + positionBorderElement.dy.toString());
      print(" positionBorderElementHeight: $positionBorderElementHeight ");
      positionBorderElementWidth = positionBorderElement.dx.round();
      print(" positionBorderElementWidth: $positionBorderElementWidth ");
      percentTopBorderElementHeight =
          (positionBorderElementHeight / screenHeightMax * 100);
      print(" percentBorderElementHeight: $percentTopBorderElementHeight %");
      percentBorderElementWidth =
          (positionBorderElementWidth / screenWidthMax * 100).round();
      print(" percentBorderElementWidth: $percentBorderElementWidth %");
      var top = (positionBorderElementWidth / screenWidthMax * 100).round();
      print(" top: $top ");
      borderElementPosition = positionBorderElement;
    });
    print("POSITION of BorderElement: $positionBorderElement ");
    return positionBorderElement;
  }

  ///Création des éléments de la page
  BuildRealBorderElement() {
    var element = customSpellModel.elementalType.toString().split('.')[1];
    return Stack(
      alignment: Alignment.center,
      children: <Widget>[
        Container(
          color: Colors.transparent,
          height: ScreenAwareHelper.screenAwareSize(100.0, context),
          child:
              linkWidgetVisibilityToBool(_imageFile != null, _previewImage()),
        ),
        new Image.asset(
          'images/spell_cadre/spell_$element.png',
          key: _keyBorderElement,
          height: ScreenAwareHelper.screenAwareSize(110.0, context),
        ),
        Container(
            child: linkWidgetVisibilityToBool(
                _imageFile == null, BuildPickImageButton())),
      ],
    );
  }

  BuildPaElement() {
    return AnimatedCrossFade(
      firstChild: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Image.asset('images/spell_cadre/spell_pa_icon.png'),
          ShadowText(
            customSpellModel.pa == null ? '0' : customSpellModel.pa.toString(),
            style: TextStyle(fontSize: 22.0),
          ),
        ],
      ),
      secondChild: new Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          FlatButton(
            child: Icon(FontAwesomeIcons.plus),
            onPressed: () => setState(() {
                  if (customSpellModel.pa < 20)
                    customSpellModel.pa = customSpellModel.pa + 1;
                }),
          ),
          Stack(
            alignment: Alignment.center,
            children: <Widget>[
              Image.asset('images/spell_cadre/spell_pa_icon.png'),
              ShadowText(
                customSpellModel.pa == null
                    ? '0'
                    : customSpellModel.pa.toString(),
                style: TextStyle(fontSize: 22.0),
              ),
            ],
          ),
          FlatButton(
            child: Icon(FontAwesomeIcons.minus),
            onPressed: () => setState(() {
                  if (customSpellModel.pa > 0)
                    customSpellModel.pa = customSpellModel.pa - 1;
                }),
          ),
        ],
      ),
      crossFadeState:
          isDesignMode ? CrossFadeState.showFirst : CrossFadeState.showSecond,
      duration: Duration(milliseconds: 100),
      firstCurve: Curves.linear,
      secondCurve: Curves.linear,
    );
  }

  buildSpeedDial() {
    return SpeedDial(
      animatedIcon: AnimatedIcons.menu_close,
      overlayColor: Colors.black12,
      animatedIconTheme:
          IconThemeData(size: ScreenAwareHelper.screenAwareSize(22.0, context)),
      onOpen: () => print('OPENING DIAL'),
      onClose: () => print('DIAL CLOSED'),
      curve: Curves.bounceIn,
      children: [
        buildSpeedDialDetailedSpell(),
        SpeedDialChild(
          child: Icon(FontAwesomeIcons.eraser, color: Colors.black87),
          backgroundColor: Colors.grey,
          onTap: () => setState(() {
                showInSnackBar('Clear Done');
              }),
          label: 'Clear Data ',
          labelStyle:
              TextStyle(fontWeight: FontWeight.w500, color: Colors.black87),
        ),
      ],
    );
  }

  buildSpeedDialDetailedSpell() {
    return isDesignMode
        ? SpeedDialChild(
            child: Icon(FontAwesomeIcons.eye, color: Colors.black87),
            backgroundColor: Colors.lightGreenAccent,
            onTap: () => setState(() {
                  _controllerPaAnim.forward();
                  isDesignMode = false;
                  // showInSnackBar('Edit mode ON');
                }),
            label: 'Edit Mode',
            labelStyle:
                TextStyle(fontWeight: FontWeight.w500, color: Colors.black87),
          )
        : SpeedDialChild(
            child: Icon(FontAwesomeIcons.pencilAlt, color: Colors.black87),
            backgroundColor: Colors.yellow,
            onTap: () => setState(() {
                  _controllerPaAnim.reverse();
                  isDesignMode = true;
                  // showInSnackBar('Design mode ON');
                }),
            label: 'Design Mode',
            labelStyle:
                TextStyle(fontWeight: FontWeight.w500, color: Colors.black87),
          );
  }

  ///Tools
  void showInSnackBar(String value) {
    _scaffoldKey.currentState.showSnackBar(new SnackBar(
      backgroundColor: Colors.transparent,
      content: new Text('$value'),
      duration: Duration(seconds: 3),
    ));
  }

  _previewImage() {
    var colorFilter = ElementToColor[customSpellModel.elementalType];

    return FutureBuilder<File>(
        future: _imageFile,
        builder: (BuildContext context, AsyncSnapshot<File> snapshot) {
          if (snapshot.connectionState == ConnectionState.done &&
              snapshot.data != null) {
            stepImageLoaded = true;
            return new Container(
              width: 100.0,
              decoration: new BoxDecoration(
                  image: new DecorationImage(
                colorFilter: new ColorFilter.mode(
                    colorFilter.withOpacity(0.6), BlendMode.color),
                fit: BoxFit.fitWidth,
                alignment: FractionalOffset.topCenter,
                image: Image.file(
                  snapshot.data,
                ).image,
              )),
            );
          } else if (snapshot.error != null) {
            return const Text(
              'Error picking image.',
              textAlign: TextAlign.center,
            );
          } else {
            return Icon(
              FontAwesomeIcons.images,
              size: 40.0,
            );
          }
        });
  }

  //Permet de charger une image depuis le mobile
  void _onImageButtonPressed(ImageSource source) {
    setState(() {
      _imageFile = ImagePicker.pickImage(source: source);
    });
  }

  Widget BuildPickImageButton() {
    return linkWidgetVisibilityToBool(
        !isDesignMode,
        FlatButton(
          color: Colors.transparent,
          padding: EdgeInsets.only(left: 8.0, right: 8.0),
          onPressed: () {
            _onImageButtonPressed(ImageSource.gallery);
          },
          child: Icon(
            Icons.photo_library,
          ),
        ));
  }

  buildPickColorField() {
    return linkWidgetVisibilityToBool(
        !isDesignMode,
        Row(
          children: <Widget>[
            Expanded(child: buildAirElement()),
            Expanded(child: buildFireElement()),
            Expanded(child: buildEarthElement()),
            Expanded(child: buildWaterElement()),
          ],
        ));
  }

  var opacityMin = 0.3;
  var opacityMax = 1.0;

  buildAirElement() {
    return new AnimatedOpacity(
        duration: Duration(milliseconds: 500),
        opacity: customSpellModel.elementalType == WavenElementalType.air
            ? opacityMax
            : opacityMin,
        child: GestureDetector(
          onTap: () {
            setState(() {
              customSpellModel.elementalType = WavenElementalType.air;
            });
          },
          child: new Container(
            child: Image.asset('images/spell_cadre/symbol_air.png'),
          ),
        ));
  }

  buildFireElement() {
    return new AnimatedOpacity(
      duration: Duration(milliseconds: 500),
      opacity: customSpellModel.elementalType == WavenElementalType.fire
          ? opacityMax
          : opacityMin,
      child: GestureDetector(
          onTap: () {
            setState(() {
              customSpellModel.elementalType = WavenElementalType.fire;
            });
          },
          child: new Container(
            child: Image.asset('images/spell_cadre/symbol_fire.png'),
          )),
    );
  }

  buildEarthElement() {
    return new AnimatedOpacity(
      duration: Duration(milliseconds: 500),
      opacity: customSpellModel.elementalType == WavenElementalType.earth
          ? opacityMax
          : opacityMin,
      child: GestureDetector(
          onTap: () {
            setState(() {
              customSpellModel.elementalType = WavenElementalType.earth;
            });
          },
          child: new Container(
            child: Image.asset('images/spell_cadre/symbol_earth.png'),
          )),
    );
  }

  buildWaterElement() {
    return new AnimatedOpacity(
        duration: Duration(milliseconds: 500),
        opacity: customSpellModel.elementalType == WavenElementalType.water
            ? opacityMax
            : opacityMin,
        child: GestureDetector(
            onTap: () {
              setState(() {
                customSpellModel.elementalType = WavenElementalType.water;
              });
            },
            child: new Container(
              child: Image.asset('images/spell_cadre/symbol_water.png'),
            )));
  }

  void _onEffectSelected(WavenEffectType value) {
    print(value.index);
    setState(() {
      customSpellModel.effectType = value;
    });
  }

  buildRadialEffect() {
    return AnimatedCrossFade(
      alignment: Alignment.center,
      firstChild: new SizedBox(
        key: _keyRadialEffectDesign,
        width: 120.0,
        height: 120.0,
        child: new Stack(
          alignment: Alignment.center,
          children: <Widget>[
            Container(
              height: ScreenAwareHelper.screenAwareSize(30.0, context),
              child: new FloatingActionButton(
                onPressed: null,
                child: new Image.asset(
                  EffectToImageurl[customSpellModel.effectType] ?? "",
                  width: 30.0,
                ),
                backgroundColor: Colors.transparent, //_colorAnimation.value,
              ),
            ),
          ],
        ),
      ),
      secondChild: AnimatedFab(
        key: _keyRadialEffectEdit,
        callbackEffect: callbackEffect,
      ),
      crossFadeState:
          isDesignMode ? CrossFadeState.showFirst : CrossFadeState.showSecond,
      duration: Duration(milliseconds: 100),
      firstCurve: Curves.linear,
      secondCurve: Curves.linear,
    );
  }

  callbackEffect(newEffect) {
    setState(() {
      customSpellModel.effectType = newEffect;
    });
  }

  buildSkillDesc() {
    return Container(
        height: ScreenAwareHelper.screenAwareSizePercentHeight(30, context),
        key: _keySkillDescDesign,
        color: Colors.black.withOpacity(0.8),
        child: IntrinsicWidth(
          child: Column(
            children: <Widget>[
              SpellEffectWidget('FLAMME HUILEE'),
              new Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SizedBox(width: 40.0,),
                  Image.asset('images/spell_cadre/Reserve_Iop_Mini.png'),
                  Image.asset('images/spell_cadre/symbol_water.png'),
                  Image.asset('images/spell_cadre/symbol_earth.png'),
                  Image.asset('images/spell_cadre/symbol_air.png'),
                  Image.asset('images/spell_cadre/symbol_fire.png'),
                  SizedBox(width: 40.0,),
                ],
              ),
              Expanded(
                child: Container(
                  color: Colors.grey,
                  child: Text(
                    'Inflige 6 dégâts \net applique l\'état huilé',
                    maxLines: 2,
                    style: TextStyle(fontSize: 18.0),
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}

Map<WavenElementalType, Color> ElementToColor = new Map.from({
  WavenElementalType.fire: Colors.orange,
  WavenElementalType.air: Colors.purple,
  WavenElementalType.earth: Colors.green,
  WavenElementalType.water: Colors.lightBlueAccent,
});

enum EffectOptions {
  Fire,
  Air,
  Earth,
  Water,
  None,
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
Map<WavenEffectType, Color> EffectToColor = new Map.from({
  WavenEffectType.air: Colors.purple,
  WavenEffectType.earth: Colors.green,
  WavenEffectType.fire: Colors.orange,
  WavenEffectType.water: Colors.lightBlueAccent,
});
