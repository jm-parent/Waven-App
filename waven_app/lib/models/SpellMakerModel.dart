import 'dart:io';

import 'package:waven_app/util/EnumHelper.dart';

class SpellMakerModel {
  String name = '';
  String desc = '';
  int pa = 0;
  File backgroundFile;
  String urlImage = '';
  int shushuId = 0;
  int fireGen = 0;
  int earthGen = 0;
  int waterGen = 0;
  int airGen = 0;
  int shushuGen = 0;
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
        this.effects == '' &&
        this.effectType == WavenEffectType.noeffect &&
        this.fireGen == 0 &&
        this.earthGen == 0 &&
        this.waterGen == 0 &&
        this.desc == ''&&
        this.airGen == 0)
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
    this.fireGen = 0;
    this.earthGen = 0;
    this.waterGen = 0;
    this.airGen = 0;
    this.desc = '';
  }
}
