import 'package:flutter/material.dart';

import 'slider/custom_number_picker_screen.dart';
import 'slider/review_slider.dart';
import 'progress_indicator/custom_liquid_progress_indicator.dart';
import 'progress_indicator/custom/example.dart';
import 'listview/animated_listview_screen.dart';
import 'animation/particle_animation/particles.dart';
import 'progress_indicator/masking_gif.dart';
import 'picker/cupertino_date_picker/cupertino_date_picker_screen.dart';
import 'animation/scale_transition/scale_transition_screen.dart';
import 'asset_read/asset_text.dart';
import 'slider/balloon_slider/balloon_slider_screen.dart';
import 'animation/confetti/confetti_screen.dart';

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
          card(context, AnimatedListViewScreen.routeName),
          card(context, Particles.routeName),
          card(context, MaskingGif.routeName),
          card(context, CupertinoDatePickerScreen.routeName),
          card(context, ScaleTransitionScreen.routeName),
          card(context, AssetText.routeName),
          card(context, BalloonSliderScreen.routeName),
          card(context, ConfettiScreen.routeName),
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
