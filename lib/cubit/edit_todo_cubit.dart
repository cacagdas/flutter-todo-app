import 'package:bloc/bloc.dart';
import 'package:flutter_todo_app/cubit/todos_cubit.dart';
import 'package:flutter_todo_app/data/model/todo.dart';
import 'package:flutter_todo_app/data/repository/todos_repository.dart';
import 'package:meta/meta.dart';

part 'edit_todo_state.dart';

class EditTodoCubit extends Cubit<EditTodoState> {
  final TodosRepository _repository;
  final TodosCubit _todosCubit;

  EditTodoCubit(this._repository, this._todosCubit) : super(EditTodoInitial());

  deleteTodo(Todo todo) {
    _repository.deleteTodo(todo.id).then((isDeleted) {
      if (isDeleted) {
        _todosCubit.deleteTodo(todo);
        emit(TodoDeleted());
      }
    });
  }

  void updateTodo(Todo todo, String text) {
    if (text.isEmpty) {
      emit(EditTodoError('Todo is empty'));
      return;
    }
    emit(EditingTodo());
    _repository.updateTodo(text, todo.id).then((isEdited) {
      if (isEdited) {
        todo.title = text;
        _todosCubit.updateTodoList();
        emit(TodoEdited());
      }
    });
  }
}
