import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_todo_app/constants/strings.dart';
import 'package:flutter_todo_app/cubit/add_todo_cubit.dart';
import 'package:flutter_todo_app/cubit/edit_todo_cubit.dart';
import 'package:flutter_todo_app/cubit/todos_cubit.dart';
import 'package:flutter_todo_app/data/model/todo.dart';
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
            builder: (_) => BlocProvider.value(
                  value: getIt<TodosCubit>(),
                  child: TodosPage(),
                ));
      case EDIT_TODO_ROUTE:
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                  create: (context) => EditTodoCubit(
                      getIt<TodosRepository>(), getIt<TodosCubit>()),
                  child: EditTodoPage(
                    todo: settings.arguments as Todo,
                  ),
                ));
      case ADD_TODO_ROUTE:
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                  create: (context) => AddTodoCubit(
                      getIt<TodosRepository>(), getIt<TodosCubit>()),
                  child: AddTodoPage(),
                ));
      default:
        return null;
    }
  }
}
