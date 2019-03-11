// To parse this JSON data, do
//
//     final responseWavenApiDetailledSpell = responseWavenApiDetailledSpellFromJson(jsonString);

import 'dart:convert';

ResponseWavenApiDetailledSpell responseWavenApiDetailledSpellFromJson(String str) {
  final jsonData = json.decode(str);
  return ResponseWavenApiDetailledSpell.fromJson(jsonData);
}

String responseWavenApiDetailledSpellToJson(ResponseWavenApiDetailledSpell data) {
  final dyn = data.toJson();
  return json.encode(dyn);
}

class ResponseWavenApiDetailledSpell {
  int stockpile;
  String id;
  String name;
  String iconUrl;
  String description;
  int cost;
  List<Resource> resources;
  int v;

  ResponseWavenApiDetailledSpell({
    this.stockpile,
    this.id,
    this.name,
    this.iconUrl,
    this.description,
    this.cost,
    this.resources,
    this.v,
  });

  factory ResponseWavenApiDetailledSpell.fromJson(Map<String, dynamic> json) => new ResponseWavenApiDetailledSpell(
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
  String id;
  String element;
  int quantity;

  Resource({
    this.id,
    this.element,
    this.quantity,
  });

  factory Resource.fromJson(Map<String, dynamic> json) => new Resource(
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
