import 'package:flutter_todo_app/data/model/todo.dart';
import 'package:flutter_todo_app/data/remote/todos_service.dart';

class TodosRepository {
  final TodosService _service;

  TodosRepository(this._service);

  Future<List<Todo>?> fetchTodos() async {
    return await _service.fetchTodos();
  }

  Future<bool> changeCompletionStatus(bool completed, int id) async {
    final patchObject = {"isCompleted": completed};
    return await _service.patchTodo(patchObject, id);
  }
}
