import 'dart:convert';

import 'package:waven_app/AppUi/Models/ResponseWavenApiClasses.dart';
import 'package:waven_app/AppUi/Models/ResponseWavenApiDetailledClass.dart';
import 'package:waven_app/AppUi/Models/ResponseWavenApiDetailledSpell.dart';
import 'package:waven_app/AppUi/Models/ResponseWavenApiElements.dart';
import 'package:waven_app/AppUi/Models/ResponseWavenApiFellow.dart';
import 'package:waven_app/AppUi/Models/ResponseWavenApiSpell.dart';
import 'package:http/http.dart' as http;
import 'package:waven_app/AppUi/Models/ResponseWavenApiWeapons.dart';
import 'package:waven_app/AppUi/Models/WavenApiMockedDatas.dart';

class WavenApiProvider
{

  static Future<List<ResponseWavenApiSpell>> GetSpellsFromClassName(String className) async {
    String urlSpells = 'https://waven-api.synedh.fr/spells';
    String basicAuth = 'Basic ' + base64Encode(utf8.encode('Xeno:superpassword'));
    var responseClass = await GetClassFromClassName(className);
    var classPicked = responseClass.firstWhere((classeItem) => classeItem.name.toLowerCase() == className.toLowerCase());
    var responseSpell = await http.get(Uri.encodeFull(urlSpells),
        headers: {"Accept": "application/json", 'authorization': basicAuth});
    var responseAllSpellList = responseWavenApiSpellsFromJson(responseSpell.body);
    //Remove les sorts qui ne sont pas dans les sorts de la classe picked
    responseAllSpellList.removeWhere((spellItem) =>
    classPicked.spells.contains(spellItem.id)==false);
    return responseAllSpellList;
  }

  static Future<ResponseWavenApiDetailledSpell> GetSpellDetailFromSpellId(String spellId) async {
    String urlSpell = 'https://waven-api.synedh.fr/spells/${spellId}';
    String basicAuth = 'Basic ' + base64Encode(utf8.encode('Xeno:superpassword'));
    var responseSpell = await http.get(Uri.encodeFull(urlSpell),
        headers: {"Accept": "application/json", 'authorization': basicAuth});
    var responseAllSpell = responseWavenApiDetailledSpellFromJson(responseSpell.body);
    return responseAllSpell;
  }

  static Future<List<ResponseWavenApiSpell>> GetAllSpellDetailFromSpellId(String spellId) async {
    String urlSpell = 'https://waven-api.synedh.fr/spells/${spellId}';
    String basicAuth = 'Basic ' + base64Encode(utf8.encode('Xeno:superpassword'));
    var responseSpell = await http.get(Uri.encodeFull(urlSpell),
        headers: {"Accept": "application/json", 'authorization': basicAuth});
    var responseAllSpellList = responseWavenApiSpellsFromJson(responseSpell.body);

    return responseAllSpellList == null || responseAllSpellList.length!= 1 ? new ResponseWavenApiClass(): responseAllSpellList[0];
  }


  static Future<List<ResponseWavenApiClass>> GetClassFromClassName(String className) async {
    String urlClasses = 'https://waven-api.synedh.fr/classes';
    String basicAuth = 'Basic ' + base64Encode(utf8.encode('Xeno:superpassword'));
    //Récupération des classes pour récupérer la liste des sortsID
    var responseClasses = await http.get(Uri.encodeFull(urlClasses),
        headers: {"Accept": "application/json", 'authorization': basicAuth});

    var responseClassesObject = responseWavenApiClassFromJson(responseClasses.body);
    return responseClassesObject;
  }
  static Future<ResponseWavenApiDetailledClass> GetDetailledClassFromClassName(String className) async {
    var classes = await GetClassFromClassName(className);
    var classPicked = classes.firstWhere((classeItem) => classeItem.name.toLowerCase() == className.toLowerCase());
    String urlClasses = 'https://waven-api.synedh.fr/classes/${classPicked.id}';
    String basicAuth = 'Basic ' + base64Encode(utf8.encode('Xeno:superpassword'));
    //Récupération des classes pour récupérer la liste des sortsID
    var responseClasses = await http.get(Uri.encodeFull(urlClasses),
        headers: {"Accept": "application/json", 'authorization': basicAuth});
    var responseClassesObject = responseWavenApiDetailledClassFromJson(responseClasses.body);
    return responseClassesObject;
  }

  static Future<List<ResponseWavenApiClass>> GetAllClass() async {
    String urlClasses = 'https://waven-api.synedh.fr/classes';
    String basicAuth = 'Basic ' + base64Encode(utf8.encode('Xeno:superpassword'));
    //Récupération des classes pour récupérer la liste des sortsID
    var responseClasses = await http.get(Uri.encodeFull(urlClasses),
        headers: {"Accept": "application/json", 'authorization': basicAuth});
    var responseClassesObject = responseWavenApiClassFromJson(responseClasses.body);
    return responseClassesObject;
  }
  static Future<List<ResponseWavenApiFellow>> GetAllFellow() async {
    String urlClasses = 'https://waven-api.synedh.fr/fellows';
    String basicAuth = 'Basic ' + base64Encode(utf8.encode('Xeno:superpassword'));
    //Récupération des classes pour récupérer la liste des sortsID
    var responseClasses = await http.get(Uri.encodeFull(urlClasses),
        headers: {"Accept": "application/json", 'authorization': basicAuth});
    var responseClassesObject = responseWavenApiFellowFromJson(responseClasses.body);
    return responseClassesObject;
  }
  static Future<ResponseWavenApiElement> GetElementById(String idElement) async {
    String urlElements = 'https://waven-api.synedh.fr/elements';
    String basicAuth = 'Basic ' + base64Encode(utf8.encode('Xeno:superpassword'));
    var responseElement = await http.get(Uri.encodeFull(urlElements),
        headers: {"Accept": "application/json", 'authorization': basicAuth});

    var responseClassesObject = responseWavenApiElementsFromJson(WavenApiMockedDatas.elementsResponse);

    return responseClassesObject.firstWhere((element)=> element.id == idElement);
  }
  static Future<List<ResponseWavenApiWeapon>> GetAllWeapons() async {
    String url = 'https://waven-api.synedh.fr/weapons';
    String basicAuth = 'Basic ' + base64Encode(utf8.encode('Xeno:superpassword'));
    var response = await http.get(Uri.encodeFull(url),
        headers: {"Accept": "application/json", 'authorization': basicAuth});

    var responseDes = responseWavenApiWeaponFromJson(response.body);

    return responseDes;
  }

}