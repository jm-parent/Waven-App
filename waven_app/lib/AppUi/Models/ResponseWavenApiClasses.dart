// To parse this JSON data, do
//
//     final responseWavenApiClass = responseWavenApiClassFromJson(jsonString);

import 'dart:convert';

List<ResponseWavenApiClass> responseWavenApiClassFromJson(String str) {
  final jsonData = json.decode(str);
  return new List<ResponseWavenApiClass>.from(jsonData.map((x) => ResponseWavenApiClass.fromJson(x)));
}

String responseWavenApiClassToJson(List<ResponseWavenApiClass> data) {
  final dyn = new List<dynamic>.from(data.map((x) => x.toJson()));
  return json.encode(dyn);
}

class ResponseWavenApiClass {
  String name;
  String fullName;
  String portraitUrl;
  String imageUrl;
  String description;
  List<String> weapons;
  List<String> spells;
  String id;
  int v;

  ResponseWavenApiClass({
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

  factory ResponseWavenApiClass.fromJson(Map<String, dynamic> json) => new ResponseWavenApiClass(
    name: json["name"] == null ? null : json["name"],
    fullName: json["fullName"] == null ? null : json["fullName"],
    portraitUrl: json["portraitUrl"] == null ? null : json["portraitUrl"],
    imageUrl: json["imageUrl"] == null ? null : json["imageUrl"],
    description: json["description"] == null ? null : json["description"],
    weapons: json["weapons"] == null ? null : new List<String>.from(json["weapons"].map((x) => x)),
    spells: json["spells"] == null ? null : new List<String>.from(json["spells"].map((x) => x)),
    id: json["_id"] == null ? null : json["_id"],
    v: json["__v"] == null ? null : json["__v"],
  );

  Map<String, dynamic> toJson() => {
    "name": name == null ? null : name,
    "fullName": fullName == null ? null : fullName,
    "portraitUrl": portraitUrl == null ? null : portraitUrl,
    "imageUrl": imageUrl == null ? null : imageUrl,
    "description": description == null ? null : description,
    "weapons": weapons == null ? null : new List<dynamic>.from(weapons.map((x) => x)),
    "spells": spells == null ? null : new List<dynamic>.from(spells.map((x) => x)),
    "_id": id == null ? null : id,
    "__v": v == null ? null : v,
  };
}
