import 'dart:async' show Future;
import 'package:flutter/services.dart' show rootBundle;
import 'dart:convert';
import 'package:waven_app/models/HeroModel.dart';

class HeroesHelper {

  static Future<String> _loadHeroAsset() async {
    return await rootBundle.loadString('assets/HeroesDatas.json');
  }

  static Future<HeroList> loadHeroes() async {
    String jsonHeroes = await _loadHeroAsset();
    final jsonResponse = json.decode(jsonHeroes);
    HeroList heroesList = HeroList.fromJson(jsonResponse);
    print("hero name : " + heroesList.heroes[0].heroName);
    return heroesList;
  }
}