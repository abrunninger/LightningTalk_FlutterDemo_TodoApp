import 'package:cloud_firestore/cloud_firestore.dart';
import 'status.dart';

class Todo {
  final String title;
  final DateTime due;
  final Status status;

  Todo(this.title, this.due, this.status);

  factory Todo.fromDocument(DocumentSnapshot document) {
    return Todo(
      document['title'],
      document['due'],
      document['status']
    );
  }
}
