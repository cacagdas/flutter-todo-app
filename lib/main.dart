import 'package:flutter/material.dart';
import 'package:flutter_todo_app/presentation/pages/todos_page.dart';
import 'package:flutter_todo_app/presentation/router.dart';

import 'di/component/service_locator.dart';

void main() async {
  await setupLocator();
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