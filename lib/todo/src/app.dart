import 'package:flutter/material.dart';

import 'bloc/setting_profile_information/setting_profile_information_provider.dart';
import 'screen/home_screen.dart';
import 'bloc/todolist/todolist_provider.dart';
import 'screen/setting/setting_screen.dart';
import 'bloc/change_password/change_password_provider.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangePasswordProvider(
      child: SettingProfileInformationProvider(
            child: TodolistProvider(
          child: MaterialApp(
            title: 'Dashboard',
            onGenerateRoute: routes,
            debugShowCheckedModeBanner: false,
          ),
        ),
      ),
    );
  }

  static Route<dynamic> routes(RouteSettings routeSettings){
    switch (routeSettings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => HomeScreen());
        break;
      case '/setting': 
        return MaterialPageRoute(builder: (_) => SettingScreen());
        break;
      default: MaterialPageRoute(builder: (_) => pageNotFound());
    }
  }

  static Widget pageNotFound(){
    return Scaffold(
      body: Center(
        child: Text('Page Not Found', style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold, fontSize: 20)),
      ),
    );
  }
}