// To parse this JSON data, do
//
//     final companionDefModel = companionDefModelFromJson(jsonString);

import 'dart:convert';

CompanionDefModel companionDefModelFromJson(String str) {
  final jsonData = json.decode(str);
  return CompanionDefModel.fromJson(jsonData);
}

String companionDefModelToJson(CompanionDefModel data) {
  final dyn = data.toJson();
  return json.encode(dyn);
}

class CompanionDefModel {
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
  List<int> eventsInvalidatingCost;
  List<int> eventsInvalidatingCasting;
  SpawnLocation spawnLocation;
  List<Cost> cost;
  List<dynamic> spells;
  TextFr textFr;

  CompanionDefModel({
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
    this.eventsInvalidatingCost,
    this.eventsInvalidatingCasting,
    this.spawnLocation,
    this.cost,
    this.spells,
    this.textFr,
  });

  factory CompanionDefModel.fromJson(Map<String, dynamic> json) => new CompanionDefModel(
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
    eventsInvalidatingCost: new List<int>.from(json["eventsInvalidatingCost"].map((x) => x)),
    eventsInvalidatingCasting: new List<int>.from(json["eventsInvalidatingCasting"].map((x) => x)),
    spawnLocation: SpawnLocation.fromJson(json["spawnLocation"]),
    cost: new List<Cost>.from(json["cost"].map((x) => Cost.fromJson(x))),
    spells: new List<dynamic>.from(json["spells"].map((x) => x)),
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
    "eventsInvalidatingCost": new List<dynamic>.from(eventsInvalidatingCost.map((x) => x)),
    "eventsInvalidatingCasting": new List<dynamic>.from(eventsInvalidatingCasting.map((x) => x)),
    "spawnLocation": spawnLocation.toJson(),
    "cost": new List<dynamic>.from(cost.map((x) => x.toJson())),
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

class Cost {
  String type;
  int element;
  MovementPoints value;

  Cost({
    this.type,
    this.element,
    this.value,
  });

  factory Cost.fromJson(Map<String, dynamic> json) => new Cost(
    type: json["type"],
    element: json["element"],
    value: MovementPoints.fromJson(json["value"]),
  );

  Map<String, dynamic> toJson() => {
    "type": type,
    "element": element,
    "value": value.toJson(),
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

class SpawnLocation {
  String type;
  List<Filter> filters;

  SpawnLocation({
    this.type,
    this.filters,
  });

  factory SpawnLocation.fromJson(Map<String, dynamic> json) => new SpawnLocation(
    type: json["type"],
    filters: new List<Filter>.from(json["filters"].map((x) => Filter.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "type": type,
    "filters": new List<dynamic>.from(filters.map((x) => x.toJson())),
  };
}

class Filter {
  String type;
  AreaDefinition targetsToCompare;
  Distance distance;

  Filter({
    this.type,
    this.targetsToCompare,
    this.distance,
  });

  factory Filter.fromJson(Map<String, dynamic> json) => new Filter(
    type: json["type"],
    targetsToCompare: json["targetsToCompare"] == null ? null : AreaDefinition.fromJson(json["targetsToCompare"]),
    distance: json["distance"] == null ? null : Distance.fromJson(json["distance"]),
  );

  Map<String, dynamic> toJson() => {
    "type": type,
    "targetsToCompare": targetsToCompare == null ? null : targetsToCompare.toJson(),
    "distance": distance == null ? null : distance.toJson(),
  };
}

class Distance {
  String type;
  MovementPoints dynamicValue;

  Distance({
    this.type,
    this.dynamicValue,
  });

  factory Distance.fromJson(Map<String, dynamic> json) => new Distance(
    type: json["type"],
    dynamicValue: MovementPoints.fromJson(json["dynamicValue"]),
  );

  Map<String, dynamic> toJson() => {
    "type": type,
    "dynamicValue": dynamicValue.toJson(),
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
