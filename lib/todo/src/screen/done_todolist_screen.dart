import 'package:flutter/material.dart';

class DoneTodolistScreen extends StatelessWidget {
  static const routeName = '/doneTodolist';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Done'),
      ),
    );
  }
}