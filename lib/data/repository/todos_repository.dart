import 'package:flutter_todo_app/data/model/add_todo_request.dart';
import 'package:flutter_todo_app/data/model/todo.dart';
import 'package:flutter_todo_app/data/remote/todos_service.dart';

class TodosRepository {
  final TodosService _service;

  TodosRepository(this._service);

  Future<List<Todo>?> fetchTodos() async => await _service.fetchTodos();

  Future<bool> changeCompletionStatus(bool completed, int id) async {
    final patchObject = {"isCompleted": completed};
    return await _service.patchTodo(patchObject, id);
  }

  Future<Todo> addTodo(AddTodoRequest addTodoRequest) async {
    return await _service.addTodo(addTodoRequest).then((value) => Todo.fromJson(value));
  }
}
