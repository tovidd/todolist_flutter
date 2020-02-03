import 'package:flutter/material.dart';

import 'bloc/setting/profile_information/profile_information_provider.dart';
import 'bloc/todolist/todolist_provider.dart';
import 'bloc/setting/change_password/change_password_provider.dart';
import 'bloc/setting/push_notifications/push_notifications_provider.dart';
import 'bloc/setting/rate_our_app/rate_our_app_provider.dart';

import 'screen/home_screen.dart';
import 'screen/setting/setting_screen.dart';
import 'screen/done_todolist_screen.dart';
import 'screen/delete_todolist_screen.dart';
import 'screen/overdue_todolist_screen.dart';
import 'screen/setting/profile_information/profile_information_screen.dart';
import 'screen/setting/change_password/change_password_screen.dart';
import 'screen/setting/push_notifications/push_notifications_screen.dart';
import 'screen/setting/rate_our_app/rate_our_app_screen.dart';
import 'screen/setting/send_feedback/send_feedback_screen.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return RateOurAppProvider(
      child: PushNotificationsProvider(
        child: ChangePasswordProvider(
          child: ProfileInformationProvider(
            child: TodolistProvider(
              child: MaterialApp(
                title: 'Dashboard',
                onGenerateRoute: routes,
                debugShowCheckedModeBanner: false,
              ),
            ),
          ),
        ),
      ),
    );
  }

  static Route<dynamic> routes(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case HomeScreen.routeName:
        return MaterialPageRoute(builder: (_) => HomeScreen());
        break;
      case DoneTodolistScreen.routeName:
        return MaterialPageRoute(builder: (_) => DoneTodolistScreen());
        break;
      case DeleteTodolistScreen.routeName:
        return MaterialPageRoute(builder: (_) => DeleteTodolistScreen());
        break;
      case OverdueTodolistScreen.routeName:
        return MaterialPageRoute(builder: (_) => OverdueTodolistScreen());
        break;
      case SettingScreen.routeName:
        return MaterialPageRoute(builder: (_) => SettingScreen());
        break;
      case ProfileInformationScreen.routeName:
        return MaterialPageRoute(builder: (_) => ProfileInformationScreen());
        break;
      case ChangePasswordScreen.routeName:
        return MaterialPageRoute(builder: (_) => ChangePasswordScreen());
        break;
      case PushNotificationsScreen.routeName:
        return MaterialPageRoute(
            builder: (_) => PushNotificationsScreen(animate: false));
        break;
      case RateOurAppScreen.routeName:
        RateOurAppScreen data = routeSettings.arguments;
        return MaterialPageRoute(
          builder: (_) => RateOurAppScreen(
            filledStar: data.filledStar,
            unfilledStar: data.unfilledStar,
          ),
        );
        break;
      case SendFeedbackScreen.routeName:
        return MaterialPageRoute(builder: (_) => SendFeedbackScreen());
        break;
      default:
        MaterialPageRoute(builder: (_) => pageNotFound());
    }
  }

  static Widget pageNotFound() {
    return Scaffold(
      body: Center(
        child: Text('Page Not Found',
            style: TextStyle(
                color: Colors.red, fontWeight: FontWeight.bold, fontSize: 20)),
      ),
    );
  }
}
