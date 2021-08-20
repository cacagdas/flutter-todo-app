import 'package:bloc/bloc.dart';
import 'package:flutter_todo_app/data/model/todo.dart';
import 'package:flutter_todo_app/data/repository/todos_repository.dart';
import 'package:meta/meta.dart';

part 'todos_state.dart';

class TodosCubit extends Cubit<TodosState> {
  final TodosRepository _repository;

  TodosCubit(this._repository) : super(TodosInitial());

  void fetchTodos() {
    _repository.fetchTodos().then((value) => emit(TodosLoaded(value!)));
  }
}
