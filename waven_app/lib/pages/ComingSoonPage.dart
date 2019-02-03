import 'package:flutter/material.dart';

class ComingSoonPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: <Widget>[
            Text('Under Construction...'),
          ],
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Image.asset('images/underconstruction.gif',fit: BoxFit.cover,),
      ),
    );
  }
}
