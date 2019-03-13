import 'dart:io';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:waven_app/AppUi/ColorsHelper.dart';
import 'package:waven_app/AppUi/CommonWidget/WavenCompanionAppBar.dart';
import 'package:image_picker/image_picker.dart';
import 'package:keyboard_actions/keyboard_actions.dart';
import 'package:waven_app/AppUi/WavenToolsPage/WeaponMaker/WeaponMakerModel.dart';
import 'package:waven_app/AppUi/WavenToolsPage/WeaponMaker/WeaponMakerPreview.dart';

class WeaponMakerPage extends StatefulWidget {
  @override
  _WeaponMakerPageState createState() => _WeaponMakerPageState();
}

class _WeaponMakerPageState extends State<WeaponMakerPage> {
  var weaponModel = new WeaponMakerModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mainDarkBlueL1(),
      appBar: WavenCompanionAppbar(),
      body: FormKeyboardActions(
        keyboardActionsPlatform: KeyboardActionsPlatform.ALL, //optional
        keyboardBarColor: mainDarkBlue(), //optional
        actions: [
          KeyboardAction(
            focusNode: _nodeWeaponDesc,
            closeWidget: Padding(
              padding: EdgeInsets.all(8.0),
              child: Icon(
                Icons.close,
                color: mainYellow(),
              ),
            ),
          ),
          KeyboardAction(
            focusNode: _nodeWeaponSpellDesc,
            closeWidget: Padding(
              padding: EdgeInsets.all(8.0),
              child: Icon(
                Icons.close,
                color: mainYellow(),
              ),
            ),
          ),
        ],
        child: SingleChildScrollView(
          child: _buildPage(),
        ),
      ),
      floatingActionButton: new FloatingActionButton(
        foregroundColor: mainDarkBlue(),
        backgroundColor: mainYellowD1(),
        onPressed: () => Navigator.push(
            context,
            PageTransition(
                type: PageTransitionType.fade,
                child: WeaponMakerPreview(model: weaponModel))),
        child: Icon(Icons.remove_red_eye),
      ),
    );
  }

  _buildPage() {
    return Column(
      children: <Widget>[
        _buildTitle("ARME"),
        _buildWeaponNameTextfield(),
        _buildWeaponImagePicker(),
        _buildTitle("PASSIF"),
        _buildWeaponPassiveDescTextfield(),
        _buildTitle("ACTIF"),
        _buildSpellActifName(),
        _buildSpellCostAndGen(),
        Row(
          children: <Widget>[
            _buildWeaponSpellImagePicker(),
            _buildWeaponSpellDescTextfield(),
          ],
        ),
        SizedBox(
          height: 40,
        ),
      ],
    );
  }

////////////////// Weapon Name ////////////////////
  _buildWeaponNameTextfield() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        cursorColor: mainYellow(),
        maxLength: 40,
        onChanged: (newValue) => weaponModel.name = newValue,
        decoration: InputDecoration(
          fillColor: mainDarkBlueD1(),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: mainYellow()),
          ),
          labelStyle: TextStyle(color: mainYellow()),
          hintStyle: TextStyle(color: mainYellow()),
          filled: true,
          labelText: 'Nom de l\'arme',
        ),
      ),
    );
  }

