import 'dart:math';
import 'package:flutter/material.dart';
import 'package:simple_animations/simple_animations.dart';
import 'package:todolist/todo/src/screen/widget/animation/particle_animation/particle_item.dart';

import 'particle_model.dart';
//import 'particle_painter.dart';

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
      body: SafeArea(
        child: buildBody(context, size),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        backgroundColor: primaryColor,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.add), title: Text('')),
          BottomNavigationBarItem(icon: Icon(Icons.check), title: Text('')),
          BottomNavigationBarItem(icon: Icon(Icons.settings), title: Text('')),
        ],
      ),
      backgroundColor: Colors.white,
    );
  }

  Widget buildBody(BuildContext context, Size size) {
    return Stack(
      children: <Widget>[
        Stack(
          children: <Widget>[
            Column(
              children: <Widget>[
                Container(
                  height: 50,
                  width: size.width,
                  color: primaryColor,
                ),
                CurvePaint(),
              ],
            ),
            Positioned.fill(
              top: 40,
              child: Column(
                children: <Widget>[
                  Image.asset(
                    'assets/ic_tb.png',
                    height: 60,
                  ),
                ],
              ),
            ),
          ],
        ),
        Positioned(
          width: size.width,
          bottom: 20,
          child: Column(
            children: <Widget>[
              Image.asset(
                'assets/ic_smile.png',
                height: 200,
              ),
              SizedBox(height: 40),
              Text(
                'Yeay data Mums telah tersimpan!\nPantau terus aplikasi Teman Bumil\nini Mums untuk mengetahui\ninformasi-informasi penting!',
                style: TextStyle(
                    color: Colors.deepPurple.withOpacity(0.5), fontSize: 20),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 100),
            ],
          ),
        ),
        Container(
          height: size.height,
          width: size.width,
          child: Rendering(
            startTime: Duration(seconds: 10),
            onTick: _simulateParticles,
            startTimeSimulationTicks: 1,
            builder: (context, time) {
              return ParticleItem(particles, time);
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
