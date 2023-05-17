import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class LocalDbService {
  late Database _database;

  Future<void> initializeDatabase() async {
    // Get the path for the database file
    String databasePath = await getDatabasesPath();
    String path = join(databasePath, 'todo.db');

    // Open the database
    _database = await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) {
        // Create the necessary tables
        db.execute('''
          CREATE TABLE tasks (
            id TEXT PRIMARY KEY,
            title TEXT,
            description TEXT,
            dueDate TEXT,
            isCompleted INTEGER
          )
        ''');
      },
    );
  }

// Rest of the code...
}
