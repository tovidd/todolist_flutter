import 'package:flutter/material.dart';

import '../../screen/setting/change_password/change_password_screen.dart';
import '../../screen/setting/privacy_policy/privacy_policy_screen.dart';
import '../../screen/setting/profile_information/profile_information_screen.dart';
import '../../screen/setting/push_notifications/push_notifications_screen.dart';
import '../../screen/setting/send_feedback/send_feedback_screen.dart';
import '../../screen/setting/rate_our_app/rate_our_app_screen.dart';

class SettingScreen extends StatelessWidget {
  static const routeName = '/setting';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              backgroundColor: Colors.black,
              leading: IconButton(
                icon: Icon(
                  Icons.close,
                  color: Colors.redAccent,
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              floating: false,
              pinned: true,
              expandedHeight: 100.0,
              flexibleSpace: FlexibleSpaceBar(
                titlePadding: EdgeInsets.only(
                  left: 72,
                  bottom: 13,
                ),
                title: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'Settings',
                    ),
                    Text(
                      'Update Your Preferences',
                      style: TextStyle(
                        fontSize: 12.0,
                      ),
                    ),
                  ],
                ),
                background: Container(
                  color: Colors.white38,
                  height: 100,
                  width: MediaQuery.of(context).size.width,
                ),
              ),
            )
          ];
        },
        body: body(context),
      ),
      backgroundColor: Colors.grey[50],
    );
  }

  Widget body(BuildContext context) {
    return ListView(
      children: <Widget>[
        setting_title(context, 'Account Settings', Colors.grey),
        GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, ProfileInformationScreen.routeName);
          },
          child: setting_content(
              context,
              'Profile Information',
              'Name, Email, Security',
              'assets/ic_user.png',
              Icon(
                null,
                size: 25,
                color: Colors.blue,
              ),
              Colors.blue[50]),
        ),
        GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, ChangePasswordScreen.routeName);
          },
          child: setting_content(
              context,
              'Change Password',
              'Change Your Current Password',
              null,
              Icon(
                Icons.lock,
                size: 25,
                color: Colors.orange,
              ),
              Colors.orange[50]),
        ),
        setting_title(context, 'Notifications Setting', Colors.grey),
        GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, PushNotificationsScreen.routeName);
          },
          child: setting_content(
              context,
              'Push Notifications',
              'New Contract Sign Or Send',
              null,
              Icon(
                Icons.notifications,
                size: 25,
                color: Colors.tealAccent[400],
              ),
              Colors.lightGreen[50]),
        ),
        setting_title(context, 'General', Colors.grey),
        GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, RateOurAppScreen.routeName,
                arguments: RateOurAppScreen(
                    filledStar: Icons.favorite,
                    unfilledStar: Icons.favorite_border));
          },
          child: setting_content(
              context,
              'Rate Our App',
              'Rate & Review Us',
              null,
              Icon(
                Icons.favorite,
                size: 25,
                color: Colors.red,
              ),
              Colors.red[50]),
        ),
        GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, SendFeedbackScreen.routeName);
          },
          child: setting_content(context, 'Send Feedback', 'Share Your Thought',
              'assets/ic_mail.png', Icon(null, size: 25), Colors.green[50]),
        ),
        GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, PrivacyPolicyScreen.routeName);
          },
          child: setting_content(
              context,
              'Privacy Policy',
              'Read Privacy Policy',
              null,
              Icon(
                Icons.visibility_off,
                size: 25,
                color: Colors.black,
              ),
              Colors.black12),
        ),
        setting_title(context, 'Connected App(s)', Colors.grey),
        setting_content(
            context,
            'Connected With Facebook',
            'Tap To Manage',
            'assets/ic_facebook.png',
            Icon(
              null,
              size: 25,
            ),
            Colors.lightBlue[50]),
        setting_content(context, 'Connected With Google', 'Tap To Manage',
            'assets/ic_google.png', Icon(null, size: 25), Colors.white),
      ],
      padding: EdgeInsets.all(10),
    );
  }

  Widget setting_title(BuildContext context, String title, Color title_color) {
    return Container(
      margin: EdgeInsets.only(top: 15, bottom: 15),
      width: MediaQuery.of(context).size.width,
      child: Text(
        title.toUpperCase(),
        style: TextStyle(
            color: title_color, fontWeight: FontWeight.bold, fontSize: 18),
      ),
    );
  }

  Widget setting_content(BuildContext context, String title, String desription,
      String image, Icon icon, Color icon_bc) {
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      width: MediaQuery.of(context).size.width,
      height: 50,
      child: Row(
        children: <Widget>[
          CircleAvatar(
            radius: 25,
            backgroundColor: icon_bc,
            child: icon.icon == null
                ? Image.asset(
                    image,
                    height: 25,
                    width: 25,
                  )
                : icon,
          ),
          SizedBox(
            width: 20,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(title, style: TextStyle(color: Colors.black, fontSize: 16)),
              SizedBox(
                height: 5,
              ),
              Text(desription,
                  style: TextStyle(color: Colors.grey[700], fontSize: 14)),
            ],
          )
        ],
      ),
    );
  }
}
