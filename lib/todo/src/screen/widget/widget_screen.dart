import 'package:flutter/material.dart';

import 'slider/custom_number_picker_screen.dart';
import 'slider/review_slider.dart';
import 'progress_indicator/custom_liquid_progress_indicator.dart';
import 'progress_indicator/custom/example.dart';

class WidgetScreen extends StatelessWidget {
  static const routeName = '/widget_screen';
  static GlobalKey pageKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Widget'),
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
          card(context, CustomNumberPickerScreen.routeName),
          card(context, ReviewSlider.routeName),
          card(context, CustomLiquidProgressIndicator.routeName),
          card(context, Example.routeName),
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
