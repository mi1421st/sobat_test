
import 'dart:io';

import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

final reviewTABLE = "Review";

class DatabaseProvider{
  final DatabaseProvider databaseProvider = DatabaseProvider();

  Database? _database;

  Future<Database> get database async {
    if(_database != null) return _database!;
    _database = await createDatabase();
    return _database!;
  }

  createDatabase() async {
    Directory docsDir = await getApplicationDocumentsDirectory();

    String path = join(docsDir.path, "Reviews.db");

    var database = await openDatabase(
      path,
      version: 1,
      onCreate: initDB,
    );
    return database;
  }

  void initDB(Database database, int ver) async {
    await database.execute(
        'CREATE TABLE $reviewTABLE('
            "id INTEGER PRIMARY KEY, "
            "name TEXT, "
            "review TEXT, "
            "rating INTEGER)"
    );
  }

}
