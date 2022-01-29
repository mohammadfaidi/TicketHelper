import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Feild extends StatelessWidget {
  final String hintText;
  Color color;
  FontWeight fontWeight;
//fontSize size;

  TextEditingController ControllerGenrall;

  Feild({
    required this.hintText,
    required this.color,
    required this.fontWeight,
    required this.ControllerGenrall,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextField(
        decoration: InputDecoration(
            border: InputBorder.none,
            hintText: hintText,
            hintStyle: TextStyle(
              fontSize: 18,
              color: color,
            )),
        style: GoogleFonts.teko(
            fontSize: 20,
            fontWeight: fontWeight,
            fontStyle: FontStyle.normal,
            color: Colors.white),
        controller: ControllerGenrall,
      ),
      /*alignment:align ,
        child: Text(title,
            style: TextStyle(
            color:color,
            fontWeight: fontWeight,
            fontSize:size,
            ),
           
           ),
           */
    );
  }
}
