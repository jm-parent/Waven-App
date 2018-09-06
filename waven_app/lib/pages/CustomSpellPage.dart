import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:waven_app/SpellBuilderWidgets/SpellCostCard.dart';
import 'package:waven_app/SpellBuilderWidgets/SpellCostSlider.dart';
import 'package:waven_app/SpellBuilderWidgets/SpellNameCard.dart';
import 'package:waven_app/util/EnsureVisibleWhenFocused.dart';
import 'package:waven_app/util/EnumHelper.dart';
import 'package:waven_app/util/widget_utils.dart' show screenAwareSize;
import 'package:waven_app/widgets/NumberPicker.dart';
import 'package:waven_app/models/SpellMakerModel.dart';

import 'package:image_picker/image_picker.dart';

class CustomSpellPage extends StatefulWidget {
  final int initialSpellCost;

  const CustomSpellPage({Key key, this.initialSpellCost}) : super(key: key);

  @override
  _CustomSpellPageState createState() => new _CustomSpellPageState();
}

class _CustomSpellPageState extends State<CustomSpellPage> {
  //FocusNode _focusNodeSpellName = new FocusNode();
  final GlobalKey<FormState> _formKey = new GlobalKey<FormState>();
  Future<File> _imageFile;
  bool isVideo = false;
  int spellCostValue;
  SpellMakerModel customSpellModel = new SpellMakerModel();

  void _onImageButtonPressed(ImageSource source) {
    setState(() {
      _imageFile = ImagePicker.pickImage(source: source);
    });
  }

  void showMessage(String message, [MaterialColor color = Colors.red]) {
    showInSnackBar(message);
  }
  FocusNode _focusNodeSpellName = new FocusNode();
  FocusNode _focusNodeLastName = new FocusNode();
  FocusNode _focusNodeDescription = new FocusNode();
  @override
  void initState() {
    super.initState();
    spellCostValue = widget.initialSpellCost ?? 0;
  }

  void showInSnackBar(String value) {
    Scaffold.of(context).showSnackBar(new SnackBar(content: new Text(value)));
  }
  final _scaffoldKey = new GlobalKey<ScaffoldState>();
  bool _autovalidate = false;
  var _formWasEdited = true;
  Future<bool> _warnUserAboutInvalidData() async {
    final FormState form = _formKey.currentState;
    if (form == null || !_formWasEdited || form.validate())
      return true;

    return await showDialog<bool>(
      context: context,
      builder: (BuildContext context) {
        return new AlertDialog(
          title: const Text('This form has errors'),
          content: const Text('Really leave this form?'),
          actions: <Widget> [
            new FlatButton(
              child: const Text('YES'),
              onPressed: () { Navigator.of(context).pop(true); },
            ),
            new FlatButton(
              child: const Text('NO'),
              onPressed: () { Navigator.of(context).pop(false); },
            ),
          ],
        );
      },
    ) ?? false;
  }


  @override
  Widget build(BuildContext context) {
    return  new Scaffold(
      key: _scaffoldKey,
      appBar: new AppBar(
        title: const Text('Text fields'),
      ),
      body: new SafeArea(
        top: false,
        bottom: false,
        child: new Form(
          key: _formKey,
          autovalidate: _autovalidate,
          onWillPop: _warnUserAboutInvalidData,
          child: new SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: new Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                const SizedBox(height: 24.0),
                buildNameField(),
                const SizedBox(height: 24.0),
                buildElementalDropdown(),
                const SizedBox(height: 24.0),
                buildImagePicker(),
                const SizedBox(height: 24.0),
                buildSubmitButton(customSpellModel.name),
              ],
          ),
          ),
        ),
      ),
    );
  }

  void _submitForm() {
    final FormState form = _formKey.currentState;

    if (!form.validate()) {
      showMessage('Form is not valid!  Please review and correct.');
    } else {
      form.save(); //This invokes each onSaved event

    }
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
          child: new Image.asset('images/spell_cadre/symbol_$cutValue.png',),
        );
      }).toList(),
    ),
      )
    );
  }

  buildSubmitButton(var spellName) {
    return new Container(
        padding: const EdgeInsets.only(top: 20.0),
        child: new RaisedButton(
          child: ListTile(
            title:Text('Generate $spellName'),leading:const Icon(Icons.check),
          ),
          onPressed: _submitForm,
        ));
  }

  buildImagePicker() {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Expanded(
            flex: 2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: Text('Spell Image'),
                ),
                new RaisedButton(
                onPressed: () {
                isVideo = false;
                _onImageButtonPressed(ImageSource.gallery);
                },
                child:ListTile(
                  title: Text('Pick Image'),leading:const Icon(Icons.photo_library),
                )
                ),
              ],
            ),
          ),
          Expanded(
            child:  Padding(
              padding: const EdgeInsets.all(8.0),
              child: _previewImage(),
            ),
          )
        ],
      ),
    );
  }

  buildNameField() {
    return EnsureVisibleWhenFocused(
      focusNode: _focusNodeSpellName,
      child: new TextFormField(
        focusNode: _focusNodeSpellName,
        decoration: const InputDecoration(
          hintText: 'Enter the spell name',
          labelText: 'Spell Name',
        ),
        onFieldSubmitted: (val) => customSpellModel.name = val,
        inputFormatters: [new LengthLimitingTextInputFormatter(30)],
        validator: (val) => val.isEmpty ? 'Spell Name is required' : null,
      ),
    );
  }

  Widget _previewImage() {
    return FutureBuilder<File>(
        future: _imageFile,
        builder: (BuildContext context, AsyncSnapshot<File> snapshot) {
          if (snapshot.connectionState == ConnectionState.done &&
              snapshot.data != null) {
            return new Center(
              child: new AspectRatio(
                aspectRatio: 1/1,
                child: new Container(
                  decoration: new BoxDecoration(
                      image: new DecorationImage(
                        fit: BoxFit.fitWidth,
                        alignment: FractionalOffset.topCenter,
                        image:  Image.file(snapshot.data).image,
                      )
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
            return const Text(
              'You have not yet picked an image.',
              textAlign: TextAlign.center,
            );
          }
        });
  }
}
