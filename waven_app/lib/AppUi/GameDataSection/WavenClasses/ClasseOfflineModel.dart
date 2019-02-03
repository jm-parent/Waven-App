
import 'dart:ui';

import 'package:flutter/material.dart';

class ClasseOfflineModel {

  final String className;

  final String portrait;
  final String loreTitle;
  final String lore;
  final Color color;
  final Decoration gradient;
  ClasseOfflineModel(this.className, this.portrait, this.lore, this.color, this.loreTitle, this.gradient);

  String get background => 'images/ClassesBg/bg_${className.toLowerCase()??0}.png';

  @override
  String toString() {
    return 'ClassOfflineModel{className: $className, portrait: $portrait, lore: $lore, color: $color}';
  }


}
