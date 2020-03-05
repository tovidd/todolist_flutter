import 'dart:math';
import 'package:flutter/material.dart';
import 'package:animator/animator.dart';
import 'package:todolist/todo/src/resource/image_assets.dart';

class ScaleTransitionScreen extends StatelessWidget {
  static const routeName = '/scale_transition';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    int circle_delay = 1;
    int circle_duration = 5;

    return Container(
      height: size.height,
      width: size.width,
      decoration: BoxDecoration(
        color: Colors.green,
        gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            stops: [0.1, 0.8],
            colors: [Color(0xFF9DB7ED), Color(0xFFB68DC3)]),
      ),
      child: Stack(
        children: <Widget>[
          FutureBuilder(
            future: Future.delayed(Duration(seconds: circle_delay)),
            builder: (c, s) => s.connectionState == ConnectionState.done
                ? Animator(
                    tweenMap: {
                      "scale": Tween<double>(begin: 3, end: 1),
                    },
                    cycles: 0,
                    duration: Duration(seconds: circle_duration),
                    curve: Curves.fastLinearToSlowEaseIn,
                    repeats: 5,
                    builderMap: (anim) => Transform.scale(
                      scale: anim['scale'].value,
                      child: Container(
                        color: Colors.transparent,
                        alignment: Alignment.center,
                        child: Container(
                          width: size.width * (2 / 4),
                          height: size.width * (2 / 4),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(200),
                          ),
                        ),
                      ),
                    ),
                  )
                : Container(),
          ),
          FutureBuilder(
            future: Future.delayed(Duration(seconds: circle_duration)),
            builder: (c, s) => s.connectionState == ConnectionState.done
                ? Container(
                    color: Colors.transparent,
                    alignment: Alignment.center,
                    child: Container(
                      width: size.width * (2.5 / 4),
                      height: size.width * (2.5 / 4),
                      child: Center(
                        child: Image.asset(
                          ImageAsset().ic_avocado(),
                          height: 100,
                        ),
                      ),
                    ),
                  )
                : Container(),
          ),
        ],
      ),
    );
  }
}

// https://medium.com/flutter-community/flutter-animation-has-never-been-easier-part-1-e378e82b2508

// https://medium.com/flutter-community/a-deep-dive-into-transform-widgets-in-flutter-4dc32cd575a9
