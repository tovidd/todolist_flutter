import 'package:flutter/material.dart';
import 'rate_our_app_bloc.dart';
export 'rate_our_app_bloc.dart';

class RateOurAppProvider extends InheritedWidget {
  final RateOurAppBloc bloc;

  RateOurAppProvider({Key key, Widget child})
      : bloc =RateOurAppBloc(),
        super(key: key, child: child);

  bool updateShouldNotify(_) => true;

  static RateOurAppBloc of(BuildContext context) {
    return (context.inheritFromWidgetOfExactType(RateOurAppProvider)
    as RateOurAppProvider)
        .bloc;
  }
}