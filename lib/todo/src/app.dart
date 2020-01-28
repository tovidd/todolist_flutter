import 'package:flutter/material.dart';

import 'bloc/setting/profile_information/profile_information_provider.dart';
import 'screen/home_screen.dart';
import 'bloc/todolist/todolist_provider.dart';
import 'screen/setting/setting_screen.dart';
import 'bloc/setting/change_password/change_password_provider.dart';
import 'screen/done_todolist_screen.dart';
import 'screen/delete_todolist_screen.dart';
import 'screen/overdue_todolist_screen.dart';
import 'screen/setting/profile_information_screen.dart';
import 'screen/setting/change_password_screen.dart';
import 'screen/setting/push_notifications_screen.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangePasswordProvider(
      child: ProfileInformationProvider(
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
      case '/doneTodolist': 
        return MaterialPageRoute(builder: (_) => DoneTodolistScreen());
        break;
      case '/deleteTodolist': 
        return MaterialPageRoute(builder: (_) => DeleteTodolistScreen());
        break;
      case '/overdueTodolist': 
        return MaterialPageRoute(builder: (_) => OverdueTodolistScreen());
        break;
      case '/setting': 
        return MaterialPageRoute(builder: (_) => SettingScreen());
        break;
      case '/setting_profile_information': 
        return MaterialPageRoute(builder: (_) => ProfileInformationScreen());
        break;
      case '/setting_change_password': 
        return MaterialPageRoute(builder: (_) => ChangePasswordScreen());
        break;
      case '/setting_push_notifications': 
        return MaterialPageRoute(builder: (_) => PushNotificationsScreen(PushNotificationsScreen.createSampleData(), animate: false,));
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