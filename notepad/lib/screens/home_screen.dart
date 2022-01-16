import 'package:flutter/material.dart';
import 'package:notepad/Providers/Note.dart';
import 'package:notepad/Providers/NotesOperation.dart';
import 'package:notepad/screens/add_screen.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  final List<Note> notes = [
    //Task(valueText: 'laptop ', chekvalueText:true),
    // Task(valueText: 'iphone x ', chekvalueText:true),
    // Task(valueText: 'keyboard ', chekvalueText:true ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => AddScreen()));
        },
        child: Icon(
          Icons.add,
          size: 30,
          color: Colors.lightBlue,
        ),
        backgroundColor: Colors.white,
      ),
      backgroundColor: Colors.lightBlue,
      appBar: AppBar(
        title: Text("TicketHelper"),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: Consumer<NotesOperation>(
        builder: (context, data, child) {
          return ListView.builder(
            itemCount: data.getNotes.length,
            itemBuilder: (context, index) {
              return NotesCard(data.getNotes[index]);
            },
          );
        },
      ),
    );
  }
}

class NotesCard extends StatelessWidget {
  final Note note;

  NotesCard(this.note);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(15),
      padding: EdgeInsets.all(15),
      height: 220,
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(15)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Problem" + " : " + note.title,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 5,
          ),
          Text("Desc" + " : " + note.description,
              style: TextStyle(
                fontSize: 14,
              )),
          Text("Severity" + " : " + note.severity,
              style: TextStyle(
                fontSize: 14,
              )),
          Text("Priority" + " : " + note.priority,
              style: TextStyle(
                fontSize: 14,
              )),
          Text("Raised by" + " : " + note.raisedby,
              style: TextStyle(
                fontSize: 14,
              )),
          Text("Assign by" + " : " + note.assignto,
              style: TextStyle(
                fontSize: 14,
              )),
          Text("Data " + " : " + note.dateRaised,
              style: TextStyle(
                fontSize: 14,
              )),
          Text("Status" + " : " + note.status,
              style: TextStyle(
                fontSize: 14,
              )),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              IconButton(
                icon: Icon(
                  Icons.delete,
                  color: Colors.red,
                ),
                iconSize: 30,
                onPressed: () {
                  Provider.of<NotesOperation>(context, listen: false)
                      .remove(note);
                },
              ),
            ],
          )
        ],
      ),
    );
  }
}
