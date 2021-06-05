// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notes.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$Notes on _Notes, Store {
  Computed<ObservableList<NotesModel>> _$notesListComputed;

  @override
  ObservableList<NotesModel> get notesList => (_$notesListComputed ??=
          Computed<ObservableList<NotesModel>>(() => super.notesList,
              name: '_Notes.notesList'))
      .value;

  final _$isLoadingAtom = Atom(name: '_Notes.isLoading');

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  final _$_notesListAtom = Atom(name: '_Notes._notesList');

  @override
  ObservableList<NotesModel> get _notesList {
    _$_notesListAtom.reportRead();
    return super._notesList;
  }

  @override
  set _notesList(ObservableList<NotesModel> value) {
    _$_notesListAtom.reportWrite(value, super._notesList, () {
      super._notesList = value;
    });
  }

  final _$_NotesActionController = ActionController(name: '_Notes');

  @override
  dynamic getNotes() {
    final _$actionInfo =
        _$_NotesActionController.startAction(name: '_Notes.getNotes');
    try {
      return super.getNotes();
    } finally {
      _$_NotesActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic addNote(NotesModel note) {
    final _$actionInfo =
        _$_NotesActionController.startAction(name: '_Notes.addNote');
    try {
      return super.addNote(note);
    } finally {
      _$_NotesActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic updateNote(NotesModel updatednote) {
    final _$actionInfo =
        _$_NotesActionController.startAction(name: '_Notes.updateNote');
    try {
      return super.updateNote(updatednote);
    } finally {
      _$_NotesActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic deleteNote(int id) {
    final _$actionInfo =
        _$_NotesActionController.startAction(name: '_Notes.deleteNote');
    try {
      return super.deleteNote(id);
    } finally {
      _$_NotesActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isLoading: ${isLoading},
notesList: ${notesList}
    ''';
  }
}
