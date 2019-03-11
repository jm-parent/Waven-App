// To parse this JSON data, do
//
//     final responseWavenApiWeapon = responseWavenApiWeaponFromJson(jsonString);

import 'dart:convert';

List<ResponseWavenApiWeapon> responseWavenApiWeaponFromJson(String str) {
  final jsonData = json.decode(str);
  return new List<ResponseWavenApiWeapon>.from(jsonData.map((x) => ResponseWavenApiWeapon.fromJson(x)));
}

String responseWavenApiWeaponToJson(List<ResponseWavenApiWeapon> data) {
  final dyn = new List<dynamic>.from(data.map((x) => x.toJson()));
  return json.encode(dyn);
}

class ResponseWavenApiWeapon {
  String name;
  String iconUrl;
  String imageUrl;
  String description;
  List<Spell> spells;
  List<Passive> passives;
  List<Passive> weaponSkins;
  List<int> life;
  List<int> damage;
  List<int> movement;
  String id;
  int v;

  ResponseWavenApiWeapon({
    this.name,
    this.iconUrl,
    this.imageUrl,
    this.description,
    this.spells,
    this.passives,
    this.weaponSkins,
    this.life,
    this.damage,
    this.movement,
    this.id,
    this.v,
  });

  factory ResponseWavenApiWeapon.fromJson(Map<String, dynamic> json) => new ResponseWavenApiWeapon(
    name: json["name"] == null ? null : json["name"],
    iconUrl: json["iconUrl"] == null ? null : json["iconUrl"],
    imageUrl: json["imageUrl"] == null ? null : json["imageUrl"],
    description: json["description"] == null ? null : json["description"],
    spells: json["spells"] == null ? null : new List<Spell>.from(json["spells"].map((x) => Spell.fromJson(x))),
    passives: json["passives"] == null ? null : new List<Passive>.from(json["passives"].map((x) => Passive.fromJson(x))),
    weaponSkins: json["weaponSkins"] == null ? null : new List<Passive>.from(json["weaponSkins"].map((x) => Passive.fromJson(x))),
    life: json["life"] == null ? null : new List<int>.from(json["life"].map((x) => x)),
    damage: json["damage"] == null ? null : new List<int>.from(json["damage"].map((x) => x)),
    movement: json["movement"] == null ? null : new List<int>.from(json["movement"].map((x) => x)),
    id: json["_id"] == null ? null : json["_id"],
    v: json["__v"] == null ? null : json["__v"],
  );

  Map<String, dynamic> toJson() => {
    "name": name == null ? null : name,
    "iconUrl": iconUrl == null ? null : iconUrl,
    "imageUrl": imageUrl == null ? null : imageUrl,
    "description": description == null ? null : description,
    "spells": spells == null ? null : new List<dynamic>.from(spells.map((x) => x.toJson())),
    "passives": passives == null ? null : new List<dynamic>.from(passives.map((x) => x.toJson())),
    "weaponSkins": weaponSkins == null ? null : new List<dynamic>.from(weaponSkins.map((x) => x.toJson())),
    "life": life == null ? null : new List<dynamic>.from(life.map((x) => x)),
    "damage": damage == null ? null : new List<dynamic>.from(damage.map((x) => x)),
    "movement": movement == null ? null : new List<dynamic>.from(movement.map((x) => x)),
    "_id": id == null ? null : id,
    "__v": v == null ? null : v,
  };
}

class Passive {
  String name;
  String iconUrl;
  String description;
  String id;
  int v;
  String imageUrl;

  Passive({
    this.name,
    this.iconUrl,
    this.description,
    this.id,
    this.v,
    this.imageUrl,
  });

  factory Passive.fromJson(Map<String, dynamic> json) => new Passive(
    name: json["name"] == null ? null : json["name"],
    iconUrl: json["iconUrl"] == null ? null : json["iconUrl"],
    description: json["description"] == null ? null : json["description"],
    id: json["_id"] == null ? null : json["_id"],
    v: json["__v"] == null ? null : json["__v"],
    imageUrl: json["imageUrl"] == null ? null : json["imageUrl"],
  );

  Map<String, dynamic> toJson() => {
    "name": name == null ? null : name,
    "iconUrl": iconUrl == null ? null : iconUrl,
    "description": description == null ? null : description,
    "_id": id == null ? null : id,
    "__v": v == null ? null : v,
    "imageUrl": imageUrl == null ? null : imageUrl,
  };
}

class Spell {
  String name;
  String iconUrl;
  String description;
  int cost;
  int range;
  bool line;
  int stockpile;
  String id;
  List<Resource> resources;
  int v;

  Spell({
    this.name,
    this.iconUrl,
    this.description,
    this.cost,
    this.range,
    this.line,
    this.stockpile,
    this.id,
    this.resources,
    this.v,
  });

  factory Spell.fromJson(Map<String, dynamic> json) => new Spell(
    name: json["name"] == null ? null : json["name"],
    iconUrl: json["iconUrl"] == null ? null : json["iconUrl"],
    description: json["description"] == null ? null : json["description"],
    cost: json["cost"] == null ? null : json["cost"],
    range: json["range"] == null ? null : json["range"],
    line: json["line"] == null ? null : json["line"],
    stockpile: json["stockpile"] == null ? null : json["stockpile"],
    id: json["_id"] == null ? null : json["_id"],
    resources: json["resources"] == null ? null : new List<Resource>.from(json["resources"].map((x) => Resource.fromJson(x))),
    v: json["__v"] == null ? null : json["__v"],
  );

  Map<String, dynamic> toJson() => {
    "name": name == null ? null : name,
    "iconUrl": iconUrl == null ? null : iconUrl,
    "description": description == null ? null : description,
    "cost": cost == null ? null : cost,
    "range": range == null ? null : range,
    "line": line == null ? null : line,
    "stockpile": stockpile == null ? null : stockpile,
    "_id": id == null ? null : id,
    "resources": resources == null ? null : new List<dynamic>.from(resources.map((x) => x.toJson())),
    "__v": v == null ? null : v,
  };
}

class Resource {
  String id;
  String element;
  int quantity;

  Resource({
    this.id,
    this.element,
    this.quantity,
  });

  factory Resource.fromJson(Map<String, dynamic> json) => new Resource(
    id: json["_id"] == null ? null : json["_id"],
    element: json["element"] == null ? null : json["element"],
    quantity: json["quantity"] == null ? null : json["quantity"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id == null ? null : id,
    "element": element == null ? null : element,
    "quantity": quantity == null ? null : quantity,
  };
}
