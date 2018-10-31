// Copyright 2016 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:waven_app/util/widget_utils.dart';

class ArmoryBuilderCreatePage extends StatefulWidget {

  final String className;
  final String urlClasseBackground;
  const ArmoryBuilderCreatePage({Key key, this.className,this.urlClasseBackground}) : super(key: key);


  @override
  ArmoryBuilderCreatePageState createState() => ArmoryBuilderCreatePageState();
}

class PasswordField extends StatefulWidget {
  const PasswordField({
    this.fieldKey,
    this.hintText,
    this.labelText,
    this.helperText,
    this.onSaved,
    this.validator,
    this.onFieldSubmitted,
  });

  final Key fieldKey;
  final String hintText;
  final String labelText;
  final String helperText;
  final FormFieldSetter<String> onSaved;
  final FormFieldValidator<String> validator;
  final ValueChanged<String> onFieldSubmitted;

  @override
  _PasswordFieldState createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      key: widget.fieldKey,
      obscureText: _obscureText,
      maxLength: 8,
      onSaved: widget.onSaved,
      validator: widget.validator,
      onFieldSubmitted: widget.onFieldSubmitted,
      decoration: InputDecoration(
        border: const UnderlineInputBorder(),
        filled: true,
        hintText: widget.hintText,
        labelText: widget.labelText,
        helperText: widget.helperText,
        suffixIcon: GestureDetector(
          onTap: () {
            setState(() {
              _obscureText = !_obscureText;
            });
          },
          child: Icon(_obscureText ? Icons.visibility : Icons.visibility_off),
        ),
      ),
    );
  }
}

class ArmoryBuilderCreatePageState extends State<ArmoryBuilderCreatePage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  String armoryName = "Choose a name";

  void showInSnackBar(String value) {
    _scaffoldKey.currentState.showSnackBar(SnackBar(
        content: Text(value)
    ));
  }

  bool _autovalidate = true;
  bool _formWasEdited = false;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final GlobalKey<FormFieldState<String>> _passwordFieldKey = GlobalKey<FormFieldState<String>>();
  final _UsNumberTextInputFormatter _phoneNumberFormatter = _UsNumberTextInputFormatter();
  void _handleSubmitted() {
    final FormState form = _formKey.currentState;
    if (!form.validate()) {
      _autovalidate = true; // Start validating on every change.
      showInSnackBar('Please fix the errors in red before submitting.');
    } else {
      form.save();
      showInSnackBar('Name is $armoryName');
    }
  }

  String _validateName(String value) {
    _formWasEdited = true;
    if (value.isEmpty)
      return 'Name is required.';
    final RegExp nameExp = RegExp(r'^[A-Za-z ]+$');
    if (!nameExp.hasMatch(value))
      return 'Please enter only alphabetical characters.';
    return null;
  }

  String _validatePhoneNumber(String value) {
    _formWasEdited = true;
    final RegExp phoneExp = RegExp(r'^\(\d\d\d\) \d\d\d\-\d\d\d\d$');
    if (!phoneExp.hasMatch(value))
      return '(###) ###-#### - Enter a US phone number.';
    return null;
  }

  String _validatePassword(String value) {
    _formWasEdited = true;
    final FormFieldState<String> passwordField = _passwordFieldKey.currentState;
    if (passwordField.value == null || passwordField.value.isEmpty)
      return 'Please enter a password.';
    if (passwordField.value != value)
      return 'The passwords don\'t match';
    return null;
  }

  Future<bool> _warnUserAboutInvalidData() async {
    final FormState form = _formKey.currentState;
    if (form == null || !_formWasEdited || form.validate())
      return true;

    return await showDialog<bool>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('This form has errors'),
          content: const Text('Really leave this form?'),
          actions: <Widget> [
            FlatButton(
              child: const Text('YES'),
              onPressed: () { Navigator.of(context).pop(true); },
            ),
            FlatButton(
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
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: const Text('Confirm Selected God'),
        ),
      body: Container(
        decoration: BoxDecoration(
        image: DecorationImage(
          image: Image.asset(widget.urlClasseBackground, fit: BoxFit.fill,).image,
        ),),
        child: SafeArea(
            top: false,
            bottom: false,
            child: Form(
              key: _formKey,
              autovalidate: _autovalidate,
              onWillPop: _warnUserAboutInvalidData,
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    const SizedBox(height: 24.0),
                    TextFormField(
                      textCapitalization: TextCapitalization.words,
                      decoration: const InputDecoration(
                        border: UnderlineInputBorder(),
                        filled: true,
                        hintText: 'Armory Name',
                        labelText: 'Armory Name *',
                      ),
                      onSaved: (String value) { armoryName = value; },
                      validator: _validateName,
                    ),
                    const SizedBox(height: 10.0),
                    SizedBox(
                      height: ScreenAwareHelper.screenAwareSize(200.0, context),
                      child: new Swiper(
                        itemBuilder: (BuildContext context, int index) {
                          return Padding(
                            padding: const EdgeInsets.only(bottom:20.0),
                            child: new Image.asset(
                              "images/HeroImageArmory/${index+1}.png",
                              fit: BoxFit.contain,
                            ),
                          );
                        },
                        layout: SwiperLayout.STACK,
                        itemHeight: ScreenAwareHelper.screenAwareSize(300.0, context),
                        itemWidth: ScreenAwareHelper.screenAwareSize(300.0, context),

                        //pagination:new SwiperPagination(alignment: Alignment.bottomCenter,builder:SwiperPagination.dots ),
                        itemCount: 10,
                        //viewportFraction: 0.8,
                        //scale: 0.9,
                      ),
                    ),
                    const SizedBox(height: 10.0),
                    Center(
                      child: RaisedButton(
                        child: const Text('Create Armory'),
                        onPressed: _handleSubmitted,
                      ),
                    ),
                    const SizedBox(height: 24.0),
                    Text(
                        '* indicates required field',
                        style: Theme.of(context).textTheme.caption
                    ),
                    const SizedBox(height: 24.0),
                  ],
                ),
              ),
            ),
          ),
      ),
    );
  }
}

/// Format incoming numeric text to fit the format of (###) ###-#### ##...
class _UsNumberTextInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue,
      TextEditingValue newValue
      ) {
    final int newTextLength = newValue.text.length;
    int selectionIndex = newValue.selection.end;
    int usedSubstringIndex = 0;
    final StringBuffer newText = StringBuffer();
    if (newTextLength >= 1) {
      newText.write('(');
      if (newValue.selection.end >= 1)
        selectionIndex++;
    }
    if (newTextLength >= 4) {
      newText.write(newValue.text.substring(0, usedSubstringIndex = 3) + ') ');
      if (newValue.selection.end >= 3)
        selectionIndex += 2;
    }
    if (newTextLength >= 7) {
      newText.write(newValue.text.substring(3, usedSubstringIndex = 6) + '-');
      if (newValue.selection.end >= 6)
        selectionIndex++;
    }
    if (newTextLength >= 11) {
      newText.write(newValue.text.substring(6, usedSubstringIndex = 10) + ' ');
      if (newValue.selection.end >= 10)
        selectionIndex++;
    }
    // Dump the rest.
    if (newTextLength >= usedSubstringIndex)
      newText.write(newValue.text.substring(usedSubstringIndex));
    return TextEditingValue(
      text: newText.toString(),
      selection: TextSelection.collapsed(offset: selectionIndex),
    );
  }
}