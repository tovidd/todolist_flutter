import 'package:flutter/material.dart';
import 'profile_information_bloc.dart';
export 'profile_information_bloc.dart';

class ProfileInformationProvider extends InheritedWidget {
  final ProfileInformationBloc bloc;

  ProfileInformationProvider({Key key, Widget child})
      : bloc =ProfileInformationBloc(),
        super(key: key, child: child);

  bool updateShouldNotify(_) => true;

  static ProfileInformationBloc of(BuildContext context) {
    return (context.inheritFromWidgetOfExactType(ProfileInformationProvider)
    as ProfileInformationProvider)
        .bloc;
  }
}