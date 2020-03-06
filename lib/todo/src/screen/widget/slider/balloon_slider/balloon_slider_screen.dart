import 'package:flutter/material.dart';
import 'balloon_slider.dart';

// ignore: must_be_immutable
class BalloonSliderScreen extends StatelessWidget {
  static const routeName = '/balloon_slider';
  ValueNotifier<double> _slider1Value = ValueNotifier<double>(0.0);
  ValueNotifier<double> _slider2Value = ValueNotifier<double>(0.0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(BalloonSliderScreen.routeName,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
      ),
      body: SizedBox.expand(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            _buildBalloonSlider(
                showRope: true, color: Colors.blue, sliderValue: _slider1Value),
            _buildBalloonSlider(
                showRope: false,
                color: Colors.blue,
                sliderValue: _slider2Value),
          ],
        ),
      ),
    );
  }

  Widget _buildBalloonSlider(
      {ValueNotifier<double> sliderValue, Color color, bool showRope}) {
    return Stack(
      alignment: Alignment.center,
      children: <Widget>[
        Container(
          width: 240,
          height: 60,
          child: BalloonSlider(
            value: sliderValue.value,
            ropeLength: 155,
            showRope: showRope,
            onChanged: (val) => sliderValue.value = val,
            color: color,
          ),
        ),
        Positioned(
          bottom: 0,
          right: 0,
          child: ValueListenableBuilder<double>(
            valueListenable: sliderValue,
            builder: (context, value, child) {
              int progress = (value * 100).round();
              return Text(
                "$progress",
                style: TextStyle(fontWeight: FontWeight.bold, color: color),
              );
            },
          ),
        )
      ],
    );
  }
}
