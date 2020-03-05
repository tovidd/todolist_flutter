import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'custom/liquid_progress_indicator.dart';

class CustomLiquidProgressIndicator extends StatelessWidget {
  static const routeName = '/custom_liquid_progress_indicator';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(CustomLiquidProgressIndicator.routeName),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          _AnimatedLiquidCustomProgressIndicator(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              LiquidCustomProgressIndicator(
                direction: Axis.vertical,
                value: 0.2,
                shapePath: _buildBoatPath(),
              ),
              LiquidCustomProgressIndicator(
                direction: Axis.horizontal,
                backgroundColor: Colors.grey[300],
                valueColor: AlwaysStoppedAnimation(Colors.red),
                shapePath: _buildSpeechBubblePath(),
              ),
            ],
          )
        ],
      ),
      backgroundColor: Colors.grey,
    );
  }

  Path _buildBoatPath() {
    return Path()
      ..moveTo(15, 120)
      ..lineTo(0, 85)
      ..lineTo(50, 85)
      ..lineTo(50, 0)
      ..lineTo(105, 80)
      ..lineTo(60, 80)
      ..lineTo(60, 85)
      ..lineTo(120, 85)
      ..lineTo(105, 120)
      ..close();
  }

  Path _buildSpeechBubblePath() {
    return Path()
      ..moveTo(50, 0)
      ..quadraticBezierTo(0, 0, 0, 37.5)
      ..quadraticBezierTo(0, 75, 25, 75)
      ..quadraticBezierTo(25, 95, 5, 95)
      ..quadraticBezierTo(35, 95, 40, 75)
      ..quadraticBezierTo(100, 75, 100, 37.5)
      ..quadraticBezierTo(100, 0, 50, 0)
      ..close();
  }
}

class _AnimatedLiquidCustomProgressIndicator extends StatefulWidget {
  @override
  State<StatefulWidget> createState() =>
      _AnimatedLiquidCustomProgressIndicatorState();
}

class _AnimatedLiquidCustomProgressIndicatorState
    extends State<_AnimatedLiquidCustomProgressIndicator>
    with SingleTickerProviderStateMixin {
  AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 10),
    );

    _animationController.addListener(() => setState(() {}));
    _animationController.repeat();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final percentage = _animationController.value * 100;
    return Container(
      child: Column(
        children: <Widget>[
          Stack(
            children: <Widget>[
              Container(
                color: Colors.lightBlueAccent,
                child: LiquidCustomProgressIndicator(
                  direction: Axis.vertical,
                  backgroundColor: Colors.transparent,
                  shapePath: _buildHeartPath(),
                  center: Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [Color(0xFF9DB7ED), Color(0xFFB68DC3)],
                      ),
                    ),
                  ),
                ),
              ),
              LiquidCustomProgressIndicator(
                value: _animationController.value,
                direction: Axis.vertical,
                backgroundColor: Colors.transparent,
                valueColor: AlwaysStoppedAnimation(Color(0xFFF8798A)),
                shapePath: _buildHeartPath(),
                center: Text(
                  "${percentage.toStringAsFixed(0)}%",
                  style: TextStyle(
                    color: Colors.lightGreenAccent,
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Stack(
            children: <Widget>[
              LiquidCustomProgressIndicator(
                direction: Axis.vertical,
                backgroundColor: Colors.transparent,
                shapePath: _buildHeartPath2(),
                center: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [Color(0xFF9DB7ED), Color(0xFFB68DC3)]),
                  ),
                ),
              ),
              LiquidCustomProgressIndicator(
                value: _animationController.value,
                direction: Axis.vertical,
                backgroundColor: Colors.transparent,
                valueColor: AlwaysStoppedAnimation(Color(0xFFF8798A)),
                shapePath: _buildHeartStrokeBound(),
              ),
              CustomPaint(
                painter: HeartStrokePainter(
                  path: _buildHeartStrokeBound(),
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Path _buildHeartPath() {
    return Path()
      ..moveTo(55, 15)
      ..cubicTo(55, 12, 50, 0, 30, 0)
      ..cubicTo(0, 0, 0, 37.5, 0, 37.5)
      ..cubicTo(0, 55, 20, 77, 55, 95)
      ..cubicTo(90, 77, 110, 55, 110, 37.5)
      ..cubicTo(110, 37.5, 110, 0, 80, 0)
      ..cubicTo(65, 0, 55, 12, 55, 15)
      ..close();
  }

  // heart
  Path _buildHeartPath2() {
    return Path()
      ..moveTo(50, 45)
      ..cubicTo(20, 10, -45, 60, 50, 125)
      ..moveTo(50, 45)
      ..cubicTo(80, 10, 145, 60, 50, 125);
  }

  // heart stroke
  Path _buildHeartStrokeBound() {
    return Path()
      ..moveTo(50, 58)
      ..cubicTo(33, 10, -43, 60, 50, 117)
      ..moveTo(50, 58)
      ..cubicTo(67, 10, 143, 60, 50, 117);
  }
}

class HeartStrokePainter extends CustomPainter {
  Path path;
  Color color;

  HeartStrokePainter({this.path, this.color});

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint();
    paint
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 1;
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
