import 'dart:async';
import 'dart:io';
import 'dart:typed_data';
import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:path_provider/path_provider.dart';

import 'package:waven_app/SpellBuilderWidgets/SpellCostCard.dart';
import 'package:waven_app/SpellBuilderWidgets/SpellCostSlider.dart';
import 'package:waven_app/SpellBuilderWidgets/SpellNameCard.dart';
import 'package:waven_app/pages/CustomSpellEffectsPage.dart';
import 'package:waven_app/util/EnsureVisibleWhenFocused.dart';
import 'package:waven_app/util/EnumHelper.dart';
import 'package:waven_app/util/VisibilityTool.dart';
import 'package:waven_app/util/widget_utils.dart' show screenAwareSize;
import 'package:waven_app/widgets/NumberPicker.dart';
import 'package:waven_app/models/SpellMakerModel.dart';
import 'package:image_picker/image_picker.dart';
import 'package:waven_app/widgets/ShadowText.dart';
import 'package:flutter/rendering.dart';

import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:waven_app/widgets/SpellEffectBackground.dart';

class SpellMakerPage extends StatefulWidget {
  @override
  _SpellMakerPageState createState() => new _SpellMakerPageState();
}

class _SpellMakerPageState extends State<SpellMakerPage>
    with SingleTickerProviderStateMixin {
  //Certains
  SpellMakerModel customSpellModel =
      new SpellMakerModel(); // Model de données du sort
  SpellMakerModel localSpellModel = new SpellMakerModel();
  Future<File> _imageFile; // Image chargée
  static GlobalKey previewContainer = new GlobalKey(); // Pour TakeScreenshot
  TextEditingController _controllerName = new TextEditingController();
  TextEditingController _controllerEffects = new TextEditingController();
  ScrollController _controllerScrollPa = new ScrollController();

  static const double topPaddingField = 20.0;

  bool isAdvancedMode = false;

  //Moins certains
  File _savedImage; //File après save

  void showMessage(String message, [MaterialColor color = Colors.red]) {
    showInSnackBar(message);
  }

  void showInSnackBar(String value) {
    _scaffoldKey.currentState.showSnackBar(new SnackBar(
      content: new Text('$value'),
      duration: Duration(seconds: 3),
    ));
  }

  final _scaffoldKey = new GlobalKey<ScaffoldState>();

  int stepCounter = 0;
  bool stepImageLoaded = false;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        floatingActionButton: buildSpeedDial(),
        appBar: AppBar(
          centerTitle: true,
          title: new Text('Waven Spell Maker'),
        ),
        key: _scaffoldKey,
        body: new SafeArea(
          top: false,
          bottom: false,
          child: new SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: new Column(
              children: <Widget>[
                SizedBox(
                  height: 20.0,
                ),
                linkWidgetVisibilityToBool(isAdvancedMode, buildNameField()),
                linkWidgetVisibilityToBool(isAdvancedMode, buildTextEffectSpell()),
                buildImagePicker(),
                buildPickColorField(),
                buildElementalGenerateField(),
                buildPaCostSpell(),
                SizedBox(
                  height: 100.0,
                )
                // buildHeaderPreviewSpell(),
                // buildEffectBackground(),
              ],
            ),
          ),
        ));
  }

  buildSpeedDial() {
    return SpeedDial(
      animatedIcon: AnimatedIcons.menu_close,
      overlayColor: Colors.black12,
      animatedIconTheme: IconThemeData(size: 22.0),
      // child: Icon(Icons.add),
      onOpen: () => print('OPENING DIAL'),
      onClose: () => print('DIAL CLOSED'),
      curve: Curves.bounceIn,
      children: [
        buildSpeedDialDetailedSpell(),
        SpeedDialChild(
          child: Icon(FontAwesomeIcons.eraser, color: Colors.black87),
          backgroundColor: Colors.grey,
          onTap: () => setState(() {
                customSpellModel.resetSpell();
                _controllerName.clear();
                _controllerEffects.clear();
                _savedImage = null;
                _imageFile = null;
                stepImageLoaded = false;
                airGenerateValue = 0;
                fireGenerateValue = 0;
                earthGenerateValue = 0;
                waterGenerateValue = 0;
                print(customSpellModel.toString());
                showInSnackBar('Clear Done');
              }),
          label: 'Clear Data ',
          labelStyle:
              TextStyle(fontWeight: FontWeight.w500, color: Colors.black87),
        ),
        SpeedDialChild(
          child: Icon(FontAwesomeIcons.eye, color: Colors.black87),
          backgroundColor: Colors.green,
          onTap: _showModalSheet,
          label: 'Preview Spell',
          labelStyle:
              TextStyle(fontWeight: FontWeight.w500, color: Colors.black87),
        ),
        SpeedDialChild(
          child: Icon(Icons.save, color: Colors.black87),
          backgroundColor: Colors.deepOrange,
          onTap: () => takeScreenShot(),
          label: 'Save it',
          labelStyle:
              TextStyle(fontWeight: FontWeight.w500, color: Colors.black87),
        ),
        SpeedDialChild(
          child: Icon(Icons.share, color: Colors.black87),
          backgroundColor: Colors.teal,
          onTap: () => print('Share'),
          label: 'Share it',
          labelStyle:
              TextStyle(fontWeight: FontWeight.w500, color: Colors.black87),
        ),
      ],
    );
  }

  takeScreenShot() async {
    RenderRepaintBoundary boundary =
        previewContainer.currentContext.findRenderObject();
    ui.Image image = await boundary.toImage();
    final directory = (await getApplicationDocumentsDirectory()).path;
    ByteData byteData = await image.toByteData(format: ui.ImageByteFormat.png);
    Uint8List pngBytes = byteData.buffer.asUint8List();
    print(pngBytes);
    print(directory);
    var date = DateTime.now().toIso8601String();
    File imgFile = new File('$directory/screenshot$date.png');
    print(imgFile);
    imgFile.writeAsBytes(pngBytes);
    showInSnackBar('Image sauvegardée');
    setState(() {
      customSpellModel.backgroundFile = imgFile;
      _savedImage = imgFile;
    });
  }

  void _selectedMenu(SpellPopupMenu value) {
    var titre = value.title;
    _scaffoldKey.currentState
        .showSnackBar(new SnackBar(content: new Text('You selected: $titre')));
  }

  buildAppBarItems() {
    return new PopupMenuButton<SpellPopupMenu>(
      itemBuilder: (BuildContext context) => <PopupMenuItem<SpellPopupMenu>>[
            PopupMenuItem<SpellPopupMenu>(
                value: SpellPopupMenu(
                  Text('Preview SpellImage'),
                  '',
                  Icon(Icons.pageview),
                  SpellPreviewType.image,
                ),
                child: new ListTile(
                  title: Text('SpellImage'),
                  leading: Icon(Icons.pageview),
                )),
            PopupMenuItem<SpellPopupMenu>(
                value: SpellPopupMenu(Text('Preview SpellDesc'), '',
                    Icon(Icons.text_fields), SpellPreviewType.desc),
                child: new ListTile(
                  title: Text('SpellDesc'),
                  leading: Icon(Icons.text_fields),
                )),
            PopupMenuItem<SpellPopupMenu>(
                value: SpellPopupMenu(Text('Preview FullSpell'), '',
                    Icon(Icons.all_inclusive), SpellPreviewType.full),
                child: new ListTile(
                  title: Text('FullSpell'),
                  leading: Icon(Icons.all_inclusive),
                )),
          ],
      onSelected: _selectedMenu,
    );
  }

  buildHeaderPreviewSpell() {
    var element = customSpellModel.elementalType.toString().split('.')[1];
    return RepaintBoundary(
      key: previewContainer,
      child: Stack(
        alignment: AlignmentDirectional.topStart,
        children: <Widget>[
          _previewImage(),
          Center(
            child: new Container(
              width: 100.0,
              decoration: new BoxDecoration(
                image: new DecorationImage(
                  fit: BoxFit.fitHeight,
                  image: new Image.asset(
                    'images/spell_cadre/spell_$element.png',
                  ).image,
                ),
              ),
            ),
          ),
          Center(
            heightFactor: 1.3,
            widthFactor: 11.2,
            child: new Container(
              width: 30.0,
              height: 30.0,
              child: Center(
                  child: ShadowText(
                customSpellModel?.pa?.toString() ?? '0',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold),
              )),
              decoration: new BoxDecoration(
                image: new DecorationImage(
                  fit: BoxFit.fitWidth,
                  image: new Image.asset(
                    'images/spell_cadre/spell_pa_icon.png',
                  ).image,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  buildImagePreview() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: _previewImage(),
    );
  }

  _previewImage() {
    var colorFilter = ElementToColor[customSpellModel.elementalType];

    return FutureBuilder<File>(
        future: _imageFile,
        builder: (BuildContext context, AsyncSnapshot<File> snapshot) {
          if (snapshot.connectionState == ConnectionState.done &&
              snapshot.data != null) {
            stepImageLoaded = true;
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: new Center(
                child: new AspectRatio(
                  aspectRatio: 1 / 1,
                  child: new Container(
                    decoration: new BoxDecoration(
                        image: new DecorationImage(
                      colorFilter: new ColorFilter.mode(
                          colorFilter.withOpacity(0.6), BlendMode.color),
                      fit: BoxFit.fitWidth,
                      alignment: FractionalOffset.topCenter,
                      image: Image
                          .file(
                            snapshot.data,
                          )
                          .image,
                    )),
                  ),
                ),
              ),
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

  buildNameField() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: <Widget>[
            Text('Enter Spell Name'),
            Padding(
              padding: const EdgeInsets.only(top: topPaddingField),
              child: new TextField(
                controller: _controllerName,
                maxLines: 1,
                maxLength: 20,
                decoration: const InputDecoration(
                  border: UnderlineInputBorder(),
                  filled: true,
                  hintText: 'Spell Name',
                ),
                onChanged: (String value) {
                  customSpellModel.name = value;
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  buildImagePicker() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: <Widget>[
            Text('Choose Spell Image'),
            Padding(
              padding: const EdgeInsets.only(top: topPaddingField),
              child: Row(
                children: <Widget>[
                  Expanded(
                    flex: 3,
                    child: new RaisedButton(
                        onPressed: () {
                          _onImageButtonPressed(ImageSource.gallery);
                        },
                        child: ListTile(
                          title: Text('Pick Image'),
                          leading: Icon(Icons.photo_library),
                        )),
                  ),
                  Expanded(child: _previewImage()),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  buildPickColorField() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.only(top: 12.0),
        child: Column(
          children: <Widget>[
            Text('Choose an element'),
            new Row(
              children: <Widget>[
                Expanded(child: buildAirElement()),
                Expanded(child: buildFireElement()),
                Expanded(child: buildEarthElement()),
                Expanded(child: buildWaterElement()),
              ],
            )
          ],
        ),
      ),
    );
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

  buildEffectBackground() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        color: Colors.transparent,
        child: Stack(children: <Widget>[
          Container(
              color: Colors.black.withOpacity(0.8),
              child: Padding(
                padding: const EdgeInsets.only(top: 50.0, bottom: 30.0),
                child: Column(
                  children: <Widget>[
                    new Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Image.asset('images/spell_cadre/symbol_water.png'),
                        Image.asset('images/spell_cadre/symbol_earth.png'),
                        Image.asset('images/spell_cadre/symbol_air.png'),
                        Image.asset('images/spell_cadre/symbol_fire.png'),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          top: 20.0, left: 12.0, right: 12.0),
                      child: Text(
                        'Inflige 6 dégâts et applique l\'état huilé',
                        style: TextStyle(fontSize: 18.0),
                      ),
                    ),
                  ],
                ),
              )),
          SpellEffectWidget('FLAMME HUILEE'),
        ]),
      ),
    );
  }

  void _showModalSheet() {
    showModalBottomSheet(
        context: context,
        builder: (builder) {
          return new Container(
            decoration: new BoxDecoration(
              image: new DecorationImage(
                image: Image.asset('images/background_the_game.jpg').image,
                fit: BoxFit.cover,
              ),
            ),
            child: new BackdropFilter(
              filter: new ui.ImageFilter.blur(
                sigmaX: 2.0,
                sigmaY: 10.0,
              ),
              child: Column(
                children: <Widget>[
                  buildEffectBackground(),
                  buildImagePreview()
                ],
              ),
            ),
          );
        });
  }

  buildTextEffectSpell() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: <Widget>[
            Text('Fill Spell Effects'),
            Padding(
              padding: const EdgeInsets.only(top: topPaddingField),
              child: new TextField(
                controller: _controllerEffects,
                maxLines: 1,
                maxLength: 50,
                decoration: const InputDecoration(
                  border: UnderlineInputBorder(),
                  filled: true,
                  hintText: 'Spell Effects',
                ),
                onChanged: (String value) {
                  customSpellModel.effects = value;
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  buildPaCostSpell() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: <Widget>[
            Text('Cost Spell'),
            Padding(
              padding: const EdgeInsets.only(top: 12.0),
              child: new Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  FlatButton(
                    child: Icon(FontAwesomeIcons.minus),
                    onPressed: () => setState(() {
                          if (customSpellModel.pa > 0)
                            customSpellModel.pa = customSpellModel.pa - 1;
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
                    child: Icon(FontAwesomeIcons.plus),
                    onPressed: () => setState(() {
                          if (customSpellModel.pa < 20)
                            customSpellModel.pa = customSpellModel.pa + 1;
                        }),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  buildSpeedDialDetailedSpell() {
    return isAdvancedMode
        ? SpeedDialChild(
            child: Icon(FontAwesomeIcons.searchMinus, color: Colors.black87),
            backgroundColor: Colors.lightGreenAccent,
            onTap: () => setState(() {
                  isAdvancedMode = false;
                  showInSnackBar('Normal mode ON');
                }),
            label: 'Normal Mode',
            labelStyle:
                TextStyle(fontWeight: FontWeight.w500, color: Colors.black87),
          )
        : SpeedDialChild(
            child: Icon(FontAwesomeIcons.searchPlus, color: Colors.black87),
            backgroundColor: Colors.yellow,
            onTap: () => setState(() {
                  isAdvancedMode = true;
                  showInSnackBar('Advanced mode ON');
                }),
            label: 'Advanced Mode',
            labelStyle:
                TextStyle(fontWeight: FontWeight.w500, color: Colors.black87),
          );
  }

  int airGenerateValue = 0;
  int fireGenerateValue = 0;
  int earthGenerateValue = 0;
  int waterGenerateValue = 0;

  buildElementalGenerateField() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.only(top: 12.0),
        child: Column(
          children: <Widget>[
            Text('Elemental Mana Generation'),
            new Row(
              children: <Widget>[
                Expanded(child: buildAirGenerateElement()),
                Expanded(child: buildFireGenerateElement()),
                Expanded(child: buildEarthGenerateElement()),
                Expanded(child: buildWaterGenerateElement()),
//                Expanded(child: buildGenerateElement(WavenElementalType.fire,fireGenerateValue)),
//                Expanded(child: buildGenerateElement(WavenElementalType.earth,earthGenerateValue)),
//                Expanded(child: buildGenerateElement(WavenElementalType.water,waterGenerateValue)),
              ],
            ),
          ],
        ),
      ),
    );
  }

  buildAirGenerateElement() {
    var elementModified = 'air';
    var posOrNeg = airGenerateValue > 0 ? '+' : '';
    return Column(
      children: <Widget>[
        FlatButton(
          child: Icon(FontAwesomeIcons.angleUp),
          onPressed: () => setState(() {
                airGenerateValue = airGenerateValue + 1;
              }),
        ),
        Stack(
          alignment: Alignment.center,
          children: <Widget>[
            new Container(
              child:
                  Image.asset('images/spell_cadre/symbol_$elementModified.png'),
            ),
            ShadowText(
              posOrNeg + airGenerateValue.toString(),
              style: TextStyle(
                  color: Colors.white, fontWeight: ui.FontWeight.bold),
            ),
          ],
        ),
        FlatButton(
          child: Icon(FontAwesomeIcons.angleDown),
          onPressed: () => setState(() {
                airGenerateValue--;
              }),
        ),
      ],
    );
  }

  buildFireGenerateElement() {
    var elementModified = 'fire';
    var posOrNeg = fireGenerateValue > 0 ? '+' : '';
    return Column(
      children: <Widget>[
        FlatButton(
          child: Icon(FontAwesomeIcons.angleUp),
          onPressed: () => setState(() {
                fireGenerateValue = fireGenerateValue + 1;
              }),
        ),
        Stack(
          alignment: Alignment.center,
          children: <Widget>[
            new Container(
              child:
                  Image.asset('images/spell_cadre/symbol_$elementModified.png'),
            ),
            ShadowText(
              posOrNeg + fireGenerateValue.toString(),
              style: TextStyle(
                  color: Colors.white, fontWeight: ui.FontWeight.bold),
            ),
          ],
        ),
        FlatButton(
          child: Icon(FontAwesomeIcons.angleDown),
          onPressed: () => setState(() {
                fireGenerateValue--;
              }),
        ),
      ],
    );
  }

  buildEarthGenerateElement() {
    var elementModified = 'earth';
    var posOrNeg = earthGenerateValue > 0 ? '+' : '';
    return Column(
      children: <Widget>[
        FlatButton(
          child: Icon(FontAwesomeIcons.angleUp),
          onPressed: () => setState(() {
                earthGenerateValue = earthGenerateValue + 1;
              }),
        ),
        Stack(
          alignment: Alignment.center,
          children: <Widget>[
            new Container(
              child:
                  Image.asset('images/spell_cadre/symbol_$elementModified.png'),
            ),
            ShadowText(
              posOrNeg + earthGenerateValue.toString(),
              style: TextStyle(
                  color: Colors.white, fontWeight: ui.FontWeight.bold),
            ),
          ],
        ),
        FlatButton(
          child: Icon(FontAwesomeIcons.angleDown),
          onPressed: () => setState(() {
                earthGenerateValue--;
              }),
        ),
      ],
    );
  }

  buildWaterGenerateElement() {
    var elementModified = 'water';
    var posOrNeg = waterGenerateValue > 0 ? '+' : '';
    return Column(
      children: <Widget>[
        FlatButton(
          child: Icon(FontAwesomeIcons.angleUp),
          onPressed: () => setState(() {
                waterGenerateValue = waterGenerateValue + 1;
              }),
        ),
        Stack(
          alignment: Alignment.center,
          children: <Widget>[
            new Container(
              child:
                  Image.asset('images/spell_cadre/symbol_$elementModified.png'),
            ),
            ShadowText(
              posOrNeg + waterGenerateValue.toString(),
              style: TextStyle(
                  color: Colors.white, fontWeight: ui.FontWeight.bold),
            ),
          ],
        ),
        FlatButton(
          child: Icon(FontAwesomeIcons.angleDown),
          onPressed: () => setState(() {
                waterGenerateValue--;
              }),
        ),
      ],
    );
  }
}

//Region

//endregion

class SpellPopupMenu {
  final Text title;
  final String url;
  final Icon icon;
  SpellPreviewType spellPreviewType;

  SpellPopupMenu(this.title, this.url, this.icon, this.spellPreviewType);
}

enum SpellPreviewType {
  image,
  desc,
  full,
}

Map<WavenElementalType, Color> ElementToColor = new Map.from({
  WavenElementalType.fire: Colors.orange,
  WavenElementalType.air: Colors.purple,
  WavenElementalType.earth: Colors.green,
  WavenElementalType.water: Colors.lightBlueAccent,
});
