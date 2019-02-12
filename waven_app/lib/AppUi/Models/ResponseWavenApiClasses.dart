// To parse this JSON data, do
//
//     final responseWavenApiClasses = responseWavenApiClassesFromJson(jsonString);

import 'dart:convert';

List<ResponseWavenApiClass> responseWavenApiClassesFromJson(String str) {
  final jsonData = json.decode(str);
  return new List<ResponseWavenApiClass>.from(jsonData.map((x) => ResponseWavenApiClass.fromJson(x)));
}

String responseWavenApiClassesToJson(List<ResponseWavenApiClass> data) {
  final dyn = new List<dynamic>.from(data.map((x) => x.toJson()));
  return json.encode(dyn);
}

class ResponseWavenApiClass {
  List<dynamic> tags;
  List<String> weaponTypes;
  List<String> spells;
  String id;
  List<dynamic> weapons;
  String name;
  String description;
  int v;
  String imageUrl;

  ResponseWavenApiClass({
    this.tags,
    this.weaponTypes,
    this.spells,
    this.id,
    this.weapons,
    this.name,
    this.description,
    this.v,
    this.imageUrl,
  });

  factory ResponseWavenApiClass.fromJson(Map<String, dynamic> json) => new ResponseWavenApiClass(
    tags: new List<dynamic>.from(json["tags"].map((x) => x)),
    weaponTypes: new List<String>.from(json["weaponTypes"].map((x) => x)),
    spells: new List<String>.from(json["spells"].map((x) => x)),
    id: json["_id"],
    weapons: json["weapons"] == null ? null : new List<dynamic>.from(json["weapons"].map((x) => x)),
    name: json["name"],
    description: json["description"],
    v: json["__v"],
    imageUrl: json["imageUrl"],
  );

  Map<String, dynamic> toJson() => {
    "tags": new List<dynamic>.from(tags.map((x) => x)),
    "weaponTypes": new List<dynamic>.from(weaponTypes.map((x) => x)),
    "spells": new List<dynamic>.from(spells.map((x) => x)),
    "_id": id,
    "weapons": weapons == null ? null : new List<dynamic>.from(weapons.map((x) => x)),
    "name": name,
    "description": description,
    "__v": v,
    "imageUrl": imageUrl,
  };
}
