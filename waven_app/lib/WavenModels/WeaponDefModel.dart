// To parse this JSON data, do
//
//     final weaponDefModel = weaponDefModelFromJson(jsonString);

import 'dart:convert';

WeaponDefModel weaponDefModelFromJson(String str) {
  final jsonData = json.decode(str);
  return WeaponDefModel.fromJson(jsonData);
}

String weaponDefModelToJson(WeaponDefModel data) {
  final dyn = data.toJson();
  return json.encode(dyn);
}

class WeaponDefModel {
  String type;
  int id;
  AreaDefinition areaDefinition;
  PrecomputedData precomputedData;
  List<int> families;
  ActionValue life;
  MaxMechanismsOnBoard movementPoints;
  ActionValue actionValue;
  dynamic customActionTarget;
  int actionType;
  dynamic actionRange;
  int aiArchetype;
  int god;
  MaxMechanismsOnBoard playerActionPoints;
  MaxMechanismsOnBoard maxMechanismsOnBoard;
  MaxMechanismsOnBoard maxSummoningsOnBoard;
  List<int> spells;
  TextFr textFr;

  WeaponDefModel({
    this.type,
    this.id,
    this.areaDefinition,
    this.precomputedData,
    this.families,
    this.life,
    this.movementPoints,
    this.actionValue,
    this.customActionTarget,
    this.actionType,
    this.actionRange,
    this.aiArchetype,
    this.god,
    this.playerActionPoints,
    this.maxMechanismsOnBoard,
    this.maxSummoningsOnBoard,
    this.spells,
    this.textFr,
  });

  factory WeaponDefModel.fromJson(Map<String, dynamic> json) => new WeaponDefModel(
    type: json["type"],
    id: json["id"],
    areaDefinition: AreaDefinition.fromJson(json["areaDefinition"]),
    precomputedData: PrecomputedData.fromJson(json["precomputedData"]),
    families: new List<int>.from(json["families"].map((x) => x)),
    life: ActionValue.fromJson(json["life"]),
    movementPoints: MaxMechanismsOnBoard.fromJson(json["movementPoints"]),
    actionValue: ActionValue.fromJson(json["actionValue"]),
    customActionTarget: json["customActionTarget"],
    actionType: json["actionType"],
    actionRange: json["actionRange"],
    aiArchetype: json["aiArchetype"],
    god: json["god"],
    playerActionPoints: MaxMechanismsOnBoard.fromJson(json["playerActionPoints"]),
    maxMechanismsOnBoard: MaxMechanismsOnBoard.fromJson(json["maxMechanismsOnBoard"]),
    maxSummoningsOnBoard: MaxMechanismsOnBoard.fromJson(json["maxSummoningsOnBoard"]),
    spells: new List<int>.from(json["spells"].map((x) => x)),
    textFr: TextFr.fromJson(json["text_FR"]),
  );

  Map<String, dynamic> toJson() => {
    "type": type,
    "id": id,
    "areaDefinition": areaDefinition.toJson(),
    "precomputedData": precomputedData.toJson(),
    "families": new List<dynamic>.from(families.map((x) => x)),
    "life": life.toJson(),
    "movementPoints": movementPoints.toJson(),
    "actionValue": actionValue.toJson(),
    "customActionTarget": customActionTarget,
    "actionType": actionType,
    "actionRange": actionRange,
    "aiArchetype": aiArchetype,
    "god": god,
    "playerActionPoints": playerActionPoints.toJson(),
    "maxMechanismsOnBoard": maxMechanismsOnBoard.toJson(),
    "maxSummoningsOnBoard": maxSummoningsOnBoard.toJson(),
    "spells": new List<dynamic>.from(spells.map((x) => x)),
    "text_FR": textFr.toJson(),
  };
}

class ActionValue {
  String type;
  String referenceId;
  List<int> values;

  ActionValue({
    this.type,
    this.referenceId,
    this.values,
  });

  factory ActionValue.fromJson(Map<String, dynamic> json) => new ActionValue(
    type: json["type"],
    referenceId: json["referenceId"],
    values: new List<int>.from(json["values"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "type": type,
    "referenceId": referenceId,
    "values": new List<dynamic>.from(values.map((x) => x)),
  };
}

class AreaDefinition {
  String type;

  AreaDefinition({
    this.type,
  });

  factory AreaDefinition.fromJson(Map<String, dynamic> json) => new AreaDefinition(
    type: json["type"],
  );

  Map<String, dynamic> toJson() => {
    "type": type,
  };
}

class MaxMechanismsOnBoard {
  String type;
  String referenceId;
  int value;

  MaxMechanismsOnBoard({
    this.type,
    this.referenceId,
    this.value,
  });

  factory MaxMechanismsOnBoard.fromJson(Map<String, dynamic> json) => new MaxMechanismsOnBoard(
    type: json["type"],
    referenceId: json["referenceId"],
    value: json["value"],
  );

  Map<String, dynamic> toJson() => {
    "type": type,
    "referenceId": referenceId,
    "value": value,
  };
}

class PrecomputedData {
  String type;
  List<MaxMechanismsOnBoard> dynamicValueReferences;
  bool checkNumberOfSummonings;
  bool checkNumberOfMechanisms;
  List<String> keywordReferences;

  PrecomputedData({
    this.type,
    this.dynamicValueReferences,
    this.checkNumberOfSummonings,
    this.checkNumberOfMechanisms,
    this.keywordReferences,
  });

  factory PrecomputedData.fromJson(Map<String, dynamic> json) => new PrecomputedData(
    type: json["type"],
    dynamicValueReferences: new List<MaxMechanismsOnBoard>.from(json["dynamicValueReferences"].map((x) => MaxMechanismsOnBoard.fromJson(x))),
    checkNumberOfSummonings: json["checkNumberOfSummonings"],
    checkNumberOfMechanisms: json["checkNumberOfMechanisms"],
    keywordReferences: new List<String>.from(json["keywordReferences"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "type": type,
    "dynamicValueReferences": new List<dynamic>.from(dynamicValueReferences.map((x) => x.toJson())),
    "checkNumberOfSummonings": checkNumberOfSummonings,
    "checkNumberOfMechanisms": checkNumberOfMechanisms,
    "keywordReferences": new List<dynamic>.from(keywordReferences.map((x) => x)),
  };
}

class TextFr {
  String name;
  String description;

  TextFr({
    this.name,
    this.description,
  });

  factory TextFr.fromJson(Map<String, dynamic> json) => new TextFr(
    name: json["name"],
    description: json["description"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "description": description,
  };
}
