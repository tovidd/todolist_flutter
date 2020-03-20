import 'package:flutter/material.dart';
import 'package:todolist/todo/src/screen/tb/home/polling_screen.dart';
import 'package:todolist/todo/src/screen/tb/registrasi/complete_registration_screen.dart';
import 'package:todolist/todo/src/screen/tb/registrasi/input_phone_screen.dart';

import 'kehamilan/kehamilan_screen.dart';
import 'tema/tema_screen.dart';
import 'onboarding/onboarding_complete/onboarding_complete_screen.dart';

class TBScreen extends StatelessWidget {
  static const routeName = '/tb_screen';
  static GlobalKey pageKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('TB'),
      ),
      body: buildBody(context),
      backgroundColor: Colors.grey,
    );
  }

  Widget buildBody(BuildContext context) {
    return Container(
      child: ListView(
        padding: EdgeInsets.all(16),
        children: <Widget>[
          card(context, KehamilanScreen.routeName),
          card(context, TemaScreen.routeName),
          card(context, OnboardingCompleteScreen.routeName),
          card(context, CompleteRegistrationScreen.routeName),
          card(context, PollingScreen.routeName),
          card(context, InputPhoneScreen.routeName),
        ],
      ),
    );
  }

  Widget card(BuildContext context, String routeName) {
    return Card(
      child: GestureDetector(
        child: Container(
          padding: EdgeInsets.all(16),
          child: Text(routeName),
        ),
        onTap: () {
          Navigator.pushNamed(context, routeName);
        },
      ),
    );
  }
}
