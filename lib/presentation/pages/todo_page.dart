import 'package:flutter/material.dart';
import 'package:flutter_todo_app/constants/strings.dart';

class TodosPage extends StatelessWidget {
  const TodosPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Todos'),
        actions: [
          InkWell(
            onTap: () => Navigator.pushNamed(context, ADD_TODO_ROUTE),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(Icons.add_box_rounded),
            ),
          ),
        ],
      ),
      body: Center(
        child: Text('Todos Page'),
      ),
    );
  }
}
