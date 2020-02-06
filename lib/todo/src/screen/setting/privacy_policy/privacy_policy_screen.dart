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
  GlobalKey cloudKey = GlobalKey();
  final height = window.physicalSize.height;
  final width = window.physicalSize.width;

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

    tween2 = Tween<double>(begin: height, end: height - (height - 100));
    controller2 = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 600),
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
//    return MaterialApp(
//      title: 'Drawing Paths',
//      home: Container(
//        color: Colors.white,
//        child: CustomPaint(
//          painter: CurvePainter(),
//        ),
//      ),
//    );

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50.0),
        child: AppBar(
          title: Text('Privacy Policy'),
        ),
      ),
      body: buildBody(context),
    );
  }

  Widget buildBody(BuildContext context) {
    return Container(
      color: Colors.deepPurpleAccent,
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
//          Positioned(
//            child: Material(
//              child: Icon(
//                  isArrive ? Icons.accessibility : Icons.accessible_forward,
//                  textDirection: TextDirection.ltr,
//                  size: 80.0),
//              color: Colors.transparent,
//            ),
//            left: animation.value, // Animated value
//            top: 30.0, // Fixed value
//          ),
//          Positioned(
//            child: isArrive
//                ? Text(
//                    'HA HA HA',
//                    style: TextStyle(fontSize: 30),
//                  )
//                : Text(
//                    'WK WK WK',
//                    style: TextStyle(fontSize: 30),
//                  ),
//            right: animation.value,
//            top: 100,
//          ),
          Positioned(
            width: window.physicalSize.width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Container(
                  child: Image.asset(
                    'assets/ic_cloud.png',
                    height: height - (height - 150),
                    color: Colors.grey[200],
                    fit: BoxFit.cover,
                  ),
                ),
                Container(
                  color: Colors.grey[200],
                  height: height - (25 + 50 + 100 + 150),
                  width: width,
                  child: ListView(
                    children: <Widget>[
                      container(),
                    ],
                  ),
                ),
              ],
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

    path.moveTo(0.0, size.height);
    path.lineTo(0.0, size.height * 0.95);
    path.quadraticBezierTo(size.width * 0.15, size.height * 0.85,
        size.width * 0.25, size.height * 0.95);
    path.quadraticBezierTo(size.width * 0.30, size.height * 0.92,
        size.width * 0.35, size.height * 0.95);
    path.quadraticBezierTo(size.width * 0.40, size.height * 0.90,
        size.width * 0.45, size.height * 0.95);
    path.quadraticBezierTo(size.width * 0.55, size.height * 0.90,
        size.width * 0.70, size.height * 0.95);
    path.quadraticBezierTo(size.width * 0.80, size.height * 0.90,
        size.width * 0.85, size.height * 0.95);
    path.quadraticBezierTo(
        size.width * 0.85, size.height * 0.90, size.width, size.height * 0.87);
    path.lineTo(size.width, size.height);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
