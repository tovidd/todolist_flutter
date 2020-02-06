import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';

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
  bool isArrive = false, isStart = true;
  GlobalKey cloudKey = GlobalKey();
  final height = window.physicalSize.height;
  final width = window.physicalSize.width;

  @override
  void initState() {
    super.initState();
    print(window.physicalSize.height);

    tween = Tween<double>(begin: 0, end: 500);
    controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 6),
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

    tween2 = Tween<double>(begin: height - 600, end: height - (height - 100));
    controller2 = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 800),
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
          isStart = false;
//          controller2.reverse();
        } else if (status == AnimationStatus.dismissed) {
          isStart = true;
          controller2.forward();
          print('finish');
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
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Container(
            height: height,
            width: width,
            color: Colors.deepPurpleAccent,
            child: Container(
              width: width,
              color: Colors.grey[200],
              margin: EdgeInsets.only(top: 500),
            ),
          ),
          Positioned(
            width: window.physicalSize.width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Container(
                  child: Image.asset(
                    'assets/ic_cloud.png',
                    height: (height - (height - 150)),
                    color: Colors.grey[200],
                    fit: BoxFit.cover,
                  ),
                ),
                Container(
                  color: Colors.grey[200],
                  height: isStart ? 400 : (height - (25 + 50 + 100 + 150)),
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
          ),
          Positioned(
            child: isArrive
                ? Container()
                : Image.asset(
                    'assets/ic_bird.gif',
                    height: 100,
                  ),
            right: animation.value,
            top: 150,
          ),
        ],
        textDirection: TextDirection.ltr,
      ),
    );
  }

  Widget container() {
    return Container(
      padding: EdgeInsets.only(left: 16, bottom: 16, right: 16),
      child: Column(
        children: <Widget>[
          Card(
            child: Container(
              padding: EdgeInsets.all(16),
              child: Column(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        '\$1250.00',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 25),
                      ),
                      Text(
                        'Limit',
                        style: TextStyle(color: Colors.grey, fontSize: 20),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  LinearProgressIndicator(
                    value: 0.75,
                    backgroundColor: Colors.grey[200],
                    valueColor: 0.75 > 0.5
                        ? AlwaysStoppedAnimation<Color>(Colors.green)
                        : AlwaysStoppedAnimation<Color>(Colors.red),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        'Balance this month',
                        style: TextStyle(color: Colors.grey, fontSize: 20),
                      ),
                      Icon(
                        Icons.keyboard_arrow_right,
                        color: Colors.grey,
                        size: 30,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Card(
            child: Container(
              padding: EdgeInsets.all(16),
              child: Column(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        '\$274.00',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 25),
                      ),
                      Text(
                        'Limit',
                        style: TextStyle(color: Colors.grey, fontSize: 20),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  LinearProgressIndicator(
                    value: 0.1,
                    backgroundColor: Colors.grey[200],
                    valueColor: 0.1 > 0.5
                        ? AlwaysStoppedAnimation<Color>(Colors.green)
                        : AlwaysStoppedAnimation<Color>(Colors.red),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        'Monthly change',
                        style: TextStyle(color: Colors.grey, fontSize: 20),
                      ),
                      Icon(
                        Icons.keyboard_arrow_right,
                        color: Colors.grey,
                        size: 30,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Card(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(50),
              child: Container(
                padding: EdgeInsets.all(8),
                color: Colors.deepPurpleAccent,
                child: Row(
                  children: <Widget>[
                    Icon(
                      Icons.nature,
                      color: Colors.white,
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          'Upgrade your account',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 20),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          'Create your budget connect your account',
                          style: TextStyle(color: Colors.white, fontSize: 15),
                        ),
                      ],
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Expanded(
                      flex: 1,
                      child: RaisedButton(
                        color: Colors.white,
                        onPressed: () {},
                        child: Text(
                          'GET',
                          style: TextStyle(
                              color: Colors.deepPurpleAccent, letterSpacing: 2),
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            shape: StadiumBorder(
              side: BorderSide(
                color: Colors.transparent,
                width: 0.0,
              ),
            ),
          ),
          CustomPaint(
            painter: TriangleClipper(),
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

class TriangleClipper extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint();
    paint.color = Colors.green[800];
    paint.style = PaintingStyle.fill; // Change this to fill

    var path = Path();

    path.lineTo(size.width, 0.0);
    path.lineTo(size.width / 2, size.height);
    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
