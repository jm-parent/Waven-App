// To parse this JSON data, do
//
//     final responseWavenApiClasses = responseWavenApiClassesFromJson(jsonString);

import 'dart:convert';

List<ResponseWavenApiClasses> responseWavenApiClassesFromJson(String str) {
  final jsonData = json.decode(str);
  return new List<ResponseWavenApiClasses>.from(jsonData.map((x) => ResponseWavenApiClasses.fromJson(x)));
}

String responseWavenApiClassesToJson(List<ResponseWavenApiClasses> data) {
  final dyn = new List<dynamic>.from(data.map((x) => x.toJson()));
  return json.encode(dyn);
}

class ResponseWavenApiClasses {
  List<String> tags;
  List<String> weaponTypes;
  List<String> spells;
  String id;
  List<dynamic> weapons;
  String name;
  String description;
  int v;
  String imageUrl;
  String href;
  String responseWavenApiClassId;

  ResponseWavenApiClasses({
    this.tags,
    this.weaponTypes,
    this.spells,
    this.id,
    this.weapons,
    this.name,
    this.description,
    this.v,
    this.imageUrl,
    this.href,
    this.responseWavenApiClassId,
  });

  factory ResponseWavenApiClasses.fromJson(Map<String, dynamic> json) => new ResponseWavenApiClasses(
    tags: new List<String>.from(json["tags"].map((x) => x)),
    weaponTypes: new List<String>.from(json["weaponTypes"].map((x) => x)),
    spells: new List<String>.from(json["spells"].map((x) => x)),
    id: json["_id"],
    weapons: new List<dynamic>.from(json["weapons"].map((x) => x)),
    name: json["name"],
    description: json["description"],
    v: json["__v"],
    imageUrl: json["imageUrl"],
    href: json["href"],
    responseWavenApiClassId: json["id"],
  );

  Map<String, dynamic> toJson() => {
    "tags": new List<dynamic>.from(tags.map((x) => x)),
    "weaponTypes": new List<dynamic>.from(weaponTypes.map((x) => x)),
    "spells": new List<dynamic>.from(spells.map((x) => x)),
    "_id": id,
    "weapons": new List<dynamic>.from(weapons.map((x) => x)),
    "name": name,
    "description": description,
    "__v": v,
    "imageUrl": imageUrl,
    "href": href,
    "id": responseWavenApiClassId,
  };
}
