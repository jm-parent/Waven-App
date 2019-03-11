import 'dart:async';
import 'dart:io';

import 'package:http/http.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:waven_app/AppUi/Database/Models/HistoDeckDbModel.dart';

class DBProvider {
  DBProvider._();

  static final DBProvider db = DBProvider._();

  Database _database;

  Future<Database> get database async {
    if (_database != null) return _database;
    // if _database is null we instantiate it
    _database = await initDB();
    return _database;
  }

  initDB() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, "WavenCompanion.db");
    return await openDatabase(path, version: 1, onOpen: (db) {},
        onCreate: (Database db, int version) async {
          await db.execute("CREATE TABLE HistoDeck ("
              "id INTEGER PRIMARY KEY,"
              "matchMode TEXT,"
              "savedDate TEXT,"
              "winnerSide TEXT,"
              "weaponsUsId TEXT,"
              "weaponsThemId TEXT,"
          "pseudoUs TEXT,"
          "pseudoThem TEXT,"
          "imageUsUrl TEXT,"
          "imageThemUrl TEXT"
              ")");
        });
  }

  addHistoDeck(HistoDeckDbModel newHistoDeck) async {
    final db = await database;
    //get the biggest id in the table
    var table = await db.rawQuery("SELECT MAX(id)+1 as id FROM HistoDeck");
    int id = table.first["id"];
    //insert to the table using the new id
    var raw = await db.rawInsert(
        "INSERT Into HistoDeck (id,matchMode,savedDate,winnerSide,weaponsUsId,weaponsThemId,pseudoUs,pseudoThem,imageUsUrl,imageThemUrl)"
            " VALUES (?,?,?,?,?,?,?,?,?,?)",
        [id, newHistoDeck.matchMode, newHistoDeck.savedDate, newHistoDeck.winnerSide,newHistoDeck.weaponsUsId,newHistoDeck.weaponsThemId,newHistoDeck.pseudoUs,newHistoDeck.pseudoThem,newHistoDeck.imageUsUrl,newHistoDeck.imageThemUrl]);
    return raw;
  }

  updateHistoDeck(HistoDeckDbModel histoDeck) async {
    final db = await database;
    var res = await db.update("HistoDeck", histoDeck.toJson(),
        where: "id = ?", whereArgs: [histoDeck.id]);
    return res;
  }

  getHistoDeck(int id) async {
    final db = await database;
    var res = await db.query("HistoDeck", where: "id = ?", whereArgs: [id]);
    return res.isNotEmpty ? HistoDeckDbModel.fromJson(res.first) : null;
  }

    Future<List<HistoDeckDbModel>> getAllHistoDeckDbModels() async {
    final db = await database;
    var res = await db.query("HistoDeck");
    List<HistoDeckDbModel> list =
    res.isNotEmpty ? res.map((c) => HistoDeckDbModel.fromJson(c)).toList() : [];
    return list;
  }

  deleteHistoDeckDbModel(int id) async {
    final db = await database;
    return db.delete("HistoDeck", where: "id = ?", whereArgs: [id]);
  }

  deleteAll() async {
    final db = await database;
    db.rawDelete("Delete * from HistoDeck");
  }
}