// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notes_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$NotesModel on _NotesModel, Store {
  final _$idAtom = Atom(name: '_NotesModel.id');

  @override
  int get id {
    _$idAtom.reportRead();
    return super.id;
  }

  @override
  set id(int value) {
    _$idAtom.reportWrite(value, super.id, () {
      super.id = value;
    });
  }

  final _$titleAtom = Atom(name: '_NotesModel.title');

  @override
  String get title {
    _$titleAtom.reportRead();
    return super.title;
  }

  @override
  set title(String value) {
    _$titleAtom.reportWrite(value, super.title, () {
      super.title = value;
    });
  }

  final _$contentAtom = Atom(name: '_NotesModel.content');

  @override
  String get content {
    _$contentAtom.reportRead();
    return super.content;
  }

  @override
  set content(String value) {
    _$contentAtom.reportWrite(value, super.content, () {
      super.content = value;
    });
  }

  final _$createdTimeAtom = Atom(name: '_NotesModel.createdTime');

  @override
  DateTime get createdTime {
    _$createdTimeAtom.reportRead();
    return super.createdTime;
  }

  @override
  set createdTime(DateTime value) {
    _$createdTimeAtom.reportWrite(value, super.createdTime, () {
      super.createdTime = value;
    });
  }

  @override
  String toString() {
    return '''
id: ${id},
title: ${title},
content: ${content},
createdTime: ${createdTime}
    ''';
  }
}
