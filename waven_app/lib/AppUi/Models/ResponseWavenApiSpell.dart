// To parse this JSON data, do
//
//     final responseWavenApiSpells = responseWavenApiSpellsFromJson(jsonString);

import 'dart:convert';

List<ResponseWavenApiSpell> responseWavenApiSpellsFromJson(String str) {
  final jsonData = json.decode(str);
  return new List<ResponseWavenApiSpell>.from(jsonData.map((x) => ResponseWavenApiSpell.fromJson(x)));
}

String responseWavenApiSpellsToJson(List<ResponseWavenApiSpell> data) {
  final dyn = new List<dynamic>.from(data.map((x) => x.toJson()));
  return json.encode(dyn);
}

class ResponseWavenApiSpell {
  int stockpile;
  String id;
  String name;
  String iconUrl;
  String description;
  int cost;
  List<Resource> resources;
  int v;

  ResponseWavenApiSpell({
    this.stockpile,
    this.id,
    this.name,
    this.iconUrl,
    this.description,
    this.cost,
    this.resources,
    this.v,
  });

  factory ResponseWavenApiSpell.fromJson(Map<String, dynamic> json) => new ResponseWavenApiSpell(
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

enum ElementEnum { Feu, Eau, Terre, Air }

final elementValues = new EnumValues({
  "5be042943fb2fa187ff753bf": ElementEnum.Air,
  "5be042b63fb2fa187ff753c0": ElementEnum.Feu,
  "5be042c43fb2fa187ff753c1": ElementEnum.Terre,
  "5be042cf3fb2fa187ff753c2": ElementEnum.Eau
});

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}
