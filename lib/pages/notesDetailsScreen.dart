import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:intl/intl.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:notes/store/notes.dart';

final notes = Notes.getInstance();

class NotesDetailsScreen extends StatefulWidget {
  @override
  _NotesDetailsScreenState createState() => _NotesDetailsScreenState();
}

class _NotesDetailsScreenState extends State<NotesDetailsScreen> {

  @override
  Widget build(BuildContext context) {
    final id = ModalRoute.of(context).settings.arguments;
    final item = notes.notesList.firstWhere((element) => element.id == id);
    return Scaffold(
      backgroundColor: Color(0xff252525),
      body: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: 50,
                    width: 50,
                    alignment: Alignment.center,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: IconButton(
                        enableFeedback: true,
                        splashColor: Colors.transparent,
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        icon: Icon(
                          Icons.arrow_back_ios,
                        ),
                        color: Colors.white,
                      ),
                    ),
                    decoration: BoxDecoration(
                      color: Color(0xff3B3B3B),
                      borderRadius: BorderRadius.circular(
                        10,
                      ),
                    ),
                  ),
                  Container(
                    height: 50,
                    width: 50,
                    alignment: Alignment.center,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                      child: IconButton(
                        splashColor: Colors.transparent,
                        enableFeedback: true,
                        onPressed: () {
                          Navigator.of(context).pushReplacementNamed(
                            '/edit_screen',
                            arguments: id,
                          );
                        },
                        icon: Icon(
                          Icons.edit,
                        ),
                        color: Colors.white,
                      ),
                    ),
                    decoration: BoxDecoration(
                      color: Color(0xff3B3B3B),
                      borderRadius: BorderRadius.circular(
                        10,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 30),
              child: Observer(
                builder: (context) => Column(
                  // mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      "${item.title}",
                      textAlign: TextAlign.start,
                      style: GoogleFonts.openSans(
                        fontSize:
                            Theme.of(context).textTheme.headline4.fontSize,
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Text(
                      DateFormat('MMM d, ' 'yyyy')
                          .format(item.createdTime)
                          .toString(),
                      style: GoogleFonts.openSans(
                          color: Colors.grey.shade600,
                          fontWeight: FontWeight.w500),
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    Text("${item.content}",
                        style: GoogleFonts.openSans(color: Colors.white)),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
