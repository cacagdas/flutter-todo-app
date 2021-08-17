import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_todo_app/constants/strings.dart';
import 'package:flutter_todo_app/presentation/pages/add_todo_page.dart';
import 'package:flutter_todo_app/presentation/pages/edit_todo_page.dart';
import 'package:flutter_todo_app/presentation/pages/todo_page.dart';

class AppRouter {
  Route? generateRoute(RouteSettings settings) {
    switch(settings.name) {
      case "/":
        return MaterialPageRoute(builder: (_) => TodosPage());
      case EDIT_TODO_ROUTE:
        return MaterialPageRoute(builder: (_) => EditTodoPage());
      case ADD_TODO_ROUTE:
        return MaterialPageRoute(builder: (_) => AddTodoPage());
      default:
        return null;
    }
  }
}