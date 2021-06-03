import 'package:flutter/material.dart';
import 'package:notes/pages/add_notes.dart';
import 'package:notes/pages/editScreen.dart';
import 'package:notes/pages/notesDetailsScreen.dart';
import './pages/homescreen.dart';

void main() => runApp(NotesApp());

class NotesApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus &&
            currentFocus.focusedChild != null) {
          currentFocus.focusedChild.unfocus();
        }
      },
      child: MaterialApp(
        initialRoute: '/homescreen',
        routes: {
          '/homescreen': (context) => HomeScreen(),
          '/details_screen': (context) => NotesDetailsScreen(),
          '/add_notes': (context) => AddNotes(),
          '/edit_screen': (context) => EditNotes()
        },
        home: HomeScreen(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
