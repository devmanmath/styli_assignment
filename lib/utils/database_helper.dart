import 'package:flutter/foundation.dart';
import 'package:sqflite/sqflite.dart';

class DataBaseHelper {
  DataBaseHelper._();
  static final DataBaseHelper instance = DataBaseHelper._();
  factory DataBaseHelper() => instance;

  static late Database? _database;

  static String countryTable = "CountryTable";

  static Future<void> createDb() async {
    String dbPath = await getDatabasesPath();

    debugPrint(dbPath);
    _database = await openDatabase(
      "$dbPath/country.db",
      version: 1,
      onCreate: (Database db, int versiom) async {
        await db.execute('''
            CREATE TABLE $countryTable (
              Id INTEGER PRIMARY KEY AUTOINCREMENT,
              CommonName TEXT,
              CountryName TEXT,
              Independent BOOLEAN,
              Status TEXT,
              UnMember BOOLEAN ,
              Currencies TEXT,
              Capital TEXT,
              AltSpellings TEXT,
              Region TEXT,
              Subregion TEXT,
              Languages TEXT,
              StartOfWeek TEXT,
              CapitalInfo TEXT,
              Flags TEXT,
              Maps TEXT
            )
          ''');
        debugPrint("db created");
      },
      onOpen: (_) {
        debugPrint("db opened");
      },
      onUpgrade: (_, i, v) {
        debugPrint("db updated $i : $v");
      },
    );
  }

  Future<int> insertData(
      {required tableName, required Map<String, dynamic> data}) async {
    final int result = await _database!.insert(tableName, data);
    return result;
  }

  Future<List<Map<String, dynamic>>> fetchAll({required tableName}) async {
    final List<Map<String, dynamic>> result = await _database!.query(tableName);
    return result;
  }
}
