import 'dart:math';

import 'package:flutter/material.dart';
import 'package:simple_animations/simple_animations.dart';

class ParticleModel {
  Animatable tween;
  double size;
  AnimationProgress animationProgress;

  ParticleModel() {
    restart(time: Duration(seconds: 3));
  }

  restart({Duration time = Duration.zero}) {
    var randomX = 0.00 + (0.75 - 0.00) * Random().nextDouble();
    var randomY = -1.0 + (0 - -1.0) * Random().nextDouble();
    final startPosition = Offset(randomX, randomY);
    final endPosition = Offset(randomX, 2.0);
    final duration = Duration(milliseconds: 40000);

    tween = MultiTrackTween([
      Track("x").add(
          duration, Tween(begin: startPosition.dx, end: endPosition.dx),
          curve: Curves.easeInOutSine),
      Track("y").add(
          duration, Tween(begin: startPosition.dy, end: endPosition.dy),
          curve: Curves.easeOut),
    ]);

    animationProgress = AnimationProgress(duration: duration, startTime: time);
  }

// Animasi berulang-ulang dan random position
//  restart({Duration time = Duration.zero}) {
//    final startPosition = Offset(-0.2 + 1.4 * random.nextDouble(),
//        (random.nextInt(5) + 1).toDouble() * -0.2);
//    final endPosition = Offset(-0.2 + 1.4 * random.nextDouble(), 0.3);
//    final duration = Duration(milliseconds: 7000 + random.nextInt(12000));
//
//    tween = MultiTrackTween([
//      Track("x").add(
//          duration, Tween(begin: startPosition.dx, end: endPosition.dx),
//          curve: Curves.easeInOutSine),
//      Track("y").add(
//          duration, Tween(begin: startPosition.dy, end: endPosition.dy),
//          curve: Curves.easeIn),
//    ]);
//    animationProgress = AnimationProgress(duration: duration, startTime: time);
//    size = 0.2 + random.nextDouble() * 0.4;
//  }

  maintainRestart(Duration time) {
    if (animationProgress.progress(time) == 1.0) {
      restart(time: time);
    }
  }
}

// https://medium.com/@felixblaschke/particle-animations-with-flutter-756a23dba027
