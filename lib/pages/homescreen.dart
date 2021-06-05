import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:notes/pages/add_notes.dart';
import '../store/notes.dart';

final notes = Notes.getInstance();

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List colors = [
    Color(0xffFFCC80),
    Color(0xffFFAB91),
    Color(0xffE7ED9B),
    Color(0xffCF94DA),
    Color(0xff81DEEA)
  ];
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      notes.getNotes();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        elevation: 1,
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => AddNotes(),
            ),
          );
        },
        child: Icon(
          Icons.add,
          size: 35,
        ),
        backgroundColor: Color(0xff252525),
      ),
      backgroundColor: Color(0xff252525),
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Notes",
                    style: GoogleFonts.openSans(
                      fontSize: Theme.of(context).textTheme.headline4.fontSize,
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Container(
                    alignment: Alignment.center,
                    height: 50,
                    width: 50,
                    child: IconButton(
                      enableFeedback: true,
                      splashColor: Colors.transparent,
                      onPressed: () {},
                      icon: Icon(
                        Icons.search,
                      ),
                      color: Colors.white,
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
              height: 15,
            ),
            Expanded(
              child: Observer(
                builder: (context) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: notes.isLoading
                        ? Center(
                            child: CircularProgressIndicator(),
                          )
                        : notes.notesList.isNotEmpty
                            ? GridView.builder(
                                gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                ),
                                itemCount: notes.notesList.length,
                                itemBuilder: (context, index) => Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: GestureDetector(
                                    onLongPress: () {
                                      notes.deleteNote(
                                          notes.notesList[index].id);
                                    },
                                    onTap: () {
                                      Navigator.of(context).pushNamed(
                                          '/details_screen',
                                          arguments: notes.notesList[index].id);
                                    },
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: colors[0],
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Observer(
                                            builder: (context) => Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 10.0),
                                              child: Text(
                                                "${notes.notesList[index].title}",
                                                textAlign: TextAlign.center,
                                                style: GoogleFonts.openSans(
                                                    fontSize: Theme.of(context)
                                                        .textTheme
                                                        .headline6
                                                        .fontSize,
                                                    fontWeight: FontWeight.w600,
                                                    color: Color(0xff282423)),
                                              ),
                                            ),
                                          ),
                                          Text(
                                            DateFormat('MMM d, ' 'yyyy')
                                                .format(notes.notesList[index]
                                                    .createdTime)
                                                .toString(),
                                            style: GoogleFonts.openSans(
                                                color: Color(0xff282423),
                                                fontWeight: FontWeight.w400),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              )
                            : Center(
                                child: Text(
                                  "No Notes yet, add something worth Remembering... :)",
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.openSans(
                                    color: Colors.white,
                                    fontSize: Theme.of(context)
                                        .textTheme
                                        .headline6
                                        .fontSize,
                                  ),
                                ),
                              ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
