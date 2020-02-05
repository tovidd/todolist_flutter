import 'package:flutter/material.dart';
import 'dart:ui';

class PrivacyPolicyScreen extends StatefulWidget {
  static const routeName = '/privacy_policy';

  @override
  _PrivacyPolicyScreenState createState() => _PrivacyPolicyScreenState();
}

class _PrivacyPolicyScreenState extends State<PrivacyPolicyScreen>
    with TickerProviderStateMixin {
  Animation<double> animation, animation2;
  AnimationController controller, controller2;
  Tween tween, tween2;
  bool isArrive = false, isArrive2 = false;

  @override
  void initState() {
    super.initState();
    print(window.physicalSize.height);

    tween = Tween<double>(begin: 0, end: 400);
    controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    );
    animation = tween.animate(controller);
    animation.addListener(
      () {
        setState(() {});
      },
    );
    animation.addStatusListener(
      (status) {
        if (status == AnimationStatus.completed) {
          isArrive = true;
          controller.reverse();
        } else if (status == AnimationStatus.dismissed) {
          isArrive = false;
          controller.forward();
        }
      },
    );
    controller.forward();

    tween2 = Tween<double>(begin: 800, end: 300);
    controller2 = AnimationController(
      vsync: this,
      duration: Duration(seconds: 5),
    );
    animation2 = tween2.animate(controller2);
    animation2.addListener(
      () {
        setState(() {});
      },
    );
    animation2.addStatusListener(
      (status) {
        if (status == AnimationStatus.completed) {
//          isArrive2 = true;
//          controller2.reverse();
        } else if (status == AnimationStatus.dismissed) {
          isArrive2 = false;
          controller2.forward();
        }
      },
    );
    controller2.forward();
  }

  @override
  void dispose() {
    controller.dispose();
    controller2.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Drawing Paths',
      home: Container(
        color: Colors.white,
        child: CustomPaint(
          painter: CurvePainter(),
        ),
      ),
    );

    return Scaffold(
      appBar: AppBar(
        title: Text('Privacy Policy'),
      ),
//      body: buildBody(context),
      body: buildBody(context),
    );
  }

  Widget buildBody(BuildContext context) {
    return Container(
      color: Colors.yellowAccent,
      child: Stack(
        children: <Widget>[
          Positioned(
            child: Material(
              child: Icon(
                  isArrive ? Icons.accessibility : Icons.accessible_forward,
                  textDirection: TextDirection.ltr,
                  size: 80.0),
              color: Colors.transparent,
            ),
            left: animation.value, // Animated value
            top: 30.0, // Fixed value
          ),
          Positioned(
            child: isArrive
                ? Text(
                    'HA HA HA',
                    style: TextStyle(fontSize: 30),
                  )
                : Text(
                    'WK WK WK',
                    style: TextStyle(fontSize: 30),
                  ),
            right: animation.value,
            top: 100,
          ),
          Positioned(
            child: Container(
              color: Colors.pinkAccent,
              height: 400,
              width: MediaQuery.of(context).size.width,
              child: ListView(
                children: <Widget>[
                  container(),
                ],
              ),
            ),
            top: animation2.value,
            bottom: 0.0,
          )
        ],
        textDirection: TextDirection.ltr,
      ),
    );
  }

  Widget container() {
    return Container(
      padding: EdgeInsets.all(16),
      child: Column(
        children: <Widget>[
          TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'Enter your email',
            ),
          ),
          SizedBox(
            height: 20,
          ),
          TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'Enter your username',
            ),
          ),
          SizedBox(
            height: 20,
          ),
          TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'Enter your password',
            ),
          ),
          SizedBox(
            height: 20,
          ),
          CustomPaint(
            painter: CurvePainter(),
          ),
        ],
      ),
    );
  }
}

class CurvePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint();
    paint.color = Colors.green[800];
    paint.style = PaintingStyle.fill; // Change this to fill

    var path = Path();

    path.moveTo(0, size.height * 0.25);
    path.quadraticBezierTo(
        size.width / 2, size.height / 2, size.width, size.height * 0.25);
    path.lineTo(size.width, 0);
    path.lineTo(0, 0);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
