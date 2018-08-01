import 'dart:async' show Future;
import 'package:flutter/services.dart' show rootBundle;
import 'dart:convert';
import 'package:waven_app/models/HeroSpellModel.dart';
import 'package:waven_app/models/HeroSpellModelV2.dart';

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


class HeroSpellsV2Helper {

  static Future<String> _loadSpellsAsset() async {
    return await rootBundle.loadString('assets/SpellsDatasV2.json');
  }

  static Future<HeroSpellV2List> loadSpells() async {

    String jsonHeroes = await _loadSpellsAsset();
    final jsonResponse = json.decode(jsonHeroes);
    HeroSpellV2List spellList = HeroSpellV2List.fromJson(jsonResponse);
    return spellList;
  }

  static Future<HeroSpellV2List> loadSpellsByGodId(int godId) async {

    String jsonHeroes = await _loadSpellsAsset();
    final jsonResponse = json.decode(jsonHeroes);
    HeroSpellV2List spellList = HeroSpellV2List.fromJson(jsonResponse);
    spellList.spells.removeWhere((i) => i.godid != godId);
    return spellList;
  }
}