import 'package:flutter/material.dart';
import 'setting_profile_information_bloc.dart';
export 'setting_profile_information_bloc.dart';

class SettingProfileInformationProvider extends InheritedWidget {
  final SettingProfileInformationBloc bloc;

  SettingProfileInformationProvider({Key key, Widget child})
      : bloc =SettingProfileInformationBloc(),
        super(key: key, child: child);

  bool updateShouldNotify(_) => true;

  static SettingProfileInformationBloc of(BuildContext context) {
    return (context.inheritFromWidgetOfExactType(SettingProfileInformationProvider)
    as SettingProfileInformationProvider)
        .bloc;
  }
}