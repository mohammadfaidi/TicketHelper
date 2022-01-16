import 'package:flutter/cupertino.dart';
import 'package:notepad/Providers/Note.dart';

class NotesOperation extends ChangeNotifier {
  //late List<Note> _notes = Note("First Note", "First Note Description");
  List<Note> _notes = [];

  NotesOperation() {
    //Note note({"firstNode","First note descriotpion"});
    _notes.add(Note(
        title: "UPS Testing",
        description: 'Battery die cant load ',
        severity: "high",
        priority: "high",
        raisedby: "mohamad faidi",
        assignto: "saib",
        dateRaised: "1/15/2022",
        status: "falied"));
    //addNewNote(note);
  }

  void addNewNote(Note note) {
    // Note note = Note(title, description);
    _notes.add(note);
    notifyListeners();
  }

  void remove(Note item) {
    _notes.remove(item);
    notifyListeners();
  }

  int get count {
    return _notes.length;
  }

  List<Note> get getNotes {
    return _notes;
  }
}
