import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CobmoBox {
  static List<DropdownMenuItem<String>> get dropdownItems {
    List<DropdownMenuItem<String>> menuItems = [
      DropdownMenuItem(
          child: Text(
            "Low",
            style: GoogleFonts.lato(fontStyle: FontStyle.italic),
          ),
          value: "Low"),
      DropdownMenuItem(
          child: Text(
            "Medium",
            style: GoogleFonts.lato(fontStyle: FontStyle.italic),
          ),
          value: "Medium"),
      DropdownMenuItem(
          child: Text(
            "High",
            style: GoogleFonts.lato(fontStyle: FontStyle.italic),
          ),
          value: "High"),
    ];
    return menuItems;
  }

  static List<DropdownMenuItem<String>> get dropdownItems2 {
    List<DropdownMenuItem<String>> menuItems = [
      DropdownMenuItem(
          child: Text(
            "Low",
            style: GoogleFonts.lato(fontStyle: FontStyle.italic),
          ),
          value: "Low"),
      DropdownMenuItem(
          child: Text(
            "Medium",
            style: GoogleFonts.lato(fontStyle: FontStyle.italic),
          ),
          value: "Medium"),
      DropdownMenuItem(
          child: Text(
            "High",
            style: GoogleFonts.lato(fontStyle: FontStyle.italic),
          ),
          value: "High"),
    ];
    return menuItems;
  }

  static List<DropdownMenuItem<String>> get dropdownItems3 {
    List<DropdownMenuItem<String>> menuItems = [
      DropdownMenuItem(
          child: Text(
            "Open",
            style: GoogleFonts.lato(fontStyle: FontStyle.italic),
          ),
          value: "Open"),
      DropdownMenuItem(
          child: Text(
            "In Progress",
            style: GoogleFonts.lato(fontStyle: FontStyle.italic),
          ),
          value: "In Progress"),
      DropdownMenuItem(
          child: Text(
            "Closed",
            style: GoogleFonts.lato(fontStyle: FontStyle.italic),
          ),
          value: "Closed"),
      DropdownMenuItem(
          child: Text(
            "On hold",
            style: GoogleFonts.lato(fontStyle: FontStyle.italic),
          ),
          value: "On hold"),
      DropdownMenuItem(
          child: Text(
            "Rejected",
            style: GoogleFonts.lato(fontStyle: FontStyle.italic),
          ),
          value: "Rejected"),
    ];
    return menuItems;
  }
}
