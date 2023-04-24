import 'dart:async';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:voyage/model/Contact.dart';

class ContactDatabase {
  static Database? _database;

  initDB() async {
    if(_database == null) {
      String databasePath = await getDatabasesPath();
      String _path = join(databasePath, 'voyage.db');
      _database = await openDatabase(_path, version: 1, onCreate: onCreate);
    }
  }
  onCreate(Database db, int version) async {
    String sql = 'CREATE TABLE contact (id INTEGER PRIMARY KEY AUTOINCREMENT, nom STRING, tel STRING)';
    await db.execute(sql);
  }
  Future<List<Map<String,dynamic>>> get () async {
    await initDB();
    return _database!.query(Contact.table);
  }
  Future<int> insert (Contact contact) async {
    await initDB();
    return _database!.insert(Contact.table, contact.toJson());
  }
  Future <int> edit (Contact contact) async {
    await initDB();
    return _database!.update(Contact.table, contact.toJson(),
        where: 'id = ?', whereArgs: [contact.id]);
  }
  Future<int> delete (Contact contact) async {
    await initDB();
    return _database!.delete(Contact.table, where: 'id = ?', whereArgs: [contact.id]);
  }
}