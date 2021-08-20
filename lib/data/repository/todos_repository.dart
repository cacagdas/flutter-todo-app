import 'package:flutter_todo_app/data/model/todo.dart';
import 'package:flutter_todo_app/data/remote/todos_service.dart';

class TodosRepository {
  final TodosService _service;

  TodosRepository(this._service);

  Future<List<Todo>?> fetchTodos() async {
    return await _service.fetchTodos();
  }

}