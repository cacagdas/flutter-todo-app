import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_todo_app/cubit/edit_todo_cubit.dart';
import 'package:flutter_todo_app/data/model/todo.dart';
import 'package:flutter_todo_app/presentation/widgets/button_widget.dart';
import 'package:flutter_todo_app/values/colors.dart' as colors;

class EditTodoPage extends StatelessWidget {
  final Todo todo;
  final _textEditingController = TextEditingController();

  EditTodoPage({Key? key, required this.todo}) : super(key: key);

  void _updateTodo(String text, context) {
    BlocProvider.of<EditTodoCubit>(context)
        .updateTodo(todo, _textEditingController.text);
  }

  void _showSnackBar(String content, context, {bool isError = false}) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(content),
      backgroundColor: isError ? Colors.redAccent : colors.accentColor,
    ));
  }

  @override
  Widget build(BuildContext context) {
    _textEditingController.text = todo.title ?? '';
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Todo'),
        actions: [
          InkWell(
            onTap: () =>
                BlocProvider.of<EditTodoCubit>(context).deleteTodo(todo),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(Icons.delete),
            ),
          )
        ],
      ),
      body: BlocListener<EditTodoCubit, EditTodoState>(
        listener: (context, state) {
          if (state is TodoEdited) {
            _showSnackBar('Edited successfully.', context);
            Navigator.pop(context);
          } else if (state is TodoDeleted) {
            _showSnackBar('Deleted successfully.', context);
            Navigator.pop(context);
          } else if (state is EditTodoError) {
            _showSnackBar(state.error, context, isError: true);
          }
        },
        child: Container(
          margin: const EdgeInsets.all(20.0),
          child: _addTodoBody(context),
        ),
      ),
    );
  }

  Widget _addTodoBody(context) {
    return Column(
      children: [
        TextField(
          autofocus: true,
          controller: _textEditingController,
          decoration:
              InputDecoration(border: OutlineInputBorder(), labelText: 'Title'),
        ),
        ButtonWidget(
            label: 'Update Todo',
            onPress: () => _updateTodo(_textEditingController.text, context)),
        Center(child: _loading())
      ],
    );
  }

  Widget? _loading() {
    BlocBuilder<EditTodoCubit, EditTodoState>(
      builder: (context, state) {
        return Visibility(
          child: CircularProgressIndicator(),
          visible: state is EditingTodo,
        );
      },
    );
  }
}
