import 'package:flutter_todo_app/constants/endpoints.dart';
import 'package:flutter_todo_app/data/model/add_todo_request.dart';
import 'package:flutter_todo_app/data/model/todo.dart';

import 'dio_client.dart';

class TodosService {
  final DioClient _dioClient;
  TodosService(this._dioClient);

  Future<List<Todo>>? fetchTodos() async {
    final res = await _dioClient.get(Endpoints.todos) as List;
    return res.map((e) => Todo.fromJson(e)).toList();
  }

  Future<bool> patchTodo(Map<String, dynamic> patchObject, int id) async {
    await _dioClient.patch("${Endpoints.todos}/$id", data: patchObject);
    return true;
  }

  Future<Map> addTodo(AddTodoRequest addTodoRequest) async {
    return await _dioClient.post(Endpoints.todos,
        data: addTodoRequest.toJson());
  }

  Future<bool> deleteTodo(int id) async {
    await _dioClient.delete("${Endpoints.todos}/$id");
    return true;
  }
}
