import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:todo_app/models/status.dart';
import 'package:todo_app/models/todo.dart';

class TodoCard extends StatefulWidget {
  
  final Todo todo;

  const TodoCard({ Key? key, required this.todo }) : super(key: key);

  @override
  State<TodoCard> createState() => _TodoCardState();
}

class _TodoCardState extends State<TodoCard> {

  MaterialColor getColorForIcon()  {
    return widget.todo.due.isAfter(DateTime.now()) ? Colors.red : Colors.grey;
  }

  Widget getIconForStatus() {
    switch(widget.todo.status) {
      case Status.TODO:
        return Icon(Icons.info, color: getColorForIcon());
      case Status.IN_PROGRESS:
        return Icon(Icons.info, color: getColorForIcon());
      case Status.FINISHED:
        return Icon(Icons.info, color: getColorForIcon());
      case Status.CANCELLED:
        return Icon(Icons.warning, color: getColorForIcon());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        splashColor: Colors.indigo.withAlpha(30),
        onTap: () => {},
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              leading: getIconForStatus(),
              title: Text(widget.todo.title),
              subtitle: Text('Due ${DateFormat('dd.MM.yyyy - hh:mm').format(widget.todo.due)}'),
            )
          ],
        ),
      ),
    );
  }
}
