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
  bool isLoading = false;
  @observable
  ObservableList<NotesModel> _notesList = ObservableList<NotesModel>();
  @computed
  ObservableList<NotesModel> get notesList {
    return ObservableList<NotesModel>.of(_notesList);
  }

  @action
  getNotes() {
    isLoading = true;
    DatabaseProvider.db.getNotes().then((noteList) {
      runInAction(() {
        _notesList = ObservableList.of(noteList);
        isLoading = false;
      });
    });
  }

  @action
  addNote(NotesModel note) {
    DatabaseProvider.db.insert(note).then(
          (storedNote) => runInAction(
            () {
              _notesList.insert(0, storedNote);
            },
          ),
        );
  }

  @action
  updateNote(NotesModel updatednote) {
    DatabaseProvider.db.update(updatednote).then((_) => runInAction(() {
          var founditem = _notesList.firstWhere(
            (element) => element.id == updatednote.id,
            orElse: () => null,
          );
          if (founditem != null) {
            founditem.content = updatednote.content;
            founditem.title = updatednote.title;
          }
        }));
  }

  @action
  deleteNote(int id) {
    DatabaseProvider.db.delete(id).then((_) => runInAction(() {
          _notesList.removeWhere((element) => element.id == id);
        }));
  }
}
