import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  DatabaseHelper._privateConstructor();

  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();
  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    final path = join(await getDatabasesPath(), 'banksy.db');

    return await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await db.execute('''
          CREATE TABLE Match (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            firstTeam TEXT,
            secondTeam TEXT,
            date TEXT,
            time TEXT
          )
        ''');
      },
    );
  }

  Future<List<Map<String, dynamic>>> fetchMatchData() async {
    final Database db = await database;
    return await db.query('Match');
  }
}
