import 'package:flutter/material.dart';

class DeleteTodolistScreen extends StatelessWidget {
  static const routeName = '/deleteTodolist';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Delete'),
      ),
    );
  }
}