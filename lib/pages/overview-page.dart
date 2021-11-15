import 'package:flutter/material.dart';
import 'package:todo_app/models/status.dart';
import 'package:todo_app/models/todo.dart';
import 'package:todo_app/services/auth-service.dart';
import 'package:todo_app/widgets/todo-card.dart';

class OverviewPage extends StatefulWidget {

  const OverviewPage({ Key? key }) : super(key: key);

  @override
  State<OverviewPage> createState() => _OverviewPageState();
}

class _OverviewPageState extends State<OverviewPage> {

  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: const Text('Todo App - My Todos'),
        backgroundColor: Colors.indigo[800],
        elevation: 0.0,
        actions: <Widget>[
          FlatButton.icon(onPressed: () async => {
            await _auth.signOut()
          }, icon: const Icon(Icons.person, color: Colors.white,), label: const Text('logout', style: TextStyle(color: Colors.white),))
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
        backgroundColor: Colors.indigo[800],
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(4.0, 12.0, 4.0, 0.0),
        child: TodoCard(todo: Todo('Test Title', DateTime.now(), Status.FINISHED)),
      ),
    );
  }
}
