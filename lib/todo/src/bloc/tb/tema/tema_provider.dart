import 'package:flutter/material.dart';
import 'tema_bloc.dart';
export 'tema_bloc.dart';

class TemaProvider extends InheritedWidget {
  final TemaBloc bloc;

  TemaProvider({Key key, Widget child})
      : bloc = TemaBloc(),
        super(key: key, child: child);

  bool updateShouldNotify(_) => true;

  static TemaBloc of(BuildContext context) {
    return (context.inheritFromWidgetOfExactType(TemaProvider) as TemaProvider)
        .bloc;
  }
}
