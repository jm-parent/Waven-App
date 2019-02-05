import 'dart:convert';

import 'package:waven_app/AppUi/Models/ResponseWavenApiClasses.dart';
import 'package:waven_app/AppUi/Models/SpellsWavenApiModel.dart';
import 'package:http/http.dart' as http;



class WavenApiProvider
{

  static Future<List<ResponseWavenApiSpell>> GetSpellsFromClassName(String className) async {
    String urlSpells = 'https://waven-api.synedh.fr/spells';
    String basicAuth = 'Basic ' + base64Encode(utf8.encode('Xeno:superpassword'));
    var responseClass = await GetClassFromClassName(className);
    var classPicked = responseClass.firstWhere((classeItem) => classeItem.name.toLowerCase() == className.toLowerCase());
    var responseSpell = await http.get(Uri.encodeFull(urlSpells),
        headers: {"Accept": "application/json", 'authorization': basicAuth});
    var responseAllSpellList = responseWavenApiSpellFromJson(responseSpell.body);
    //Remove les sorts qui ne sont pas dans les sorts de la classe picked
    responseAllSpellList.removeWhere((spellItem) =>
    classPicked.spells.contains(spellItem.id)==false);
    return responseAllSpellList;
  }

  static Future<ResponseWavenApiSpell> GetSpellDetailFromSpellId(String spellId) async {
    String urlSpell = 'https://waven-api.synedh.fr/spells/${spellId}';
    String basicAuth = 'Basic ' + base64Encode(utf8.encode('Xeno:superpassword'));
    var responseSpell = await http.get(Uri.encodeFull(urlSpell),
        headers: {"Accept": "application/json", 'authorization': basicAuth});
    var responseAllSpellList = responseWavenApiSpellFromJson(responseSpell.body);

    return responseAllSpellList == null || responseAllSpellList.length!= 1 ? new ResponseWavenApiClasses(): responseAllSpellList[0];
  }


  static Future<List<ResponseWavenApiClasses>> GetClassFromClassName(String className) async {
    String urlClasses = 'https://waven-api.synedh.fr/classes';
    String basicAuth = 'Basic ' + base64Encode(utf8.encode('Xeno:superpassword'));
    //Récupération des classes pour récupérer la liste des sortsID
    var responseClasses = await http.get(Uri.encodeFull(urlClasses),
        headers: {"Accept": "application/json", 'authorization': basicAuth});

    var responseClassesObject = responseWavenApiClassesFromJson(responseClasses.body);

    return responseClassesObject;
  }



}