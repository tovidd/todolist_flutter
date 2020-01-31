import 'package:flutter/material.dart';
import 'push_notifications_bloc.dart';
export 'push_notifications_bloc.dart';

class PushNotificationsProvider extends InheritedWidget {
  final PushNotificationsBloc bloc;

  PushNotificationsProvider({Key key, Widget child})
      : bloc =PushNotificationsBloc(),
        super(key: key, child: child);

  bool updateShouldNotify(_) => true;

  static PushNotificationsBloc of(BuildContext context) {
    return (context.inheritFromWidgetOfExactType(PushNotificationsProvider)
    as PushNotificationsProvider)
        .bloc;
  }
}