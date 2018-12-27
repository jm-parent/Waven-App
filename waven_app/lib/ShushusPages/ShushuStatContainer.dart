
import 'package:flutter/material.dart';
import 'package:waven_app/ShushusPages/ShushuDetailStatPage.dart';

class ShushuStatContainer extends StatefulWidget {
  final int IdWeapon;

  const ShushuStatContainer({Key key, this.IdWeapon}) : super(key: key);

  @override
  _ShushuStatContainerState createState() => _ShushuStatContainerState();
}

class _ShushuStatContainerState extends State<ShushuStatContainer> with SingleTickerProviderStateMixin {
  AnimationController _controller;

  var data;

  @override
  void initState() {
    _controller = AnimationController(vsync: this,duration: const Duration(milliseconds:2200));
    super.initState();
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new ShushuDetailStatPage(
    controller: _controller,
      IdWeapon: widget.IdWeapon,
    );
  }
}
