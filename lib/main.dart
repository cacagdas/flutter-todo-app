import 'package:flutter/material.dart';
import 'package:flutter_todo_app/presentation/pages/todo_page.dart';
import 'package:flutter_todo_app/presentation/router.dart';

void main() {
  runApp(TodoApp(
    router: AppRouter(),
  ));
}

class TodoApp extends StatelessWidget {
  final AppRouter? router;

  const TodoApp({Key? key, this.router}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Todo Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      onGenerateRoute: router!.generateRoute,
      home: TodosPage(),
    );
  }
}