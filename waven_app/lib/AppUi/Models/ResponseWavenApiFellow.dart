// To parse this JSON data, do
//
//     final responseWavenApiFellow = responseWavenApiFellowFromJson(jsonString);

import 'dart:convert';

List<ResponseWavenApiFellow> responseWavenApiFellowFromJson(String str) {
  final jsonData = json.decode(str);
  return new List<ResponseWavenApiFellow>.from(jsonData.map((x) => ResponseWavenApiFellow.fromJson(x)));
}

String responseWavenApiFellowToJson(List<ResponseWavenApiFellow> data) {
  final dyn = new List<dynamic>.from(data.map((x) => x.toJson()));
  return json.encode(dyn);
}

class ResponseWavenApiFellow {
  List<String> spells;
  List<String> passives;
  List<String> transfer;
  String id;
  String name;
  String iconUrl;
  String imageUrl;
  List<Cost> cost;
  int life;
  int damage;
  int movement;
  int v;
  String description;

  ResponseWavenApiFellow({
    this.spells,
    this.passives,
    this.transfer,
    this.id,
    this.name,
    this.iconUrl,
    this.imageUrl,
    this.cost,
    this.life,
    this.damage,
    this.movement,
    this.v,
    this.description,
  });

  factory ResponseWavenApiFellow.fromJson(Map<String, dynamic> json) => new ResponseWavenApiFellow(
    spells: new List<String>.from(json["spells"].map((x) => x)),
    passives: new List<String>.from(json["passives"].map((x) => x)),
    transfer: new List<String>.from(json["transfer"].map((x) => x)),
    id: json["_id"],
    name: json["name"],
    iconUrl: json["iconUrl"],
    imageUrl: json["imageUrl"],
    cost: new List<Cost>.from(json["cost"].map((x) => Cost.fromJson(x))),
    life: json["life"],
    damage: json["damage"],
    movement: json["movement"],
    v: json["__v"],
    description: json["description"],
  );

  Map<String, dynamic> toJson() => {
    "spells": new List<dynamic>.from(spells.map((x) => x)),
    "passives": new List<dynamic>.from(passives.map((x) => x)),
    "transfer": new List<dynamic>.from(transfer.map((x) => x)),
    "_id": id,
    "name": name,
    "iconUrl": iconUrl,
    "imageUrl": imageUrl,
    "cost": new List<dynamic>.from(cost.map((x) => x.toJson())),
    "life": life,
    "damage": damage,
    "movement": movement,
    "__v": v,
    "description": description,
  };
}

class Cost {
  String id;
  String element;
  int quantity;

  Cost({
    this.id,
    this.element,
    this.quantity,
  });

  factory Cost.fromJson(Map<String, dynamic> json) => new Cost(
    id: json["_id"],
    element: json["element"],
    quantity: json["quantity"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "element": element,
    "quantity": quantity,
  };
}
