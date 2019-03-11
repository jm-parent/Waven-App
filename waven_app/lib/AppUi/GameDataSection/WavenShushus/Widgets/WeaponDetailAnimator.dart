import 'package:flutter/material.dart';
import 'package:waven_app/AppUi/GameDataSection/WavenShushus/Widgets/WeaponDetailPage.dart';
import 'package:waven_app/AppUi/Models/ResponseWavenApiDetailledClass.dart';

class WeaponDetailAnimator extends StatefulWidget {

  final Weapon weaponData;

  const WeaponDetailAnimator({Key key, this.weaponData}) : super(key: key);

  @override
  _WeaponDetailAnimator createState() => new _WeaponDetailAnimator();
}

class _WeaponDetailAnimator extends State<WeaponDetailAnimator>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = new AnimationController(
      duration: const Duration(milliseconds: 3000),
      vsync: this,
    );
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new WeaponDetailPage(weaponData: widget.weaponData,controller: _controller,);
  }
}