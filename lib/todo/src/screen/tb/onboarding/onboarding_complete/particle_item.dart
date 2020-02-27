import 'dart:math';

import 'package:flutter/material.dart';
import 'dart:ui' as ui;
import 'package:flutter/services.dart' show rootBundle;
import 'dart:async';
import 'dart:typed_data';

import 'particle_model.dart';

class ParticleItem extends StatelessWidget {
  final List<ParticleModel> particles;
  final Duration time;

  ParticleItem(this.particles, this.time);

  @override
  Widget build(BuildContext context) {
    return container(context);
  }

  Widget container(BuildContext context) {
    return Container(
      child: ImagePainter(
        particles: this.particles,
        time: this.time,
      ),
    );
  }
}

class ImagePainter extends StatefulWidget {
  final List<ParticleModel> particles;
  final Duration time;

  ImagePainter({Key key, this.particles, this.time}) : super(key: key);

  @override
  _ImagePainterState createState() => _ImagePainterState();
}

class _ImagePainterState extends State<ImagePainter> {
  ui.Image image;
  bool isImageloaded = false;

  void initState() {
    super.initState();
    init();
  }

  Future<Null> init() async {
    final ByteData data = await rootBundle.load(randomImage());
    image = await loadImage(Uint8List.view(data.buffer));
  }

  Future<ui.Image> loadImage(List<int> img) async {
    final Completer<ui.Image> completer = Completer();
    ui.decodeImageFromList(img, (ui.Image img) {
      setState(() {
        isImageloaded = true;
      });
      return completer.complete(img);
    });
    return completer.future;
  }

  String randomImage() {
//    int random = Random().nextInt(3);
    String imagePath = 'assets/ic_smile_48px.png';

    return imagePath;
  }

  Widget _buildImage() {
    if (this.isImageloaded) {
      return CustomPaint(
        painter: ImageEditor(
          image: image,
          particles: this.widget.particles,
          time: this.widget.time,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: _buildImage(),
    );
  }
}

class ImageEditor extends CustomPainter {
  final ui.Image image;
  final List<ParticleModel> particles;
  final Duration time;

  ImageEditor({this.image, this.particles, this.time});

  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint();
    paint.color = Color.fromRGBO(0, 0, 0, 1); // full opaque

    particles.forEach((particle) {
      var progress = particle.animationProgress.progress(time);
      final animation = particle.tween.transform(progress);
      final position =
          Offset(animation["x"] * size.width, animation["y"] * size.height);

      if (position.dy >= 0) {
        if (position.dy > 200) {
          paint.color = Color.fromRGBO(0, 0, 0, 0.0); // non opaque
        } else if (position.dy > 150) {
          paint.color = Color.fromRGBO(0, 0, 0, 0.10);
        } else if (position.dy > 120) {
          paint.color = Color.fromRGBO(0, 0, 0, 0.25);
        } else if (position.dy > 90) {
          paint.color = Color.fromRGBO(0, 0, 0, 0.50);
        } else if (position.dy > 60) {
          paint.color = Color.fromRGBO(0, 0, 0, 0.65);
        } else if (position.dy > 30) {
          paint.color = Color.fromRGBO(0, 0, 0, 0.80);
        }
      }
      canvas.scale(1.015);
      canvas.drawImage(image, position, paint);
    });
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
