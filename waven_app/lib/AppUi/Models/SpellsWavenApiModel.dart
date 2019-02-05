// To parse this JSON data, do
//
//     final spellsWavenApiModel = spellsWavenApiModelFromJson(jsonString);

import 'dart:convert';

List<ResponseWavenApiSpell> responseWavenApiSpellFromJson(String str) {
  final jsonData = json.decode(str);
  return new List<ResponseWavenApiSpell>.from(jsonData.map((x) => ResponseWavenApiSpell.fromJson(x)));
}

String responseWavenApiSpellToJson(List<ResponseWavenApiSpell> data) {
  final dyn = new List<dynamic>.from(data.map((x) => x.toJson()));
  return json.encode(dyn);
}

class ResponseWavenApiSpell {
  int stockpile;
  List<String> resources;
  String id;
  int cost;
  String name;
  String iconUrl;
  String description;
  int v;
  String href;
  String responseWavenApiSpellId;

  ResponseWavenApiSpell({
    this.stockpile,
    this.resources,
    this.id,
    this.cost,
    this.name,
    this.iconUrl,
    this.description,
    this.v,
    this.href,
    this.responseWavenApiSpellId,
  });

  factory ResponseWavenApiSpell.fromJson(Map<String, dynamic> json) => new ResponseWavenApiSpell(
    stockpile: json["stockpile"] == null ? null : json["stockpile"],
    resources: new List<String>.from(json["resources"].map((x) => x)),
    id: json["_id"],
    cost: json["cost"],
    name: json["name"],
    iconUrl: json["iconUrl"],
    description: json["description"],
    v: json["__v"],
    href: json["href"],
    responseWavenApiSpellId: json["id"],
  );

  Map<String, dynamic> toJson() => {
    "stockpile": stockpile == null ? null : stockpile,
    "resources": new List<dynamic>.from(resources.map((x) => x)),
    "_id": id,
    "cost": cost,
    "name": name,
    "iconUrl": iconUrl,
    "description": description,
    "__v": v,
    "href": href,
    "id": responseWavenApiSpellId,
  };
}
