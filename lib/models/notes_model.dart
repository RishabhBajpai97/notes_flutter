import 'package:mobx/mobx.dart';
import 'package:notes/db/db.dart';
part 'notes_model.g.dart';

class NotesModel = _NotesModel with _$NotesModel;

abstract class _NotesModel with Store {
  @observable
  int id;
  @observable
  String title;
  @observable
  String content;
  @observable
  DateTime createdTime;
  _NotesModel({this.id, this.title, this.content, this.createdTime});

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      DatabaseProvider.COLUMN_TITLE: title,
      DatabaseProvider.COLUMN_CONTENT: content,
      DatabaseProvider.COLUMN_CREATED_TIME: createdTime.toIso8601String(),
    };
    if (id != null) {
      map[DatabaseProvider.COLUMN_ID] = id;
    }
    return map;
  }

  _NotesModel.fromMap(Map<String, dynamic> map) {
    id = map[DatabaseProvider.COLUMN_ID] as int;
    title = map[DatabaseProvider.COLUMN_TITLE] as String;
    content = map[DatabaseProvider.COLUMN_CONTENT] as String;
    createdTime =
        DateTime.parse(map[DatabaseProvider.COLUMN_CREATED_TIME] as String);
  }
}
