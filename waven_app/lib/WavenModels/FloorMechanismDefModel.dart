// To parse this JSON data, do
//
//     final floorMechanismDefModel = floorMechanismDefModelFromJson(jsonString);

import 'dart:convert';

FloorMechanismDefModel floorMechanismDefModelFromJson(String str) {
  final jsonData = json.decode(str);
  return FloorMechanismDefModel.fromJson(jsonData);
}

String floorMechanismDefModelToJson(FloorMechanismDefModel data) {
  final dyn = data.toJson();
  return json.encode(dyn);
}

class FloorMechanismDefModel {
  String type;
  int id;
  AreaDefinition areaDefinition;
  PrecomputedData precomputedData;
  List<int> families;
  AreaDefinition effectAreaDefinition;
  int floorType;
  ActivationValue activationValue;
  int activationType;
  TextFr textFr;

  FloorMechanismDefModel({
    this.type,
    this.id,
    this.areaDefinition,
    this.precomputedData,
    this.families,
    this.effectAreaDefinition,
    this.floorType,
    this.activationValue,
    this.activationType,
    this.textFr,
  });

  factory FloorMechanismDefModel.fromJson(Map<String, dynamic> json) => new FloorMechanismDefModel(
    type: json["type"],
    id: json["id"],
    areaDefinition: AreaDefinition.fromJson(json["areaDefinition"]),
    precomputedData: PrecomputedData.fromJson(json["precomputedData"]),
    families: new List<int>.from(json["families"].map((x) => x)),
    effectAreaDefinition: AreaDefinition.fromJson(json["effectAreaDefinition"]),
    floorType: json["floorType"],
    activationValue: ActivationValue.fromJson(json["activationValue"]),
    activationType: json["activationType"],
    textFr: TextFr.fromJson(json["text_FR"]),
  );

  Map<String, dynamic> toJson() => {
    "type": type,
    "id": id,
    "areaDefinition": areaDefinition.toJson(),
    "precomputedData": precomputedData.toJson(),
    "families": new List<dynamic>.from(families.map((x) => x)),
    "effectAreaDefinition": effectAreaDefinition.toJson(),
    "floorType": floorType,
    "activationValue": activationValue.toJson(),
    "activationType": activationType,
    "text_FR": textFr.toJson(),
  };
}

class ActivationValue {
  String type;
  String referenceId;
  List<int> values;

  ActivationValue({
    this.type,
    this.referenceId,
    this.values,
  });

  factory ActivationValue.fromJson(Map<String, dynamic> json) => new ActivationValue(
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

class PrecomputedData {
  String type;
  List<ActivationValue> dynamicValueReferences;
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
    dynamicValueReferences: new List<ActivationValue>.from(json["dynamicValueReferences"].map((x) => ActivationValue.fromJson(x))),
    checkNumberOfSummonings: json["checkNumberOfSummonings"],
    checkNumberOfMechanisms: json["checkNumberOfMechanisms"],
    keywordReferences: new List<dynamic>.from(json["keywordReferences"].map((x) => x)),
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
