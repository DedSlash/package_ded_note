// database.dart

import 'dart:io';
import 'dart:async';
import 'package:ded_note/note.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  // Instance de la base de données SQLite
  Database? _db;

  // Obtenir l'instance de la base de données
  Future<Database> get database async {
    if (_db != null) return _db!;
    _db = await _initDB();
    return _db!;
  }

  // Initialiser la base de données
  Future<Database> _initDB() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, "database.db");
    return await openDatabase(
      path,
      version: 1,
      onCreate: (Database db, int version) async {
        await db.execute(
          'CREATE TABLE notes(id INTEGER PRIMARY KEY NOT NULL AUTO_INCREMENT, title TEXT, body TEXT, date TEXT)',
        );
      },
    );
  }

  Future<int?> addNote(Note note) async {
    final db = await database;
    return await db?.insert('notes', note.toMap());
  }

  Future<List<Note>> getAllNotes() async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query('notes') ?? [];
    return List.generate(maps.length, (i) {
      return Note.fromMap(maps[i]);
    });
  }

  Future<int?> updateNote(Note note) async {
    final db = await database;
    return await db?.update(
      'notes',
      note.toMap(),
      where: 'id = ?',
      whereArgs: [note.id],
    );
  }

  Future<int?> deleteNote(Note note) async {
    final db = await database;
    return await db?.delete(
      'notes',
      where: 'id = ?',
      whereArgs: [note.id],
    );
  }

  Future<int?> deleteAllNotes() async {
    final db = await database;
    return await db?.delete('notes');
  }
}


/*
getAllNotes()
deleteAllNotes()
addNote(note: Note)
deleteNote(note: Note)
updateNote(oldNote: Note, newNote: Note)

To use database class
final dbHelper = DatabaseHelper();
// Exemple d'utilisation
await dbHelper.addNote(note);
List<Note> notes = await dbHelper.getAllNotes();
*/