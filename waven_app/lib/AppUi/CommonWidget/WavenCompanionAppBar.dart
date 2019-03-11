import 'package:flutter/material.dart';
import 'package:waven_app/AppUi/ColorsHelper.dart';

class WavenCompanionAppbar extends AppBar {

  static var wavenCompanionTitle =  Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Image.asset(
        'images/Waven_Companion.png',
        fit: BoxFit.cover,
      ),
    );

  WavenCompanionAppbar({Key key}):super(key: key,title:wavenCompanionTitle,centerTitle:true,backgroundColor:mainDarkBlue());


}
