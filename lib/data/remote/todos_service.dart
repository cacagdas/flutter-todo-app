import 'package:flutter_todo_app/constants/endpoints.dart';
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

}