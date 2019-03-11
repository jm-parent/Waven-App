// To parse this JSON data, do
//
//     final responseWavenApiDetailledClass = responseWavenApiDetailledClassFromJson(jsonString);

import 'dart:convert';

import 'package:waven_app/AppUi/Models/CommonDataForModel.dart';

ResponseWavenApiDetailledClass responseWavenApiDetailledClassFromJson(String str) {
  final jsonData = json.decode(str);
  return ResponseWavenApiDetailledClass.fromJson(jsonData);
}

String responseWavenApiDetailledClassToJson(ResponseWavenApiDetailledClass data) {
  final dyn = data.toJson();
  return json.encode(dyn);
}

class ResponseWavenApiDetailledClass {
  List<dynamic> tags;
  List<String> weaponTypes;
  List<Weapon> weapons;
  List<Spell> spells;
  String id;
  String name;
  String description;
  int v;
  String imageUrl;
  String fullName;

  ResponseWavenApiDetailledClass({
    this.tags,
    this.weaponTypes,
    this.weapons,
    this.spells,
    this.id,
    this.name,
    this.description,
    this.v,
    this.imageUrl,
    this.fullName,
  });

  factory ResponseWavenApiDetailledClass.fromJson(Map<String, dynamic> json) => new ResponseWavenApiDetailledClass(
    tags: new List<dynamic>.from(json["tags"].map((x) => x)),
    weaponTypes: new List<String>.from(json["weaponTypes"].map((x) => x)),
    weapons: new List<Weapon>.from(json["weapons"].map((x) => Weapon.fromJson(x))),
    spells: new List<Spell>.from(json["spells"].map((x) => Spell.fromJson(x))),
    id: json["_id"],
    name: json["name"],
    description: json["description"],
    v: json["__v"],
    imageUrl: json["imageUrl"],
    fullName: json["fullName"],
  );

  Map<String, dynamic> toJson() => {
    "tags": new List<dynamic>.from(tags.map((x) => x)),
    "weaponTypes": new List<dynamic>.from(weaponTypes.map((x) => x)),
    "weapons": new List<dynamic>.from(weapons.map((x) => x.toJson())),
    "spells": new List<dynamic>.from(spells.map((x) => x.toJson())),
    "_id": id,
    "name": name,
    "description": description,
    "__v": v,
    "imageUrl": imageUrl,
    "fullName":fullName,
  };
}

class Spell {
  int stockpile;
  String id;
  String name;
  String iconUrl;
  String description;
  int cost;
  List<Resource> resources;
  int v;

  Spell({
    this.stockpile,
    this.id,
    this.name,
    this.iconUrl,
    this.description,
    this.cost,
    this.resources,
    this.v,
  });

  factory Spell.fromJson(Map<String, dynamic> json) => new Spell(
    stockpile: json["stockpile"],
    id: json["_id"],
    name: json["name"],
    iconUrl: json["iconUrl"],
    description: json["description"],
    cost: json["cost"],
    resources: new List<Resource>.from(json["resources"].map((x) => Resource.fromJson(x))),
    v: json["__v"],
  );

  Map<String, dynamic> toJson() => {
    "stockpile": stockpile,
    "_id": id,
    "name": name,
    "iconUrl": iconUrl,
    "description": description,
    "cost": cost,
    "resources": new List<dynamic>.from(resources.map((x) => x.toJson())),
    "__v": v,
  };
}

class Resource {
  ElementEnum element;
  String id;
  int quantity;

  Resource({
    this.element,
    this.id,
    this.quantity,
  });

  factory Resource.fromJson(Map<String, dynamic> json) => new Resource(
    element: elementValues.map[json["element"]],
    id: json["_id"],
    quantity: json["quantity"],
  );

  Map<String, dynamic> toJson() => {
    "element": elementValues.reverse[element],
    "_id": id,
    "quantity": quantity,
  };
}


class Weapon {
  String id;
  String name;
  String imageUrl;
  String iconUrl;
  WeaponType weaponType;
  int v;

  Weapon({
    this.id,
    this.name,
    this.imageUrl,
    this.iconUrl,
    this.weaponType,
    this.v,
  });

  factory Weapon.fromJson(Map<String, dynamic> json) => new Weapon(
    id: json["_id"],
    name: json["name"],
    imageUrl: json["imageUrl"],
    iconUrl: json["iconUrl"],
    weaponType: WeaponType.fromJson(json["weaponType"]),
    v: json["__v"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "name": name,
    "imageUrl": imageUrl,
    "iconUrl": iconUrl,
    "weaponType": weaponType.toJson(),
    "__v": v,
  };
}

class WeaponType {
  List<String> spells;
  List<String> passives;
  int life;
  int damage;
  int movement;
  String id;
  String imageUrl;
  int v;

  WeaponType({
    this.spells,
    this.passives,
    this.life,
    this.damage,
    this.movement,
    this.id,
    this.imageUrl,
    this.v,
  });

  factory WeaponType.fromJson(Map<String, dynamic> json) => new WeaponType(
    spells: new List<String>.from(json["spells"].map((x) => x)),
    passives: new List<String>.from(json["passives"].map((x) => x)),
    life: json["life"],
    damage: json["damage"],
    movement: json["movement"],
    id: json["_id"],
    imageUrl: json["imageUrl"],
    v: json["__v"],
  );

  Map<String, dynamic> toJson() => {
    "spells": new List<dynamic>.from(spells.map((x) => x)),
    "passives": new List<dynamic>.from(passives.map((x) => x)),
    "life": life,
    "damage": damage,
    "movement": movement,
    "_id": id,
    "imageUrl": imageUrl,
    "__v": v,
  };
}
