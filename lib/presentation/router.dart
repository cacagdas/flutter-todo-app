import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_todo_app/constants/strings.dart';
import 'package:flutter_todo_app/cubit/todos_cubit.dart';
import 'package:flutter_todo_app/data/repository/todos_repository.dart';
import 'package:flutter_todo_app/di/component/service_locator.dart';
import 'package:flutter_todo_app/presentation/pages/add_todo_page.dart';
import 'package:flutter_todo_app/presentation/pages/edit_todo_page.dart';
import 'package:flutter_todo_app/presentation/pages/todos_page.dart';

class AppRouter {
  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case "/":
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                  create: (context) => TodosCubit(getIt<TodosRepository>()),
                  child: TodosPage(),
                ));
      case EDIT_TODO_ROUTE:
        return MaterialPageRoute(builder: (_) => EditTodoPage());
      case ADD_TODO_ROUTE:
        return MaterialPageRoute(builder: (_) => AddTodoPage());
      default:
        return null;
    }
  }
}
