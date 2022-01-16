import 'package:flutter/material.dart';
import 'package:notepad/Providers/Note.dart';
import 'package:notepad/Providers/NotesOperation.dart';
import 'package:provider/provider.dart';

class AddScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    late String titleText;
    late String descriptionText;
    late String serverity;
    late String priority;
    late String raisedby;
    late String assignto;
    late String data;
    late String status;

    return Scaffold(
      backgroundColor: Colors.lightBlue,
      appBar: AppBar(
        title: Text("TicketHelper"),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: "Enter Problem",
                  hintStyle: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  )),
              style: TextStyle(fontSize: 20, color: Colors.white),
              onChanged: (value) {
                titleText = value;
              },
            ),
            Expanded(
              child: TextField(
                decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "Enter Desscription",
                    hintStyle: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                    )),
                style: TextStyle(fontSize: 18, color: Colors.white),
                onChanged: (value) {
                  descriptionText = value;
                },
              ),
            ),
            Expanded(
              child: TextField(
                decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "Enter Severity",
                    hintStyle: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                    )),
                style: TextStyle(fontSize: 18, color: Colors.white),
                onChanged: (value) {
                  serverity = value;
                },
              ),
            ),
            Expanded(
              child: TextField(
                decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "Enter Prority",
                    hintStyle: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                    )),
                style: TextStyle(fontSize: 18, color: Colors.white),
                onChanged: (value) {
                  priority = value;
                },
              ),
            ),
            Expanded(
              child: TextField(
                decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "Enter Raisedby",
                    hintStyle: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                    )),
                style: TextStyle(fontSize: 18, color: Colors.white),
                onChanged: (value) {
                  raisedby = value;
                },
              ),
            ),
            Expanded(
              child: TextField(
                decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "Enter Assign to",
                    hintStyle: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                    )),
                style: TextStyle(fontSize: 18, color: Colors.white),
                onChanged: (value) {
                  assignto = value;
                },
              ),
            ),
            Expanded(
              child: TextField(
                decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "Enter Date",
                    hintStyle: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                    )),
                style: TextStyle(fontSize: 18, color: Colors.white),
                onChanged: (value) {
                  data = value;
                },
              ),
            ),
            Expanded(
              child: TextField(
                decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "Enter Status",
                    hintStyle: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                    )),
                style: TextStyle(fontSize: 18, color: Colors.white),
                onChanged: (value) {
                  status = value;
                },
              ),
            ),
            ElevatedButton(
                onPressed: () {
                  Provider.of<NotesOperation>(context, listen: false)
                      .addNewNote(Note(
                          title: titleText,
                          description: descriptionText,
                          severity: serverity,
                          priority: priority,
                          raisedby: raisedby,
                          assignto: assignto,
                          dateRaised: data,
                          status: status));
                  Navigator.pop(context);
                },
                child: Text(
                  'Add Ticket',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                )),
          ],
        ),
      ),
    );
  }
}
