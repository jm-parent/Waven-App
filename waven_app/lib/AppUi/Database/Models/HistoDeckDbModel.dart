// To parse this JSON data, do
//
//     final histoDeckDbModel = histoDeckDbModelFromJson(jsonString);

import 'dart:convert';

List<HistoDeckDbModel> histoDeckDbModelFromJson(String str) {
  final jsonData = json.decode(str);
  return new List<HistoDeckDbModel>.from(jsonData.map((x) => HistoDeckDbModel.fromJson(x)));
}

String histoDeckDbModelToJson(List<HistoDeckDbModel> data) {
  final dyn = new List<dynamic>.from(data.map((x) => x.toJson()));
  return json.encode(dyn);
}

class HistoDeckDbModel {
  int id;
  String matchMode;
  String savedDate;
  String winnerSide;
  String weaponsUsId;
  String weaponsThemId;
  String pseudoUs;
  String pseudoThem;
  String imageUsUrl;
  String imageThemUrl;

  HistoDeckDbModel({
    this.id,
    this.matchMode,
    this.savedDate,
    this.winnerSide,
    this.weaponsUsId,
    this.weaponsThemId,
    this.pseudoUs,
    this.pseudoThem,
    this.imageUsUrl,
    this.imageThemUrl,
  });

  factory HistoDeckDbModel.fromJson(Map<String, dynamic> json) => new HistoDeckDbModel(
    id: json["id"] == null ? null : json["id"],
    matchMode: json["matchMode"] == null ? null : json["matchMode"],
    savedDate: json["savedDate"] == null ? null : json["savedDate"],
    winnerSide: json["winnerSide"] == null ? null : json["winnerSide"],
    weaponsUsId: json["weaponsUsId"] == null ? null : json["weaponsUsId"],
    weaponsThemId: json["weaponsThemId"] == null ? null : json["weaponsThemId"],
    pseudoUs: json["pseudoUs"] == null ? null : json["pseudoUs"],
    pseudoThem: json["pseudoThem"] == null ? null : json["pseudoThem"],
    imageUsUrl: json["imageUsUrl"] == null ? null : json["imageUsUrl"],
    imageThemUrl: json["imageThemUrl"] == null ? null : json["imageThemUrl"],
  );

  Map<String, dynamic> toJson() => {
    "id": id == null ? null : id,
    "matchMode": matchMode == null ? null : matchMode,
    "savedDate": savedDate == null ? null : savedDate,
    "winnerSide": winnerSide == null ? null : winnerSide,
    "weaponsUsId": weaponsUsId == null ? null : weaponsUsId,
    "weaponsThemId": weaponsThemId == null ? null : weaponsThemId,
    "pseudoUs": pseudoUs == null ? null : pseudoUs,
    "pseudoThem": pseudoThem == null ? null : pseudoThem,
    "imageUsUrl": imageUsUrl == null ? null : imageUsUrl,
    "imageThemUrl": imageThemUrl == null ? null : imageThemUrl,
  };
}
