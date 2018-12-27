// To parse this JSON data, do
//
//     final objectMechanismDefModel = objectMechanismDefModelFromJson(jsonString);

import 'dart:convert';

ObjectMechanismDefModel objectMechanismDefModelFromJson(String str) {
  final jsonData = json.decode(str);
  return ObjectMechanismDefModel.fromJson(jsonData);
}

String objectMechanismDefModelToJson(ObjectMechanismDefModel data) {
  final dyn = data.toJson();
  return json.encode(dyn);
}

class ObjectMechanismDefModel {
  String type;
  int id;
  AreaDefinition areaDefinition;
  PrecomputedData precomputedData;
  List<int> families;
  AreaDefinition effectAreaDefinition;
  BaseMecaLife baseMecaLife;
  TextFr textFr;

  ObjectMechanismDefModel({
    this.type,
    this.id,
    this.areaDefinition,
    this.precomputedData,
    this.families,
    this.effectAreaDefinition,
    this.baseMecaLife,
    this.textFr,
  });

  factory ObjectMechanismDefModel.fromJson(Map<String, dynamic> json) => new ObjectMechanismDefModel(
    type: json["type"],
    id: json["id"],
    areaDefinition: AreaDefinition.fromJson(json["areaDefinition"]),
    precomputedData: PrecomputedData.fromJson(json["precomputedData"]),
    families: new List<int>.from(json["families"].map((x) => x)),
    effectAreaDefinition: AreaDefinition.fromJson(json["effectAreaDefinition"]),
    baseMecaLife: BaseMecaLife.fromJson(json["baseMecaLife"]),
    textFr: TextFr.fromJson(json["text_FR"]),
  );

  Map<String, dynamic> toJson() => {
    "type": type,
    "id": id,
    "areaDefinition": areaDefinition.toJson(),
    "precomputedData": precomputedData.toJson(),
    "families": new List<dynamic>.from(families.map((x) => x)),
    "effectAreaDefinition": effectAreaDefinition.toJson(),
    "baseMecaLife": baseMecaLife.toJson(),
    "text_FR": textFr.toJson(),
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

class BaseMecaLife {
  String type;
  String referenceId;
  List<int> values;

  BaseMecaLife({
    this.type,
    this.referenceId,
    this.values,
  });

  factory BaseMecaLife.fromJson(Map<String, dynamic> json) => new BaseMecaLife(
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

class PrecomputedData {
  String type;
  List<dynamic> dynamicValueReferences;
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
    dynamicValueReferences: new List<dynamic>.from(json["dynamicValueReferences"].map((x) => x)),
    checkNumberOfSummonings: json["checkNumberOfSummonings"],
    checkNumberOfMechanisms: json["checkNumberOfMechanisms"],
    keywordReferences: new List<String>.from(json["keywordReferences"].map((x) => x)),
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
