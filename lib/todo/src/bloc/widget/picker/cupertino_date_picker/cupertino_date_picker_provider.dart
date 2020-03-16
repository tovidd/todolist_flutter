import 'package:flutter/material.dart';
import 'cupertino_date_picker_bloc.dart';
export 'cupertino_date_picker_bloc.dart';

class CupertinoDatePickerProvider extends InheritedWidget {
  final CupertinoDatePickerBloc bloc;

  CupertinoDatePickerProvider({Key key, Widget child})
      : bloc = CupertinoDatePickerBloc(),
        super(key: key, child: child);

  bool updateShouldNotify(_) => true;

  static CupertinoDatePickerBloc of(BuildContext context) {
    return (context.inheritFromWidgetOfExactType(CupertinoDatePickerProvider)
            as CupertinoDatePickerProvider)
        .bloc;
  }
}
