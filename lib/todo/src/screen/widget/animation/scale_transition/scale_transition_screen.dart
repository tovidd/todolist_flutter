import 'dart:math';
import 'package:flutter/material.dart';
import 'package:animator/animator.dart';
import 'package:todolist/todo/src/resource/constant/image_assets.dart';

class ScaleTransitionScreen extends StatelessWidget {
  static const routeName = '/scale_transition';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(),
    );
  }
}

class Body extends StatelessWidget {
  static const circle_delay = 500;
  static const circle_duration = 2;
  static const content_delay = 1000;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

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
            future: Future.delayed(Duration(milliseconds: circle_delay)),
            builder: (c, s) => s.connectionState == ConnectionState.done
                ? Animator(
                    tweenMap: {
                      "scale": Tween<double>(begin: 3, end: 1),
                    },
                    cycles: 0,
                    duration: Duration(seconds: circle_duration),
                    curve: Curves.fastLinearToSlowEaseIn,
                    repeats: 1,
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
//          FutureBuilder(
//            future: Future.delayed(Duration(milliseconds: content_delay)),
//            builder: (c, s) => s.connectionState == ConnectionState.done
//                ? Animator(
//                    tweenMap: {
//                      "opacity": Tween<double>(begin: 0.7, end: 1),
//                      "translation":
//                          Tween<Offset>(begin: Offset(0.5, 0), end: Offset.zero)
//                    },
//                    cycles: 0,
//                    duration: Duration(milliseconds: 500),
//                    curve: Curves.fastLinearToSlowEaseIn,
//                    repeats: 1,
//                    builderMap: (Map<String, Animation> anim) => FadeTransition(
//                      opacity: anim["opacity"],
//                      child: FractionalTranslation(
//                        translation: anim["translation"].value,
//                        child: Container(
//                          color: Colors.transparent,
//                          alignment: Alignment.center,
//                          child: Container(
//                            width: size.width * (2.5 / 4),
//                            height: size.width * (2.5 / 4),
//                            child: Center(
//                              child: Image.asset(
//                                ImageAsset().ic_avocado(),
//                                height: 100,
//                              ),
//                            ),
//                          ),
//                        ),
//                      ),
//                    ),
//                  )
//                : Container(),
//          ),
          carouselItem(
              pic: ImageAsset().ic_avocado(),
              title: 'Trusted',
              description:
                  'Data Mums tidak akan tersebar luas dan\nterjaga privasinya',
              size: size),
        ],
      ),
    );
  }

  Widget carouselItem(
      {String pic, String title, String description, Size size}) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        FutureBuilder(
          future: Future.delayed(Duration(milliseconds: content_delay)),
          builder: (c, s) => s.connectionState == ConnectionState.done
              ? Animator(
                  tweenMap: {
                    "opacity": Tween<double>(begin: 0.7, end: 1),
                    "translation":
                        Tween<Offset>(begin: Offset(0.5, 0), end: Offset.zero)
                  },
                  cycles: 0,
                  duration: Duration(milliseconds: 500),
                  curve: Curves.fastLinearToSlowEaseIn,
                  repeats: 1,
                  builderMap: (Map<String, Animation> anim) => FadeTransition(
                    opacity: anim["opacity"],
                    child: FractionalTranslation(
                      translation: anim["translation"].value,
                      child: Container(
                        color: Colors.transparent,
                        alignment: Alignment.center,
                        child: Container(
                          child: Center(
                            child: Image.asset(
                              ImageAsset().ic_avocado(),
                              height: 100,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                )
              : Container(),
        ),
        SizedBox(
          height: 5,
        ),
        Center(
          child: Text(
            title,
            style: TextStyle(
              fontSize: 30,
              color: Colors.red,
              fontWeight: FontWeight.w500,
              letterSpacing: 2.0,
            ),
          ),
        ),
        SizedBox(
          height: 5,
        ),
        Center(
          child: Text(
            description,
            style: TextStyle(
              fontSize: 20,
              color: Colors.red,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}

// https://medium.com/flutter-community/flutter-animation-has-never-been-easier-part-1-e378e82b2508

// https://medium.com/flutter-community/a-deep-dive-into-transform-widgets-in-flutter-4dc32cd575a9