////////////////// Weapon Image ////////////////////
  File _imageSpell;

  Future getImageSpellFromGallery() async {
    var image = await ImagePicker.pickImage(source: ImageSource.gallery);
    setState(() {

      _imageSpell = image;
    });
    weaponModel.actifImage = image.path;

  }

  _buildWeaponSpellImagePicker() {
    return Expanded(
      child: AnimatedContainer(
        duration: Duration(milliseconds: 400),
        decoration: ShapeDecoration(
            shape: Border.all(
                color: _imageSpell == null ? mainYellow() : Colors.transparent,
                width: 1)),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4.0),
            child: _imageSpell == null
                ? RaisedButton(
                    color: mainYellow(),
                    textColor: mainDarkBlueD1(),
                    child: AutoSizeText(
                      'Pick une image',
                      maxLines: 1,
                      minFontSize: 5,
                    ),
                    onPressed: getImageSpellFromGallery,
                  )
                : GestureDetector(
                    child: Hero(
                        tag: 'ActifImageTag',
                        child: Image.file(_imageSpell)),
                    onTap: getImageSpellFromGallery,
                  ),
          ),
        ),
      ),
    );
  }

  ////////////////// Weapon desc ////////////////////
  FocusNode _nodeWeaponDesc = FocusNode();

  _buildWeaponPassiveDescTextfield() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        maxLines: 2,
        onChanged: (newValue) => weaponModel.passifDesc = newValue,
        maxLength: 100,
        focusNode: _nodeWeaponDesc,
        cursorColor: mainYellow(),
        decoration: InputDecoration(
          fillColor: mainDarkBlueD1(),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: mainYellow()),
          ),
          labelStyle: TextStyle(color: mainYellow()),
          hintStyle: TextStyle(color: mainYellow()),
          filled: true,
          labelText: 'Descriptif du passif',
        ),
      ),
    );
  }

  ////////////////// Weapon spell Image ////////////////////
  File _image;

  Future getImageFromGallery() async {
    var image = await ImagePicker.pickImage(source: ImageSource.gallery);

    setState(() {
      _image = image;
    });

  }

  _buildWeaponImagePicker() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Center(
        child: Container(
          decoration: ShapeDecoration(
              shape: Border.all(
                  color: _image == null ? mainYellow() : Colors.transparent,
                  width: 1)),
          width: MediaQuery.of(context).size.width * 0.75,
          height: 200.0,
          child: Center(
            child: _image == null
                ? RaisedButton(
                    color: mainYellow(),
                    textColor: mainDarkBlueD1(),
                    child: Text('Pick une image'),
                    onPressed: ()async =>{
                    await getImageFromGallery(),
                    setState(() {
                    weaponModel.weaponImage = _image.path;
                    })
                    },
                  )
                : GestureDetector(
                    child:
                        Hero(tag: 'WeaponImageTag', child: Image.file(_image)),
                    onTap: () async => {
                     await getImageFromGallery(),
                    setState(() {
                      weaponModel.weaponImage = _image.path;
                    })
                    },
                  ),
          ),
        ),
      ),
    );
  }

  ////////////////// Weapon Activ Desc ////////////////////
  FocusNode _nodeWeaponSpellDesc = FocusNode();

  _buildWeaponSpellDescTextfield() {
    return Expanded(
      flex: 3,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: TextField(
          maxLines: 3,
          onChanged: (newValue) => weaponModel.actifDesc = newValue,
          focusNode: _nodeWeaponSpellDesc,
          cursorColor: mainYellow(),
          decoration: InputDecoration(
            fillColor: mainDarkBlueD1(),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: mainYellow()),
            ),
            labelStyle: TextStyle(color: mainYellow()),
            hintStyle: TextStyle(color: mainYellow()),
            filled: true,
            labelText: 'Descriptif du Spell',
          ),
        ),
      ),
    );
  }

  _buildTitle(String s) {
    return Padding(
      padding:
          const EdgeInsets.only(left: 8.0, right: 8.0, top: 8.0, bottom: 4.0),
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Text(
                s,
                textAlign: TextAlign.left,
                style: TextStyle(fontFamily: "BebasNeue", fontSize: 22),
              ),
            ],
          ),
          SizedBox(height: 2.0, child: Container(color: mainYellowL2()))
        ],
      ),
    );
  }

  FocusNode _nodeWeaponSpellCostGen = FocusNode();

  _buildSpellCostAndGen() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        maxLines: 1,
        onChanged: (newValue) => weaponModel.actifCost = newValue,
        focusNode: _nodeWeaponSpellCostGen,
        cursorColor: mainYellow(),
        decoration: InputDecoration(
          fillColor: mainDarkBlueD1(),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: mainYellow()),
          ),
          labelStyle: TextStyle(color: mainYellow()),
          hintStyle: TextStyle(color: Colors.grey),
          filled: true,
          hintText: ' XPA | +X AIR FEU TERRE EAU',
          labelText: 'Coût & Génération Élémentaire',
        ),
      ),
    );
  }

  FocusNode _nodeWeaponSpellActifName = FocusNode();

  _buildSpellActifName() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        maxLines: 1,
        onChanged: (newValue) => weaponModel.actifName = newValue,
        focusNode: _nodeWeaponSpellActifName,
        cursorColor: mainYellow(),
        decoration: InputDecoration(
          fillColor: mainDarkBlueD1(),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: mainYellow()),
          ),
          labelStyle: TextStyle(color: mainYellow()),
          hintStyle: TextStyle(color: Colors.grey),
          filled: true,
          labelText: 'Nom de l\'Actif',
        ),
      ),
    );
  }
}
