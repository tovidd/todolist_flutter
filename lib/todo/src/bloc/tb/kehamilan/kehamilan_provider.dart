import 'package:flutter/material.dart';
import 'kehamilan_bloc.dart';
export 'kehamilan_bloc.dart';

class KehamilanProvider extends InheritedWidget {
  final KehamilanBloc bloc;

  KehamilanProvider({Key key, Widget child})
      : bloc = KehamilanBloc(),
        super(key: key, child: child);

  bool updateShouldNotify(_) => true;

  static KehamilanBloc of(BuildContext context) {
    return (context.inheritFromWidgetOfExactType(KehamilanProvider)
            as KehamilanProvider)
        .bloc;
  }
}
