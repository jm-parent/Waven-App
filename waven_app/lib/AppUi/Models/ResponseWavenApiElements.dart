// To parse this JSON data, do
//
//     final responseWavenApiElements = responseWavenApiElementsFromJson(jsonString);

import 'dart:convert';

List<ResponseWavenApiElement> responseWavenApiElementsFromJson(String str) {
  final jsonData = json.decode(str);
  return new List<ResponseWavenApiElement>.from(jsonData.map((x) => ResponseWavenApiElement.fromJson(x)));
}

String responseWavenApiElementsToJson(List<ResponseWavenApiElement> data) {
  final dyn = new List<dynamic>.from(data.map((x) => x.toJson()));
  return json.encode(dyn);
}

class ResponseWavenApiElement {
  String id;
  String name;
  String iconUrl;
  int v;
  String imageUrl;

  ResponseWavenApiElement({
    this.id,
    this.name,
    this.iconUrl,
    this.v,
    this.imageUrl,
  });

  factory ResponseWavenApiElement.fromJson(Map<String, dynamic> json) => new ResponseWavenApiElement(
    id: json["_id"],
    name: json["name"],
    iconUrl: json["iconUrl"],
    v: json["__v"],
    imageUrl: json["imageUrl"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "name": name,
    "iconUrl": iconUrl,
    "__v": v,
    "imageUrl": imageUrl,
  };
}
