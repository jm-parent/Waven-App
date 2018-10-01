import 'dart:io';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:image_picker/image_picker.dart';
import 'package:waven_app/models/SpellMakerModel.dart';
import 'package:waven_app/util/EnumHelper.dart';
import 'package:waven_app/util/VisibilityTool.dart';
import 'package:waven_app/util/widget_utils.dart';

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

  bool isDesignMode = false;
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
    _controllerPaAnim.forward();
  }

// ...Boilerplate...

  _afterLayout(_) {
    _updateBorderElementPositions();
  }

  @override
  Widget build(BuildContext context) {
    screenHeightMax =
        ScreenAwareHelper.screenAwareSizePercentHeight(100, context);
    screenWidthMax =
        ScreenAwareHelper.screenAwareSizePercentWidth(100, context);
    var borderElementYPercentPosition = 65;

    return new Scaffold(
      key: _scaffoldKey,
      floatingActionButton: buildSpeedDial(),
      appBar: AppBar(key: _appBarKey, title: GetTitle()),
      body: Container(
        color: Colors.blue,
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
                        (borderElementWidth == null
                            ? 0
                            : borderElementWidth / 2),
                  ),
                  Positioned(
                    child: BuildPaElement(),
                    top: ScreenAwareHelper.screenAwareSizePercentHeight(
                        borderElementYPercentPosition, context),
                    left: ScreenAwareHelper.screenAwareSizePercentWidth(
                            50, context) -
                        (borderElementWidth == null
                            ? 0
                            : borderElementWidth / 2) -
                        _animationPa.value,
                  ),
                  Positioned(
                    child: BuildFakeBorderElement(),
                    top: ScreenAwareHelper.screenAwareSizePercentHeight(
                        borderElementYPercentPosition + 10, context),
                    left: ScreenAwareHelper.screenAwareSizePercentWidth(
                            5, context) -
                        _animationPa.value * 2,
                  ),
                  Positioned(
                    child: BuildPaElement(),
                    top: ScreenAwareHelper.screenAwareSizePercentHeight(
                        borderElementYPercentPosition + 10, context),
                    left: ScreenAwareHelper.screenAwareSizePercentWidth(
                            5, context) -
                        _animationPa.value * 2,
                  ),
                  Positioned(
                    child: BuildFakeBorderElement(),
                    top: ScreenAwareHelper.screenAwareSizePercentHeight(
                        borderElementYPercentPosition + 10, context),
                    left: ScreenAwareHelper.screenAwareSizePercentWidth(
                            -25, context) -
                        _animationPa.value,
                  ),
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
  GlobalKey _appBarKey = GlobalKey();

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
    return Container(
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Container(
            color: Colors.transparent,
            height: 100.0,
            child: linkWidgetVisibilityToBool(
                _imageFile != null, _previewImage()),
          ),
          new Image.asset(
            'images/spell_cadre/spell_$element.png',
            key: _keyBorderElement,
            width: ScreenAwareHelper.screenAwareSizePercentWidth(30, context),
          ),

          Container(
              child: linkWidgetVisibilityToBool(
                  _imageFile == null, BuildPickImageButton())),
        ],
      ),
    );
  }

  BuildPaElement() {
    return Container(
      child: new Image.asset(
        'images/spell_cadre/spell_pa_icon.png',
      ),
    );
  }

  BuildFakeBorderElement() {
    return new Image.asset(
      'images/spell_cadre/spell_air.png',
      width: ScreenAwareHelper.screenAwareSizePercentWidth(30, context),
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
                  showInSnackBar('Edit mode ON');
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
                  showInSnackBar('Design mode ON');
                }),
            label: 'Design Mode',
            labelStyle:
                TextStyle(fontWeight: FontWeight.w500, color: Colors.black87),
          );
  }

  ///Tools
  void showInSnackBar(String value) {
    _scaffoldKey.currentState.showSnackBar(new SnackBar(
      content: new Text('$value'),
      duration: Duration(seconds: 3),
    ));
  }

  ///Placeholder
  GetTitle() {
    return isDesignMode
        ? new Text('We are in design mode')
        : new Text('We are in edit mode');
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
    return RaisedButton(
      padding: EdgeInsets.only(left: 8.0, right: 8.0),
      onPressed: () {
        _onImageButtonPressed(ImageSource.gallery);
      },
      child: Icon(
        Icons.photo_library,
      ),
    );
  }
}

Map<WavenElementalType, Color> ElementToColor = new Map.from({
  WavenElementalType.fire: Colors.orange,
  WavenElementalType.air: Colors.purple,
  WavenElementalType.earth: Colors.green,
  WavenElementalType.water: Colors.lightBlueAccent,
});
