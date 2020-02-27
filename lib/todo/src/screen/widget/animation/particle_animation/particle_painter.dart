import 'package:flutter/material.dart';
import 'particle_model.dart';

class ParticlePainter extends CustomPainter {
  final List<ParticleModel> particles;
  final Duration time;

  ParticlePainter(this.particles, this.time);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..color = Colors.white.withAlpha(70);

    particles.forEach((particle) {
      var progress = particle.animationProgress.progress(time);
      final animation = particle.tween.transform(progress);
      var x = animation["x"];
      var y = animation["y"];
      final position = Offset(x * size.width, y * size.height);
      canvas.drawCircle(position, size.width * 0.2 * particle.size, paint);

      var path = Path()
        ..moveTo(size.width * x / 3, size.height * y * 3 / 4)
        ..lineTo(size.width * x / 2, size.height * y * 5 / 6)
        ..lineTo(size.width * x * 3 / 4, size.height * y * 4 / 6)
        ..close();
      canvas.drawPath(path, paint);

      path = Path()
        ..moveTo(size.width * x / 4, size.height * y / 4)
        ..lineTo(size.width * x / 2, size.height * y / 4)
        ..lineTo(size.width * x / 3, size.height * y / 3)
        ..lineTo(size.width * x / 4, size.height * y / 3)
        ..close();
      canvas.drawPath(path, paint);

      heart(canvas, size, position);
    });
  }

  void heart(Canvas canvas, Size size, Offset position) {
    Paint paint = Paint();
    paint
      ..color = Colors.black
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 6;

    Paint paint1 = Paint();
    paint1
      ..color = Colors.red
      ..style = PaintingStyle.fill
      ..strokeWidth = 0;

    double width = size.width;
    double height = size.height;

    Path path = Path();
    path.moveTo(0.5 * width, height * 0.35);
    path.cubicTo(0.2 * width, height * 0.1, -0.25 * width, height * 0.4,
        0.5 * width, height * 0.8);
    path.moveTo(0.5 * width, height * 0.35);
    path.cubicTo(0.8 * width, height * 0.1, 1.25 * width, height * 0.4,
        0.5 * width, height * 0.8);

    canvas.drawPath(path, paint1);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
