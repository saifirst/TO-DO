import 'package:uuid/uuid.dart';

const uuid = Uuid();

class ToDo {
  ToDo({required this.title, required this.isDone}) : id = uuid.v4();

  final String id;
  bool isDone;
  final String title;
}
