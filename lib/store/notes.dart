import 'package:mobx/mobx.dart';
import 'package:notes/db/db.dart';
import 'package:notes/models/notes_model.dart';
part 'notes.g.dart';

class Notes extends _Notes with _$Notes {
  Notes._();
  factory Notes.getInstance() => _instance;
  static final Notes _instance = Notes._();
}

abstract class _Notes with Store {
  @observable
  ObservableList<NotesModel> _notesList = ObservableList<NotesModel>();
  @computed
  ObservableList<NotesModel> get notesList {
    DatabaseProvider.db.getNotes().then((foodList) {
      _notesList = ObservableList.of(foodList);
    });
    return ObservableList<NotesModel>.of(_notesList);
  }

  @action
  addNote(NotesModel note) {
    _notesList.add(note);
  }

  @action
  updateNote(NotesModel updatednote) {
    var founditem = _notesList.firstWhere(
      (element) => element.id == updatednote.id,
      orElse: () => null,
    );
    if (founditem != null) {
      founditem = updatednote;
      print("-----------------------${founditem.content}");
    }
  }

  @action
  deleteNote(int id) {
    _notesList.removeWhere((element) => element.id == id);
  }
}
