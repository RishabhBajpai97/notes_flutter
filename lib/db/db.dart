import 'package:notes/models/notes_model.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseProvider {
  static const String TABLE_NOTES = "notes";
  static const String COLUMN_ID = "_id";
  static const String COLUMN_TITLE = "title";
  static const String COLUMN_CONTENT = "content";
  static const String COLUMN_CREATED_TIME = "created_time";

  DatabaseProvider._();

  static final DatabaseProvider db = DatabaseProvider._();

  Database _database;

  Future<Database> get database async {
    if (_database != null) {
      return _database;
    } else {
      _database = await createDatabase();
      return _database;
    }
  }

  Future<Database> createDatabase() async {
    String dbPath = await getDatabasesPath();
    return await openDatabase(
      join(dbPath, 'notes.db'),
      version: 1,
      onCreate: (Database database, int version) async {
        print("creating notes db");
        await database.execute(
          "CREATE TABLE $TABLE_NOTES ("
          "$COLUMN_ID INTEGER PRIMARY KEY,"
          "$COLUMN_TITLE TEXT,"
          "$COLUMN_CONTENT TEXT,"
          "$COLUMN_CREATED_TIME TEXT"
          ")",
        );
      },
    );
  }

  Future<List<NotesModel>> getNotes() async {
    final db = await database;
    var notes = await db.query(TABLE_NOTES, columns: [
      COLUMN_ID,
      COLUMN_TITLE,
      COLUMN_CONTENT,
      COLUMN_CREATED_TIME
    ]);
    List<NotesModel> notesList = List<NotesModel>();
    notes.forEach((currentNote) {
      NotesModel note = NotesModel.fromMap(currentNote);
      notesList.add(note);
    });
    return notesList.reversed.toList();
  }

  Future<NotesModel> insert(NotesModel note) async {
    final db = await database;
    note.id = await db.insert(TABLE_NOTES, note.toMap());
    return note;
  }

  Future<int> delete(int id) async {
    final db = await database;
    return await db.delete(TABLE_NOTES, where: "_id = ?", whereArgs: [id]);
  }

  Future<int> update(NotesModel updatedNote) async {
    final db = await database;
    return await db.update(TABLE_NOTES, updatedNote.toMap(),
        where: "_id = ?", whereArgs: [updatedNote.id]);
  }
}
