// To parse this JSON data, do
//
//     final responseWavenApiWeaponType = responseWavenApiWeaponTypeFromJson(jsonString);

import 'dart:convert';

ResponseWavenApiWeaponType responseWavenApiWeaponTypeFromJson(String str) {
  final jsonData = json.decode(str);
  return ResponseWavenApiWeaponType.fromJson(jsonData);
}

String responseWavenApiWeaponTypeToJson(ResponseWavenApiWeaponType data) {
  final dyn = data.toJson();
  return json.encode(dyn);
}

class ResponseWavenApiWeaponType {
  int life;
  int damage;
  int movement;
  String id;
  List<Spell> spells;
  List<Passive> passives;
  String imageUrl;
  int v;

  ResponseWavenApiWeaponType({
    this.life,
    this.damage,
    this.movement,
    this.id,
    this.spells,
    this.passives,
    this.imageUrl,
    this.v,
  });

  factory ResponseWavenApiWeaponType.fromJson(Map<String, dynamic> json) => new ResponseWavenApiWeaponType(
    life: json["life"],
    damage: json["damage"],
    movement: json["movement"],
    id: json["_id"],
    spells: new List<Spell>.from(json["spells"].map((x) => Spell.fromJson(x))),
    passives: new List<Passive>.from(json["passives"].map((x) => Passive.fromJson(x))),
    imageUrl: json["imageUrl"],
    v: json["__v"],
  );

  Map<String, dynamic> toJson() => {
    "life": life,
    "damage": damage,
    "movement": movement,
    "_id": id,
    "spells": new List<dynamic>.from(spells.map((x) => x.toJson())),
    "passives": new List<dynamic>.from(passives.map((x) => x.toJson())),
    "imageUrl": imageUrl,
    "__v": v,
  };
}

class Passive {
  String id;
  String description;

  Passive({
    this.id,
    this.description,
  });

  factory Passive.fromJson(Map<String, dynamic> json) => new Passive(
    id: json["_id"],
    description: json["description"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "description": description,
  };
}

class Spell {
  int stockpile;
  List<Resource> resources;
  String id;
  String name;
  String iconUrl;
  String description;
  int cost;
  int range;

  Spell({
    this.stockpile,
    this.resources,
    this.id,
    this.name,
    this.iconUrl,
    this.description,
    this.cost,
    this.range,
  });

  factory Spell.fromJson(Map<String, dynamic> json) => new Spell(
    stockpile: json["stockpile"],
    resources: new List<Resource>.from(json["resources"].map((x) => Resource.fromJson(x))),
    id: json["_id"],
    name: json["name"],
    iconUrl: json["iconUrl"],
    description: json["description"],
    cost: json["cost"],
    range: json["range"],
  );

  Map<String, dynamic> toJson() => {
    "stockpile": stockpile,
    "resources": new List<dynamic>.from(resources.map((x) => x.toJson())),
    "_id": id,
    "name": name,
    "iconUrl": iconUrl,
    "description": description,
    "cost": cost,
    "range": range,
  };
}

class Resource {
  String element;
  String id;
  int quantity;

  Resource({
    this.element,
    this.id,
    this.quantity,
  });

  factory Resource.fromJson(Map<String, dynamic> json) => new Resource(
    element: json["element"],
    id: json["_id"],
    quantity: json["quantity"],
  );

  Map<String, dynamic> toJson() => {
    "element": element,
    "_id": id,
    "quantity": quantity,
  };
}
