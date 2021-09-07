import 'package:flutter/material.dart';
import 'package:flutter_todo_app/presentation/widgets/button_widget.dart';

class AddTodoPage extends StatelessWidget {

  final _textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Todo'),
      ),
      body: Container(
        margin: const EdgeInsets.all(20.0),
        child: _addTodoBody(context),
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
        )
      ],
    );
  }
}
