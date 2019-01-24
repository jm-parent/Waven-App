// To parse this JSON data, do
//
//     final spellsWavenApiModel = spellsWavenApiModelFromJson(jsonString);

import 'dart:convert';

List<SpellsWavenApiModel> spellsWavenApiModelFromJson(String str) {
  final jsonData = json.decode(str);
  return new List<SpellsWavenApiModel>.from(jsonData.map((x) => SpellsWavenApiModel.fromJson(x)));
}

String spellsWavenApiModelToJson(List<SpellsWavenApiModel> data) {
  final dyn = new List<dynamic>.from(data.map((x) => x.toJson()));
  return json.encode(dyn);
}

class SpellsWavenApiModel {
  int stockpile;
  List<String> resources;
  String id;
  int cost;
  String name;
  String iconUrl;
  String description;
  int v;
  String href;
  String spellsWavenApiModelId;

  SpellsWavenApiModel({
    this.stockpile,
    this.resources,
    this.id,
    this.cost,
    this.name,
    this.iconUrl,
    this.description,
    this.v,
    this.href,
    this.spellsWavenApiModelId,
  });

  factory SpellsWavenApiModel.fromJson(Map<String, dynamic> json) => new SpellsWavenApiModel(
    stockpile: json["stockpile"] == null ? null : json["stockpile"],
    resources: new List<String>.from(json["resources"].map((x) => x)),
    id: json["_id"],
    cost: json["cost"],
    name: json["name"],
    iconUrl: json["iconUrl"],
    description: json["description"],
    v: json["__v"],
    href: json["href"],
    spellsWavenApiModelId: json["id"],
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
    "id": spellsWavenApiModelId,
  };
}
