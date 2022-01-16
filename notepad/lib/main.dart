import 'package:flutter/material.dart';
import 'package:notepad/screens/home_screen.dart';
import 'package:provider/provider.dart';
import 'Providers/NotesOperation.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<NotesOperation>(
      create: (context) => NotesOperation(),
      child: MaterialApp(
        title: 'Ticket Helper',
        debugShowCheckedModeBanner: false,
        home: HomeScreen(),
      ),
    );
  }
}
