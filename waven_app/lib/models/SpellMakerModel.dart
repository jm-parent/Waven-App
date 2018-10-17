import 'dart:io';

import 'package:waven_app/util/EnumHelper.dart';

class SpellMakerModel {
  String name = '';
  int pa = 0;
  File backgroundFile;
  String urlImage = '';
  int shushuId = 0;
  WavenElementalType elementalType = WavenElementalType.fire;
  String effects = '';
  WavenEffectType effectType = WavenEffectType.noeffect;

  @override
  String toString() {
    return 'SpellMakerModel{name: $name, pa: $pa, designFile: $backgroundFile, urlImage: $urlImage, elementalType: $elementalType, effectType: $effectType}';
  }

  bool isNew() {
    if (this.name == '' &&
        this.pa == 0 &&
        this.backgroundFile == null &&
        this.urlImage == '' &&
        this.shushuId == 0 &&
        this.elementalType == WavenElementalType.fire &&
        this.effects == ''&&
        this.effectType == WavenEffectType.noeffect)
      return true;
    else
      return false;
  }

  void resetSpell() {
    this.name = '';
    this.pa = 0;
    this.backgroundFile = null;
    this.urlImage = '';
    this.shushuId = 0;
    this.elementalType = WavenElementalType.fire;
    this.effects = '';
    this.effectType = WavenEffectType.noeffect;
  }
}
