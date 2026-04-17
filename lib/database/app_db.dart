import 'package:path/path.dart' as p;
import 'package:sqflite/sqflite.dart';

class AppDatabase {
  static final AppDatabase instance = AppDatabase._init();
  static Database? _database;

  AppDatabase._init();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB("tarefas.db");
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = p.join(dbPath, filePath);

    return await openDatabase(
      path,
      version: 1,
      onOpen: (db) async {
        await db.execute("DROP TABLE IF EXISTS groups");
        await _createDB(db, 1);
      },
    );
  }

  Future _createDB(Database db, int version) async {
    await db.execute('''
    CREATE TABLE groups (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    title TEXT NOT NULL,
    color TEXT NOT NULL,
    imageSvg TEXT NOT NULL
    )
    ''');

    await db.execute('''
    CREATE TABLE IF NOT EXISTS tasks (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    description TEXT NOT NULL,
    date TEXT,
    groupId INTEGER NOT NULL,
    FOREIGN KEY (groupId) REFERENCES groups(id)
    )
    ''');

    // Seed inicial
    await db.insert('groups', {
      'title': 'escrever',
      'color': '0xffb859e6',
      'imageSvg': 'assets/icons/escrever.svg',
    });
    await db.insert('groups', {
      'title': 'meditar',
      'color': '0xffffc02e',
      'imageSvg': 'assets/icons/meditar.svg',
    });
    await db.insert('groups', {
      'title': 'particular',
      'color': '0xfff554bc',
      'imageSvg': 'assets/icons/particular.svg',
    });
    await db.insert('groups', {
      'title': 'receita',
      'color': '0xff4096d6',
      'imageSvg': 'assets/icons/recipe.svg',
    });
    await db.insert('groups', {
      'title': 'ux ui',
      'color': '0xff2ed62a',
      'imageSvg': 'assets/icons/uxui.svg',
    });
  }
}
