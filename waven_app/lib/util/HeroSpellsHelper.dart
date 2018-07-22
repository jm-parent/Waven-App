import 'dart:async' show Future;
import 'package:flutter/services.dart' show rootBundle;
import 'dart:convert';
import 'package:waven_app/models/HeroSpellModel.dart';

class HeroSpellsHelper {

  static Future<String> _loadSpellsAsset() async {
    return await rootBundle.loadString('assets/SpellsDatas.json');
  }

  static Future<HeroSpellList> loadSpells() async {

    String jsonHeroes = await _loadSpellsAsset();
    final jsonResponse = json.decode(jsonHeroes);
    HeroSpellList spellList = HeroSpellList.fromJson(jsonResponse);
    return spellList;
  }

  static Future<HeroSpellList> loadSpellsByGodId(int godId) async {

    String jsonHeroes = await _loadSpellsAsset();
    final jsonResponse = json.decode(jsonHeroes);
    HeroSpellList spellList = HeroSpellList.fromJson(jsonResponse);
    spellList.spells.removeWhere((i) => i.godId != godId);
    return spellList;
  }
}