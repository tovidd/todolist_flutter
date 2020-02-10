import 'package:flutter/material.dart';
import 'custom_number_picker_bloc.dart';
export 'custom_number_picker_bloc.dart';

class CustomNumberPickerProvider extends InheritedWidget {
  final CustomNumberPickerBloc bloc;

  CustomNumberPickerProvider({Key key, Widget child})
      : bloc = CustomNumberPickerBloc(),
        super(key: key, child: child);

  bool updateShouldNotify(_) => true;

  static CustomNumberPickerBloc of(BuildContext context) {
    return (context.inheritFromWidgetOfExactType(CustomNumberPickerProvider)
            as CustomNumberPickerProvider)
        .bloc;
  }
}
