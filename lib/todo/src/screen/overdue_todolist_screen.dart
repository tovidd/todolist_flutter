import 'package:flutter/material.dart';

class OverdueTodolistScreen extends StatelessWidget {
  static const routeName = '/overdueTodolist';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Overdue'),
      ),
    );
  }
}