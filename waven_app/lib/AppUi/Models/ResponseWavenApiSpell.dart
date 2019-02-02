// To parse this JSON data, do
//
//     final responseWavenApiSpell = responseWavenApiSpellFromJson(jsonString);

import 'dart:convert';

ResponseWavenApiSpell responseWavenApiSpellFromJson(String str) {
  final jsonData = json.decode(str);
  return ResponseWavenApiSpell.fromJson(jsonData);
}

String responseWavenApiSpellToJson(ResponseWavenApiSpell data) {
  final dyn = data.toJson();
  return json.encode(dyn);
}

class ResponseWavenApiSpell {
  int stockpile;
  List<String> resources;
  String id;
  String name;
  String iconUrl;
  String description;
  int cost;
  int v;
  String href;
  String responseWavenApiSpellId;

  ResponseWavenApiSpell({
    this.stockpile,
    this.resources,
    this.id,
    this.name,
    this.iconUrl,
    this.description,
    this.cost,
    this.v,
    this.href,
    this.responseWavenApiSpellId,
  });

  factory ResponseWavenApiSpell.fromJson(Map<String, dynamic> json) => new ResponseWavenApiSpell(
    stockpile: json["stockpile"],
    resources: new List<String>.from(json["resources"].map((x) => x)),
    id: json["_id"],
    name: json["name"],
    iconUrl: json["iconUrl"],
    description: json["description"],
    cost: json["cost"],
    v: json["__v"],
    href: json["href"],
    responseWavenApiSpellId: json["id"],
  );

  Map<String, dynamic> toJson() => {
    "stockpile": stockpile,
    "resources": new List<dynamic>.from(resources.map((x) => x)),
    "_id": id,
    "name": name,
    "iconUrl": iconUrl,
    "description": description,
    "cost": cost,
    "__v": v,
    "href": href,
    "id": responseWavenApiSpellId,
  };
}
