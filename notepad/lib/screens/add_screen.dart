import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:notepad/Providers/Note.dart';
import 'package:notepad/Providers/NotesOperation.dart';
import 'package:notepad/screens/compbox.dart';
import 'package:provider/provider.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class AddScreen extends StatefulWidget {
  @override
  State<AddScreen> createState() => _AddScreenState();
}

class _AddScreenState extends State<AddScreen> {
  String selectedValue = "Low";
  String selectedValue2 = "Low";
  String selectedValue3 = "Open";
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

  final titleController = TextEditingController();
  final descriptionController = TextEditingController();
  final raisedController = TextEditingController();
  final assignController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    late String serverity;
    late String priority;
    late String data;
    late String status;

    return Scaffold(
      backgroundColor: Colors.lightBlue,
      appBar: AppBar(
        title: Text(
          "TicketHelper",
          style: GoogleFonts.dosis(
              fontSize: 25,
              fontWeight: FontWeight.w700,
              fontStyle: FontStyle.normal,
              color: Colors.white),
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
        actions: [
          IconButton(
            icon: Icon(FontAwesomeIcons.home),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextField(
                decoration: InputDecoration(
                    hintText: "Problem",
                    hintStyle: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    )),
                style: TextStyle(fontSize: 20, color: Colors.white),
                controller: titleController,
                /*
                onChanged: (value) {
                  titleText = value;
                  
                },
                */
              ),
              TextField(
                decoration: InputDecoration(
                    //  border: InputBorder.none,
                    hintText: "Desscription",
                    hintStyle: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                    )),
                style: TextStyle(fontSize: 18, color: Colors.white),
                controller: descriptionController,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Severity:",
                    style: GoogleFonts.teko(
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                        fontStyle: FontStyle.normal,
                        color: Colors.white),
                  ),
                  DropdownButton(
                      value: selectedValue,
                      dropdownColor: Colors.green,
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold),
                      onChanged: (String? newValue) {
                        setState(() {
                          selectedValue = newValue!;
                          print(selectedValue);
                        });
                      },
                      items: CobmoBox.dropdownItems)
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Prority:",
                    style: GoogleFonts.teko(
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                        fontStyle: FontStyle.normal,
                        color: Colors.white),
                  ),
                  DropdownButton(
                      value: selectedValue2,
                      dropdownColor: Colors.green,
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold),
                      onChanged: (String? newValue) {
                        setState(() {
                          selectedValue2 = newValue!;
                          print(selectedValue2);
                        });
                      },
                      items: CobmoBox.dropdownItems2)
                ],
              ),
              TextField(
                decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "Raised By",
                    hintStyle: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                    )),
                style: GoogleFonts.teko(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    fontStyle: FontStyle.normal,
                    color: Colors.white),
                controller: raisedController,
              ),
              TextField(
                decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "Assign To",
                    hintStyle: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                    )),
                style: GoogleFonts.teko(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    fontStyle: FontStyle.normal,
                    color: Colors.white),
                controller: assignController,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "${selectedDate.day}/${selectedDate.month}/${selectedDate.year}",
                    style: GoogleFonts.shadowsIntoLight(
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                        fontStyle: FontStyle.normal,
                        color: Colors.white),
                  ),
                  IconButton(
                    icon: Icon(FontAwesomeIcons.calendarAlt),
                    tooltip: 'Tap to open date picker',
                    onPressed: () {
                      _selectDate(context);
                    },
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Status:",
                    style: GoogleFonts.teko(
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                        fontStyle: FontStyle.normal,
                        color: Colors.white),
                  ),
                  DropdownButton(
                      value: selectedValue3,
                      dropdownColor: Colors.green,
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold),
                      onChanged: (String? newValue) {
                        setState(() {
                          selectedValue3 = newValue!;
                          print(selectedValue3);
                        });
                      },
                      items: CobmoBox.dropdownItems3)
                ],
              ),
              SizedBox(
                height: 90,
              ),
              ElevatedButton(
                onPressed: () {
                  Provider.of<NotesOperation>(context, listen: false)
                      .addNewNote(Note(
                          title: titleController.text, //titleText,
                          description:
                              descriptionController.text, //descriptionText,
                          severity: selectedValue,
                          priority: selectedValue2,
                          raisedby: raisedController.text, //raisedby,
                          assignto: assignController.text, //assignto,
                          dateRaised: date,
                          status: selectedValue3));
                  Navigator.pop(context);
                },
                child: Text(
                  'Add Ticket',
                  style: GoogleFonts.dosis(
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                      fontStyle: FontStyle.normal,
                      color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
