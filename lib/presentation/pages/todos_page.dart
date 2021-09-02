import 'package:flutter/material.dart';
import 'package:flutter_todo_app/constants/strings.dart';
import 'package:flutter_todo_app/cubit/todos_cubit.dart';
import 'package:flutter_todo_app/di/component/service_locator.dart';

class TodosPage extends StatelessWidget {
  const TodosPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    getIt<TodosCubit>().fetchTodos();

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
