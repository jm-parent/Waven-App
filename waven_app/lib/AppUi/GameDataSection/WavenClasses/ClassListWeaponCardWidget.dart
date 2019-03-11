import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:waven_app/AppUi/CommonWidget/SnapshotNullLoadingIndicator.dart';
import 'package:waven_app/AppUi/GameDataSection/WavenShushus/Widgets/WeaponDetailPage.dart';
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
