// To parse this JSON data, do
//
//     final spellDefModel = spellDefModelFromJson(jsonString);

import 'dart:convert';

SpellDefModel spellDefModelFromJson(String str) {
  final jsonData = json.decode(str);
  return SpellDefModel.fromJson(jsonData);
}

String spellDefModelToJson(SpellDefModel data) {
  final dyn = data.toJson();
  return json.encode(dyn);
}

class SpellDefModel {
  String type;
  int id;
  List<int> eventsInvalidatingCost;
  List<int> eventsInvalidatingCasting;
  PrecomputedData precomputedData;
  int spellType;
  int spellFamily;
  int god;
  int element;
  List<GaugeToModifyOnSpellPlay> gaugeToModifyOnSpellPlay;
  List<Cost> costs;
  CastTarget castTarget;
  List<SpellEffectDatum> spellEffectData;
  TextFr textFr;

  SpellDefModel({
    this.type,
    this.id,
    this.eventsInvalidatingCost,
    this.eventsInvalidatingCasting,
    this.precomputedData,
    this.spellType,
    this.spellFamily,
    this.god,
    this.element,
    this.gaugeToModifyOnSpellPlay,
    this.costs,
    this.castTarget,
    this.spellEffectData,
    this.textFr,
  });

  factory SpellDefModel.fromJson(Map<String, dynamic> json) => new SpellDefModel(
    type: json["type"],
    id: json["id"],
    eventsInvalidatingCost: new List<int>.from(json["eventsInvalidatingCost"].map((x) => x)),
    eventsInvalidatingCasting: new List<int>.from(json["eventsInvalidatingCasting"].map((x) => x)),
    precomputedData: PrecomputedData.fromJson(json["precomputedData"]),
    spellType: json["spellType"],
    spellFamily: json["spellFamily"],
    god: json["god"],
    element: json["element"],
    gaugeToModifyOnSpellPlay: new List<GaugeToModifyOnSpellPlay>.from(json["gaugeToModifyOnSpellPlay"].map((x) => GaugeToModifyOnSpellPlay.fromJson(x))),
    costs: new List<Cost>.from(json["costs"].map((x) => Cost.fromJson(x))),
    castTarget: CastTarget.fromJson(json["castTarget"]),
    spellEffectData: new List<SpellEffectDatum>.from(json["spellEffectData"].map((x) => SpellEffectDatum.fromJson(x))),
    textFr: TextFr.fromJson(json["text_FR"]),
  );

  Map<String, dynamic> toJson() => {
    "type": type,
    "id": id,
    "eventsInvalidatingCost": new List<dynamic>.from(eventsInvalidatingCost.map((x) => x)),
    "eventsInvalidatingCasting": new List<dynamic>.from(eventsInvalidatingCasting.map((x) => x)),
    "precomputedData": precomputedData.toJson(),
    "spellType": spellType,
    "spellFamily": spellFamily,
    "god": god,
    "element": element,
    "gaugeToModifyOnSpellPlay": new List<dynamic>.from(gaugeToModifyOnSpellPlay.map((x) => x.toJson())),
    "costs": new List<dynamic>.from(costs.map((x) => x.toJson())),
    "castTarget": castTarget.toJson(),
    "spellEffectData": new List<dynamic>.from(spellEffectData.map((x) => x.toJson())),
    "text_FR": textFr.toJson(),
  };
}

class CastTarget {
  String type;
  Selector selector;

  CastTarget({
    this.type,
    this.selector,
  });

  factory CastTarget.fromJson(Map<String, dynamic> json) => new CastTarget(
    type: json["type"],
    selector: Selector.fromJson(json["selector"]),
  );

  Map<String, dynamic> toJson() => {
    "type": type,
    "selector": selector.toJson(),
  };
}

class Selector {
  String type;

  Selector({
    this.type,
  });

  factory Selector.fromJson(Map<String, dynamic> json) => new Selector(
    type: json["type"],
  );

  Map<String, dynamic> toJson() => {
    "type": type,
  };
}

class Cost {
  String type;
  Value value;

  Cost({
    this.type,
    this.value,
  });

  factory Cost.fromJson(Map<String, dynamic> json) => new Cost(
    type: json["type"],
    value: Value.fromJson(json["value"]),
  );

  Map<String, dynamic> toJson() => {
    "type": type,
    "value": value.toJson(),
  };
}

class Value {
  String type;
  String referenceId;
  int value;

  Value({
    this.type,
    this.referenceId,
    this.value,
  });

  factory Value.fromJson(Map<String, dynamic> json) => new Value(
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

class GaugeToModifyOnSpellPlay {
  String type;
  int element;
  Value value;

  GaugeToModifyOnSpellPlay({
    this.type,
    this.element,
    this.value,
  });

  factory GaugeToModifyOnSpellPlay.fromJson(Map<String, dynamic> json) => new GaugeToModifyOnSpellPlay(
    type: json["type"],
    element: json["element"],
    value: Value.fromJson(json["value"]),
  );

  Map<String, dynamic> toJson() => {
    "type": type,
    "element": element,
    "value": value.toJson(),
  };
}

class PrecomputedData {
  String type;
  List<DynamicValueReference> dynamicValueReferences;
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
    dynamicValueReferences: new List<DynamicValueReference>.from(json["dynamicValueReferences"].map((x) => DynamicValueReference.fromJson(x))),
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

class DynamicValueReference {
  String type;
  String referenceId;
  List<int> values;

  DynamicValueReference({
    this.type,
    this.referenceId,
    this.values,
  });

  factory DynamicValueReference.fromJson(Map<String, dynamic> json) => new DynamicValueReference(
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

class SpellEffectDatum {
  String type;
  String spellEffect;
  Selector originTarget;
  dynamic orientation;
  dynamic delayOverDistance;

  SpellEffectDatum({
    this.type,
    this.spellEffect,
    this.originTarget,
    this.orientation,
    this.delayOverDistance,
  });

  factory SpellEffectDatum.fromJson(Map<String, dynamic> json) => new SpellEffectDatum(
    type: json["type"],
    spellEffect: json["spellEffect"],
    originTarget: Selector.fromJson(json["originTarget"]),
    orientation: json["orientation"],
    delayOverDistance: json["delayOverDistance"],
  );

  Map<String, dynamic> toJson() => {
    "type": type,
    "spellEffect": spellEffect,
    "originTarget": originTarget.toJson(),
    "orientation": orientation,
    "delayOverDistance": delayOverDistance,
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
