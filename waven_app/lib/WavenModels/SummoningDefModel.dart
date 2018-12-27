// To parse this JSON data, do
//
//     final summoningDefModel = summoningDefModelFromJson(jsonString);

import 'dart:convert';

SummoningDefModel summoningDefModelFromJson(String str) {
  final jsonData = json.decode(str);
  return SummoningDefModel.fromJson(jsonData);
}

String summoningDefModelToJson(SummoningDefModel data) {
  final dyn = data.toJson();
  return json.encode(dyn);
}

class SummoningDefModel {
  String type;
  int id;
  AreaDefinition areaDefinition;
  PrecomputedData precomputedData;
  List<int> families;
  ActionValue life;
  MovementPoints movementPoints;
  ActionValue actionValue;
  dynamic customActionTarget;
  int actionType;
  dynamic actionRange;
  int aiArchetype;
  List<dynamic> cost;
  GrowInto growInto;
  TextFr textFr;

  SummoningDefModel({
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
    this.cost,
    this.growInto,
    this.textFr,
  });

  factory SummoningDefModel.fromJson(Map<String, dynamic> json) => new SummoningDefModel(
    type: json["type"],
    id: json["id"],
    areaDefinition: AreaDefinition.fromJson(json["areaDefinition"]),
    precomputedData: PrecomputedData.fromJson(json["precomputedData"]),
    families: new List<int>.from(json["families"].map((x) => x)),
    life: ActionValue.fromJson(json["life"]),
    movementPoints: MovementPoints.fromJson(json["movementPoints"]),
    actionValue: ActionValue.fromJson(json["actionValue"]),
    customActionTarget: json["customActionTarget"],
    actionType: json["actionType"],
    actionRange: json["actionRange"],
    aiArchetype: json["aiArchetype"],
    cost: new List<dynamic>.from(json["cost"].map((x) => x)),
    growInto: GrowInto.fromJson(json["growInto"]),
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
    "cost": new List<dynamic>.from(cost.map((x) => x)),
    "growInto": growInto.toJson(),
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

class GrowInto {
  String type;
  String referenceId;
  int summonId;

  GrowInto({
    this.type,
    this.referenceId,
    this.summonId,
  });

  factory GrowInto.fromJson(Map<String, dynamic> json) => new GrowInto(
    type: json["type"],
    referenceId: json["referenceId"],
    summonId: json["summonId"],
  );

  Map<String, dynamic> toJson() => {
    "type": type,
    "referenceId": referenceId,
    "summonId": summonId,
  };
}

class MovementPoints {
  String type;
  String referenceId;
  int value;

  MovementPoints({
    this.type,
    this.referenceId,
    this.value,
  });

  factory MovementPoints.fromJson(Map<String, dynamic> json) => new MovementPoints(
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
  List<dynamic> dynamicValueReferences;
  bool checkNumberOfSummonings;
  bool checkNumberOfMechanisms;
  List<dynamic> keywordReferences;

  PrecomputedData({
    this.type,
    this.dynamicValueReferences,
    this.checkNumberOfSummonings,
    this.checkNumberOfMechanisms,
    this.keywordReferences,
  });

  factory PrecomputedData.fromJson(Map<String, dynamic> json) => new PrecomputedData(
    type: json["type"],
    dynamicValueReferences: new List<dynamic>.from(json["dynamicValueReferences"].map((x) => x)),
    checkNumberOfSummonings: json["checkNumberOfSummonings"],
    checkNumberOfMechanisms: json["checkNumberOfMechanisms"],
    keywordReferences: new List<dynamic>.from(json["keywordReferences"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "type": type,
    "dynamicValueReferences": new List<dynamic>.from(dynamicValueReferences.map((x) => x)),
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
