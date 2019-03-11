// To parse this JSON data, do
//
//     final responseWavenApiSpell = responseWavenApiSpellFromJson(jsonString);

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

  ResponseWavenApiSpell({
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

  factory ResponseWavenApiSpell.fromJson(Map<String, dynamic> json) => new ResponseWavenApiSpell(
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
