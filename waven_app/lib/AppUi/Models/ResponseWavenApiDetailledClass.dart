// To parse this JSON data, do
//
//     final responseWavenApiDetailledClass = responseWavenApiDetailledClassFromJson(jsonString);

import 'dart:convert';

ResponseWavenApiDetailledClass responseWavenApiDetailledClassFromJson(String str) {
  final jsonData = json.decode(str);
  return ResponseWavenApiDetailledClass.fromJson(jsonData);
}

String responseWavenApiDetailledClassToJson(ResponseWavenApiDetailledClass data) {
  final dyn = data.toJson();
  return json.encode(dyn);
}

class ResponseWavenApiDetailledClass {
  String name;
  String fullName;
  String portraitUrl;
  String imageUrl;
  String description;
  List<Weapon> weapons;
  List<Spell> spells;
  String id;
  int v;

  ResponseWavenApiDetailledClass({
    this.name,
    this.fullName,
    this.portraitUrl,
    this.imageUrl,
    this.description,
    this.weapons,
    this.spells,
    this.id,
    this.v,
  });

  factory ResponseWavenApiDetailledClass.fromJson(Map<String, dynamic> json) => new ResponseWavenApiDetailledClass(
    name: json["name"] == null ? null : json["name"],
    fullName: json["fullName"] == null ? null : json["fullName"],
    portraitUrl: json["portraitUrl"] == null ? null : json["portraitUrl"],
    imageUrl: json["imageUrl"] == null ? null : json["imageUrl"],
    description: json["description"] == null ? null : json["description"],
    weapons: json["weapons"] == null ? null : new List<Weapon>.from(json["weapons"].map((x) => Weapon.fromJson(x))),
    spells: json["spells"] == null ? null : new List<Spell>.from(json["spells"].map((x) => Spell.fromJson(x))),
    id: json["_id"] == null ? null : json["_id"],
    v: json["__v"] == null ? null : json["__v"],
  );

  Map<String, dynamic> toJson() => {
    "name": name == null ? null : name,
    "fullName": fullName == null ? null : fullName,
    "portraitUrl": portraitUrl == null ? null : portraitUrl,
    "imageUrl": imageUrl == null ? null : imageUrl,
    "description": description == null ? null : description,
    "weapons": weapons == null ? null : new List<dynamic>.from(weapons.map((x) => x.toJson())),
    "spells": spells == null ? null : new List<dynamic>.from(spells.map((x) => x.toJson())),
    "_id": id == null ? null : id,
    "__v": v == null ? null : v,
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

class Weapon {
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

  Weapon({
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

  factory Weapon.fromJson(Map<String, dynamic> json) => new Weapon(
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
