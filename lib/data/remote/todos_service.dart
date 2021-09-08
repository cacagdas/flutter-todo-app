import 'package:flutter_todo_app/constants/endpoints.dart';
import 'package:flutter_todo_app/data/model/add_todo_request.dart';
import 'package:flutter_todo_app/data/model/todo.dart';

import 'dio_client.dart';

class TodosService {
  final DioClient _dioClient;
  TodosService(this._dioClient);

  Future<List<Todo>>? fetchTodos() async {
    try {
      final res = await _dioClient.get(Endpoints.todos) as List;
      return res.map((e) => Todo.fromJson(e)).toList();
    } catch (e) {
      print(e.toString());
      throw e;
    }
  }

  Future<bool> patchTodo(Map<String, bool> patchObject, int id) async {
    try {
      await _dioClient.patch("${Endpoints.todos}/$id", data: patchObject);
      return true;
    } catch (e) {
      print(e.toString());
      throw e;
    }
  }

  Future<Map> addTodo(AddTodoRequest addTodoRequest) async {
    try {
      final res = await _dioClient.post(Endpoints.todos, data: addTodoRequest.toJson());
      return res;
    } catch (e) {
      print(e.toString());
      throw e;
    }
  }
}
