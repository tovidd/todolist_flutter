import 'package:flutter/material.dart';

import 'bloc/setting/profile_information/profile_information_provider.dart';
import 'bloc/todolist/todolist_provider.dart';
import 'bloc/setting/change_password/change_password_provider.dart';
import 'bloc/setting/push_notifications/push_notifications_provider.dart';
import 'bloc/setting/rate_our_app/rate_our_app_provider.dart';
import 'bloc/widget/slider/custom_number_picker_provider.dart';
import 'bloc/tb/kehamilan/kehamilan_provider.dart';
import 'bloc/tb/tema/tema_provider.dart';

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
import 'screen/setting/privacy_policy/privacy_policy_screen.dart';

import 'screen/widget/widget_screen.dart';
import 'screen/widget/slider/custom_number_picker_screen.dart';
import 'screen/widget/slider/review_slider.dart';
import 'screen/widget/progress_indicator/custom_liquid_progress_indicator.dart';
import 'screen/widget/progress_indicator/custom/example.dart';
import 'screen/widget/listview/animated_listview_screen.dart';

import 'screen/tb/tb_screen.dart';
import 'screen/tb/kehamilan/kehamilan_screen.dart';
import 'screen/tb/tema/tema_screen.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TemaProvider(
      child: KehamilanProvider(
        child: CustomNumberPickerProvider(
          child: RateOurAppProvider(
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
      case PrivacyPolicyScreen.routeName:
        return MaterialPageRoute(builder: (_) => PrivacyPolicyScreen());
        break;
      case WidgetScreen.routeName:
        return MaterialPageRoute(builder: (_) => WidgetScreen());
        break;
      case CustomNumberPickerScreen.routeName:
        return MaterialPageRoute(builder: (_) => CustomNumberPickerScreen());
        break;
      case ReviewSlider.routeName:
        return MaterialPageRoute(
            builder: (_) => ReviewSlider(onChange: (val) {}));
        break;
      case CustomLiquidProgressIndicator.routeName:
        return MaterialPageRoute(
            builder: (_) => CustomLiquidProgressIndicator());
        break;
      case Example.routeName:
        return MaterialPageRoute(builder: (_) => Example());
        break;
      case TBScreen.routeName:
        return MaterialPageRoute(builder: (_) => TBScreen());
        break;
      case KehamilanScreen.routeName:
        return MaterialPageRoute(builder: (_) => KehamilanScreen());
        break;
      case AnimatedListViewScreen.routeName:
        return MaterialPageRoute(builder: (_) => AnimatedListViewScreen());
        break;
      case TemaScreen.routeName:
        return MaterialPageRoute(builder: (_) => TemaScreen());
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
