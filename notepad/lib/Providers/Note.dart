import 'package:flutter/cupertino.dart';

class Note {
  String title;
  String description;
  String severity;
  String priority;
  String raisedby;
  String assignto;
  String dateRaised;
  String status;

  Note(
      {required this.title,
      required this.description,
      required this.severity,
      required this.priority,
      required this.raisedby,
      required this.assignto,
      required this.dateRaised,
      required this.status});
}
