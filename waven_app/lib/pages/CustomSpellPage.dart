import 'dart:async';
import 'dart:io';
import 'dart:typed_data';
import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'package:waven_app/SpellBuilderWidgets/SpellCostCard.dart';
import 'package:waven_app/SpellBuilderWidgets/SpellCostSlider.dart';
import 'package:waven_app/SpellBuilderWidgets/SpellNameCard.dart';
import 'package:waven_app/pages/CustomSpellEffectsPage.dart';
import 'package:waven_app/util/EnsureVisibleWhenFocused.dart';
import 'package:waven_app/util/EnumHelper.dart';
import 'package:waven_app/util/widget_utils.dart' show screenAwareSize;
import 'package:waven_app/widgets/NumberPicker.dart';
import 'package:waven_app/models/SpellMakerModel.dart';
import 'package:image_picker/image_picker.dart';
import 'package:waven_app/widgets/ShadowText.dart';
import 'package:flutter/rendering.dart';

import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:waven_app/widgets/SpellEffectBackground.dart';

class CustomSpellPage extends StatefulWidget {

  @override
  _CustomSpellPageState createState() => new _CustomSpellPageState();
}

class _CustomSpellPageState extends State<CustomSpellPage> {
  Future<File> _imageFile; // Image chargée
  File _savedImage;
  SpellMakerModel customSpellModel = new SpellMakerModel(); // Model de données du sort
  static GlobalKey previewContainer = new GlobalKey(); // Pour TakeScreenshot
  void _onImageButtonPressed(ImageSource source) {
    setState(() {
      _imageFile = ImagePicker.pickImage(source: source);
    });
  }

  void showMessage(String message, [MaterialColor color = Colors.red]) {
    showInSnackBar(message);
  }

  @override
  void initState() {
    super.initState();
  }

  void showInSnackBar(String value) {
    Scaffold.of(context).showSnackBar(new SnackBar(content: new Text(value),duration: Duration(seconds: 3),));
  }

  final _scaffoldKey = new GlobalKey<ScaffoldState>();

  bool _dialVisible = true;

  int stepCounter = 0;
  bool stepImageLoaded = false;
  @override
  Widget build(BuildContext context) {


    var steps = [
      Step(
        title: Text("Choose Spell Image"),
        content: buildImagePicker(),
        isActive: true,
      ),
      Step(
        title: Text("Choose Elemental Type"),
        content: buildElementalDropdown(),
        isActive: true,
      ),
      Step(
        title: Text("Choose Spell Cost"),
        content: NumberPicker.integer(
            initialValue: 0,
            minValue: 0,
            maxValue: 12,
            onChanged: ((val) => setState(() => customSpellModel.pa = val))),
        isActive: true,
      ),
    ];

    return new Scaffold(
        floatingActionButton: buildSpeedDial(),

        key: _scaffoldKey,
        body: Column(
          children: <Widget>[
            Expanded(child: Text('')),
            Expanded(
              child: buildHeaderPreviewSpell(),
              flex: 6,
            ),
            Expanded(
              flex: 27,
              child: Stepper(
                currentStep: this.stepCounter,
                steps: steps,
                type: StepperType.vertical,
                onStepTapped: (step) {
                  setState(() {
                    stepCounter = step;
                  });
                },
                onStepCancel: () {
                  setState(() {
                    stepCounter > 0 ? stepCounter -= 1 : stepCounter = 0;
                  });
                },
                onStepContinue: () {
                  setState(() {
                    stepCounter < steps.length - 1
                        ? stepCounter += 1
                        : stepCounter = 0;
                  });
                },
              ),
            ),

            Expanded(
                flex: 2,
                child: _savedImage!=null?Image.file(_savedImage):new Text('')),
          ],
        ));
  }

  buildSpeedDial(){
      return SpeedDial(
        animatedIcon: AnimatedIcons.menu_close,
        overlayColor: Colors.black12,
        animatedIconTheme: IconThemeData(size: 22.0),
        // child: Icon(Icons.add),
        onOpen: () => print('OPENING DIAL'),
        onClose: () => print('DIAL CLOSED'),
        visible: stepImageLoaded,
        curve: Curves.bounceIn,
        children: [

          SpeedDialChild(
            child: Icon(Icons.skip_next, color: Colors.black87),
            backgroundColor: Colors.green,
            onTap: _onNextStapClicked,
            label: 'Add Effects',
            labelStyle: TextStyle(fontWeight: FontWeight.w500,color: Colors.black87),
          ),

          SpeedDialChild(
            child: Icon(Icons.save, color: Colors.black87),
            backgroundColor: Colors.deepOrange,
            onTap: () => takeScreenShot(),
            label: 'Save it',
            labelStyle: TextStyle(fontWeight: FontWeight.w500,color: Colors.black87),
          ),
          SpeedDialChild(
            child: Icon(Icons.share, color: Colors.black87),
            backgroundColor: Colors.blueAccent,
            onTap: () => print('Share'),
            label: 'Share it',
            labelStyle: TextStyle(fontWeight: FontWeight.w500,color: Colors.black87),
          ),
        ],
      );
    }

  takeScreenShot() async{
    RenderRepaintBoundary boundary = previewContainer.currentContext.findRenderObject();
    ui.Image image = await boundary.toImage();
    final directory = (await getApplicationDocumentsDirectory()).path;
    ByteData byteData = await image.toByteData(format: ui.ImageByteFormat.png);
    Uint8List pngBytes = byteData.buffer.asUint8List();
    print(pngBytes);
    print(directory);
    var date = DateTime.now().toIso8601String();
    File imgFile =new File('$directory/screenshot$date.png');
    print(imgFile);
    imgFile.writeAsBytes(pngBytes);
    showInSnackBar('Image sauvegardée');
    setState(() {
      customSpellModel.backgroundFile = imgFile;
      _savedImage = imgFile;
    });
  }

  buildElementalDropdown() {
    return new InputDecorator(
        decoration: const InputDecoration(
          labelText: 'Elemental type',
        ),
        child: new DropdownButtonHideUnderline(
          child: new DropdownButton<WavenElementalType>(
            value: customSpellModel.elementalType,
            isDense: false,
            onChanged: (WavenElementalType newValue) {
              setState(() {
                customSpellModel.elementalType = newValue;
              });
            },
            items: WavenElementalType.values.map((WavenElementalType value) {
              var cutValue = value.toString().split('.')[1];
              return new DropdownMenuItem<WavenElementalType>(
                value: value,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    new Image.asset(
                      'images/spell_cadre/symbol_$cutValue.png',
                    ),
                    Text(cutValue),
                  ],
                ),
              );
            }).toList(),
          ),
        ));
  }

  buildImagePicker() {
    return Container(
      child: Padding(
        padding: EdgeInsets.only(top: 8.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Expanded(
              flex: 2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(bottom: 8.0),
                    child: Text('Spell Image'),
                  ),
                  new RaisedButton(
                      onPressed: () {
                        _onImageButtonPressed(ImageSource.gallery);
                      },
                      child: ListTile(
                        title: Text('Pick Image'),
                        leading: Icon(Icons.photo_library),
                      )),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  buildImagePreview() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: _previewImage(),
    );
  }

  Widget _previewImage() {
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
                      image: Image.file(snapshot.data).image,
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
            return Text('');
          }
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

  _onNextStapClicked() {
    Navigator.push(context, new MaterialPageRoute(builder: (context) {
      return new CustomSpellEffectsPage(spellModel: customSpellModel,);
    }));
  }

}

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
