import 'dart:math';
import 'package:flutter/material.dart';
import 'package:simple_animations/simple_animations.dart';

import 'particle_painter.dart';
import 'particle_model.dart';

class Particles extends StatefulWidget {
  static const routeName = '/particles';
  final int numberOfParticles;

  Particles(this.numberOfParticles);

  @override
  _ParticlesState createState() => _ParticlesState();
}

class _ParticlesState extends State<Particles> {
  final Random random = Random()..nextInt(3);

  final List<ParticleModel> particles = [];
  Color primaryColor = Color(0xFFB68DC3);

  @override
  void initState() {
    List.generate(widget.numberOfParticles, (index) {
      particles.add(ParticleModel(random));
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text(Particles.routeName),
      ),
      body: SafeArea(
        child: buildBody(context, size),
      ),
    );
  }

  Widget buildBody(BuildContext context, Size size) {
    return Stack(
      children: <Widget>[
        Container(
          height: size.height,
          width: size.width,
          color: Colors.black,
        ),
        Container(
          height: size.height,
          width: size.width,
          child: Rendering(
            startTime: Duration(seconds: 10),
            onTick: _simulateParticles,
            startTimeSimulationTicks: 1,
            builder: (context, time) {
              return CustomPaint(
                painter: ParticlePainter(particles, time),
              );
            },
          ),
        ),
      ],
    );
  }

  _simulateParticles(Duration time) {
    particles.forEach((particle) => particle.maintainRestart(time));
  }
}

class CurvePaint extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: MediaQuery.of(context).size.width,
      child: CustomPaint(
        painter: _CurvePainter(),
      ),
    );
  }
}

class _CurvePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint();
    paint.strokeWidth = 8;
    paint.color = Color(0xFFB68DC3);
    paint.style = PaintingStyle.fill;
    Path path = Path()
      ..moveTo(0, 0)
      ..quadraticBezierTo(size.width / 2, size.height * 3, size.width, 0);
    path.close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
