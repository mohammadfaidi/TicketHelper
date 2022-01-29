import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class text extends StatelessWidget {
  final String title;
  Color color;
  FontWeight fontWeight;
  final double size;
//fontSize size;
  final AlignmentGeometry align;
  text({required this.title, required this.color, required this.fontWeight, required this.size, required this.align});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: align,
      child: Text(
        title,
        style: TextStyle(
          color: color,
          fontWeight: fontWeight,
          fontSize: size,
        ),
      ),
    );
  }
}
