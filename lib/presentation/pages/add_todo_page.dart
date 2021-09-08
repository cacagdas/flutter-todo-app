import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_todo_app/cubit/add_todo_cubit.dart';
import 'package:flutter_todo_app/presentation/widgets/button_widget.dart';
import 'package:flutter_todo_app/values/colors.dart' as colors;

class AddTodoPage extends StatelessWidget {

  final _textEditingController = TextEditingController();

  void _addTodo(String text, context) {
    BlocProvider.of<AddTodoCubit>(context).addTodo(_textEditingController.text);
  }

  void _showSnackBar(String content, context, {bool isError = false}) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(content),
      backgroundColor: isError ? Colors.redAccent : colors.accentColor,
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Add Todo'),
        ),
        body: BlocListener<AddTodoCubit, AddTodoState>(
          listener: (context, state) {
            if (state is TodoAdded) {
              _showSnackBar('Added successfully.', context);
              Navigator.pop(context);
            } else if (state is AddTodoError) {
              _showSnackBar(state.error, context, isError: true);
            }
          },
          child: Container(
            margin: const EdgeInsets.all(20.0),
            child: _addTodoBody(context),
          ),
        )
    );
  }

  Widget _addTodoBody(context) {
    return Column(
      children: [
        TextField(
          autofocus: true,
          controller: _textEditingController,
          decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Title'
          ),
        ),
        ButtonWidget(
          label: 'Add Todo',
          onPress: () => _addTodo(_textEditingController.text, context),
        ),
        Center(
            child: _loading()
        )
      ],
    );
  }

  Widget? _loading() {
    BlocBuilder<AddTodoCubit, AddTodoState>(
      builder: (context, state) {
        return Visibility(
          child: CircularProgressIndicator(),
          visible: state is AddingTodo,
        );
      },
    );
  }
}
