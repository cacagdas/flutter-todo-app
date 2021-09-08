import 'package:bloc/bloc.dart';
import 'package:flutter_todo_app/cubit/todos_cubit.dart';
import 'package:flutter_todo_app/data/model/add_todo_request.dart';
import 'package:flutter_todo_app/data/repository/todos_repository.dart';
import 'package:meta/meta.dart';

part 'add_todo_state.dart';

class AddTodoCubit extends Cubit<AddTodoState> {
  final TodosRepository _repository;
  final TodosCubit _todosCubit;

  AddTodoCubit(this._repository, this._todosCubit) : super(AddTodoInitial());


  void addTodo(String text) {
    if(text.isEmpty) {
      emit(AddTodoError('Todo is empty'));
      return;
    }

    emit(AddingTodo());
    _repository.addTodo(AddTodoRequest(title: text, isCompleted: false)).then((value) {
      _todosCubit.addTodo(value).whenComplete(() => emit(TodoAdded()));
    });
  }
}
