import 'dart:io';

import 'package:shared_preferences/shared_preferences.dart';
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

  void getPrefs(SharedPreferences prefs) async {
    name = prefs.getString('cachedSpellname')??'';
    pa = prefs.getInt('cachedSpellpa')??0;
    //backgroundFile = prefs.get('cachedSpellbackgroundFile');
    urlImage = prefs.getString('cachedSpellurlImage')??'';
    shushuId = prefs.getInt('cachedSpellshushuId')??0;
    elementalType = WavenElementalType.values[prefs.getInt('cachedSpellelementalType')??0];
    effects = prefs.getString('cachedSpelleffects')??'';
    effectType= WavenEffectType.values[prefs.getInt('cachedSpelleffectType')??0];
    fireGen = prefs.getInt('cachedSpellfireGen')??0;
    earthGen = prefs.getInt('cachedSpellearthGen')??0;
    waterGen = prefs.getInt('cachedSpellwaterGen')??0;
    airGen = prefs.getInt('cachedSpellairGen')??0;
    desc = prefs.getString('cachedSpelldesc')??'';
  }

  void setPrefs(SharedPreferences prefs) async {
    prefs.setString('cachedSpellname',name);
    prefs.setInt('cachedSpellpa',pa);
    //prefs.set('cachedSpellbackgroundFile',backgroundFile);
    prefs.setString('cachedSpellurlImage',urlImage);
    prefs.setInt('cachedSpellshushuId',shushuId);
    prefs.setInt('cachedSpellelementalType',elementalType.index);
    prefs.setString('cachedSpelleffects',effects);
    prefs.setInt('cachedSpelleffectType',effectType.index);
    prefs.setInt('cachedSpellfireGen',fireGen);
    prefs.setInt('cachedSpellearthGen',earthGen);
    prefs.setInt('cachedSpellwaterGen',waterGen);
    prefs.setInt('cachedSpellairGen',airGen);
    prefs.setString('cachedSpelldesc',desc);
  }
}
