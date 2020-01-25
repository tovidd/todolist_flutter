import 'package:flutter/material.dart';
import 'change_password_bloc.dart';
export 'change_password_bloc.dart';

class ChangePasswordProvider extends InheritedWidget {
  final ChangePasswordBloc bloc;

  ChangePasswordProvider({Key key, Widget child})
      : bloc =ChangePasswordBloc(),
        super(key: key, child: child);

  bool updateShouldNotify(_) => true;

  static ChangePasswordBloc of(BuildContext context) {
    return (context.inheritFromWidgetOfExactType(ChangePasswordProvider)
    as ChangePasswordProvider)
        .bloc;
  }
}