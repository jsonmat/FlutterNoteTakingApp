import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../models/note.dart';
import 'package:http/http.dart' as http;

class NoteService {
  Future<List<Note>> fetchNotes() async {
    final response = await http
        .get(Uri.parse('https://jsonplaceholder.typicode.com/albums/1'));

    if (response.statusCode == 200) {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      List? rawNotes = prefs.getStringList('notes');
      if (rawNotes == null) return [];
      List<Note> notes =
          rawNotes.map((e) => Note.fromJson(jsonDecode(e))).toList();
      return notes;
    } else {
      throw Exception('Failed to load notes');
    }
  }

  Future<Note> fetchNote(int noteId) async {
    final response = await http
        .get(Uri.parse('https://jsonplaceholder.typicode.com/albums/1'));

    if (response.statusCode == 200) {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      List? rawNotes = prefs.getStringList('notes');
      if (rawNotes == null) throw Exception('Failed to load note');
      List<Note> notes =
          rawNotes.map((e) => Note.fromJson(jsonDecode(e))).toList();
      Note note = notes.firstWhere((element) => element.noteId == noteId);
      return note;
    } else {
      throw Exception('Failed to load notes');
    }
  }

  Future<bool> addNote(Note note) async {
    try {
      final response = await http
          .get(Uri.parse('https://jsonplaceholder.typicode.com/albums/1'));

      if (response.statusCode == 200) {
        final SharedPreferences prefs = await SharedPreferences.getInstance();
        List<String>? rawNotes = prefs.getStringList('notes');
        rawNotes ??= [];
        rawNotes.add(jsonEncode(note));
        return prefs.setStringList('notes', rawNotes);
      } else {
        return false;
      }
    } catch (e) {
      return false;
    }
  }

  Future<bool> updateNote(Note note) async {
    final response = await http
        .get(Uri.parse('https://jsonplaceholder.typicode.com/albums/1'));

    if (response.statusCode == 200) {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      List<String>? rawNotes = prefs.getStringList('notes');
      if (rawNotes == null) throw Exception('Failed to update note');
      List<Note> notes =
          rawNotes.map((e) => Note.fromJson(jsonDecode(e))).toList();
      notes.removeWhere((element) => element.noteId == note.noteId);
      notes.add(note);
      List<String> notesEdited = notes.map((e) => jsonEncode(e)).toList();
      return prefs.setStringList('notes', notesEdited);
    } else {
      throw Exception('Failed to add notes');
    }
  }

  Future<bool> deleteNote(int noteId) async {
    final response = await http
        .get(Uri.parse('https://jsonplaceholder.typicode.com/albums/1'));

    if (response.statusCode == 200) {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      List? rawNotes = prefs.getStringList('notes');
      if (rawNotes == null) throw Exception('Failed to delete note');
      List<Note> notes =
          rawNotes.map((e) => Note.fromJson(jsonDecode(e))).toList();
      notes.removeWhere((element) => element.noteId == noteId);
      List<String> notesEdited = notes.map((e) => jsonEncode(e)).toList();
      return prefs.setStringList('notes', notesEdited);
    } else {
      throw Exception('Failed to load notes');
    }
  }
}
