import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:notepad/Providers/Note.dart';
import 'package:notepad/Providers/NotesOperation.dart';
import 'package:provider/provider.dart';

class AddScreen extends StatefulWidget {
  @override
  State<AddScreen> createState() => _AddScreenState();
}

class _AddScreenState extends State<AddScreen> {
  String date = "";
  DateTime selectedDate = DateTime.now();
  _selectDate(BuildContext context) async {
    final DateTime? selected = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2010),
      lastDate: DateTime(2025),
    );
    if (selected != null && selected != selectedDate)
      setState(() {
        selectedDate = selected;
        date = selectedDate.day.toString() +
            "/" +
            selectedDate.month.toString() +
            "/" +
            selectedDate.year.toString();
      });
  }

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
        /*
        actions: [
          IconButton(
            icon: Icon(Icons.calendar_today),
            tooltip: 'Tap to open date picker',
            onPressed: () {
              _selectDate(context);
            },
          ),
        ],
        */
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
                child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "${selectedDate.day}/${selectedDate.month}/${selectedDate.year}",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 15),
                ),
                IconButton(
                  icon: Icon(Icons.calendar_today),
                  tooltip: 'Tap to open date picker',
                  onPressed: () {
                    _selectDate(context);
                  },
                ),
              ],
            )
                /*Text(_chosenDateTime != null
                  ? _chosenDateTime.toString()
                  : 'No date time picked!'),

                  */
                /*TextField(
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
              */
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
                          dateRaised: date,
                          /*selectedDate.day.toString() +
                              "/" +
                              selectedDate.month.toString() +
                              "/" +
                              selectedDate.year.toString(),
                              */
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
