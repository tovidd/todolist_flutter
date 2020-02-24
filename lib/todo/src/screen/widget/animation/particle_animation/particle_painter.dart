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
      final position = Offset(
        animation["x"] * size.width,
        animation["y"] * size.height,
      );
      canvas.drawCircle(position, size.width * 0.2 * particle.size, paint);

      var path = Path();
      var x = animation["x"];
      var y = animation["y"];
      path.moveTo(size.width * x / 3, size.height * y * 3 / 4);
      path.lineTo(size.width * x / 2, size.height * y * 5 / 6);
      path.lineTo(size.width * x * 3 / 4, size.height * y * 4 / 6);
      path.close();
      canvas.drawPath(path, paint);
    });
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
