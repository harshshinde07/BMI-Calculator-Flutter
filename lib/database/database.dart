import 'dart:async';

import 'package:bmi_calculator/models/record.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite_migration/sqflite_migration.dart';

const recordTable = "Records";

final initialScript = [
  '''
  CREATE TABLE IF NOT EXISTS $recordTable (id INTEGER PRIMARY KEY AUTOINCREMENT, date TEXT, gender TEXT, bmi REAL, type TEXT)
  '''
];

final migrations = [
  '''
  ALTER TABLE $recordTable ADD COLUMN height INTEGER;
  ''',
  '''
  ALTER TABLE $recordTable ADD COLUMN weight INTEGER;
  ''',
  '''
  ALTER TABLE $recordTable ADD COLUMN age INTEGER;
  ''',
];

final config = MigrationConfig(initializationScript: initialScript, migrationScripts: migrations);

class DatabaseProvider {
  static Database database;

  Future createDatabase() async {
    database =
        await openDatabase(join(await getDatabasesPath(), 'bmi_records.db'));
    await database.execute(
        "CREATE TABLE IF NOT EXISTS $recordTable (id INTEGER PRIMARY KEY AUTOINCREMENT, date TEXT, gender TEXT, bmi REAL, type TEXT, height INTEGER, weight INTEGER, age INTEGER)");
    print("Database created successfully");
  }

  // Future open() async {
  //   database =
  //       await openDatabase(join(await getDatabasesPath(), 'bmi_records.db'));
  //   print("Database opened successfully");
  // }

  Future open() async {
    final path = join(await getDatabasesPath(), 'bmi_records.db');
    database = await openDatabaseWithMigration(path, config);
    print("Database opened successfully");
  }

  Future<void> insertRecord(Record record) async {
    await database.insert(
      recordTable,
      record.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<List<Record>> getAllRecords() async {
    final List<Map<String, dynamic>> maps =
        await database.query(recordTable, orderBy: 'date DESC');

    return List.generate(maps.length, (i) {
      return Record(
        id: maps[i]['id'],
        date: maps[i]['date'],
        gender: maps[i]['gender'],
        bmi: maps[i]['bmi'],
        type: maps[i]['type'],
        height: maps[i]['height'],
        weight: maps[i]['weight'],
        age: maps[i]['age'],
      );
    });
  }

  Future<int> getRecordCount() async {
    var x = await database.rawQuery('SELECT COUNT (*) from $recordTable');
    int count = Sqflite.firstIntValue(x);
    return count;
  }

  Future<void> deleteRecord(int id) async {
    await database.delete(
      recordTable,
      where: "id = ?",
      whereArgs: [id],
    );
  }
}
