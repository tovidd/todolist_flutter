import 'package:flutter/material.dart';
import 'todolist_bloc.dart';
export 'todolist_bloc.dart';

class TodolistProvider extends InheritedWidget {
  final TodolistBloc bloc;

  TodolistProvider({Key key, Widget child})
      : bloc = TodolistBloc(),
        super(key: key, child: child);

  bool updateShouldNotify(_) => true;

  static TodolistBloc of(BuildContext context) {
    return (context.inheritFromWidgetOfExactType(TodolistProvider)
    as TodolistProvider)
        .bloc;
  }
}