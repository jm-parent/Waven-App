import 'package:flutter/material.dart';
import 'package:waven_app/AppUi/Models/ResponseWavenApiWeapons.dart';

class ClassListWeaponCardWidget extends StatefulWidget {

  final ResponseWavenApiWeapon weapon;

  const ClassListWeaponCardWidget({Key key, this.weapon}) : super(key: key);

  @override
  _ClassListWeaponCardWidgetState createState() => _ClassListWeaponCardWidgetState();
}

class _ClassListWeaponCardWidgetState extends State<ClassListWeaponCardWidget> {
  @override
  Widget build(BuildContext context) {

  }
}
