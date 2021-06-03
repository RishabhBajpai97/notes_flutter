import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:notes/db/db.dart';
import 'package:notes/models/notes_model.dart';
import '../store/notes.dart';

final notes = Notes.getInstance();

class EditNotes extends StatefulWidget {
  @override
  _EditNotesState createState() => _EditNotesState();
}

class _EditNotesState extends State<EditNotes> {
  TextEditingController _titleinputController = TextEditingController();
  TextEditingController _textbodyController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _titleinputController.dispose();
    _textbodyController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final id = ModalRoute.of(context).settings.arguments;
    final item = notes.notesList.firstWhere((element) => element.id == id);
    _titleinputController.text = item.title;
    _textbodyController.text = item.content;
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
                        splashColor: Colors.transparent,
                        enableFeedback: true,
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
                  ElevatedButton(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "Save",
                        style: GoogleFonts.openSans(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          letterSpacing: 1.5,
                        ),
                      ),
                    ),
                    onPressed: () {
                      final updatedNote = NotesModel(
                          id: id,
                          content: _textbodyController.text,
                          title: _titleinputController.text,
                          createdTime: item.createdTime);
                      notes.updateNote(updatedNote);
                      DatabaseProvider.db.update(updatedNote);

                      FocusScopeNode currentFocus = FocusScope.of(context);
                      if (!currentFocus.hasPrimaryFocus &&
                          currentFocus.focusedChild != null) {
                        currentFocus.focusedChild.unfocus();
                      }
                      Navigator.of(context).pop();
                    },
                    style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.all(5),
                        primary: Color(0xff3B3B3B),
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10))),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextField(
                maxLines: null,
                textCapitalization: TextCapitalization.none,
                keyboardType: TextInputType.visiblePassword,
                style: GoogleFonts.openSans(
                  fontSize: Theme.of(context).textTheme.headline4.fontSize,
                  color: Colors.white,
                  decoration: TextDecoration.none,
                ),
                controller: _titleinputController,
                cursorColor: Colors.white,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: "Title",
                  hintStyle: GoogleFonts.openSans(
                    color: Color(0xff929292),
                    fontSize: Theme.of(context).textTheme.headline4.fontSize,
                    letterSpacing: 1.5,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: TextField(
                  expands: true,
                  maxLines: null,
                  textCapitalization: TextCapitalization.none,
                  keyboardType: TextInputType.multiline,
                  style: GoogleFonts.openSans(
                    fontSize: Theme.of(context).textTheme.bodyText1.fontSize,
                    color: Colors.white,
                    decoration: TextDecoration.none,
                  ),
                  controller: _textbodyController,
                  cursorColor: Colors.white,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "Type something....",
                    hintStyle: GoogleFonts.openSans(
                      color: Color(0xff929292),
                      fontSize: Theme.of(context).textTheme.bodyText1.fontSize,
                      letterSpacing: 0.5,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
