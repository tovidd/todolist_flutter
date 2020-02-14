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

//  final height = window.physicalSize.height;
//  final width = window.physicalSize.width;

  @override
  void initState() {
    super.initState();

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

    tween2 = Tween<double>(begin: 400, end: 100);
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
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50.0),
        child: AppBar(
          title: Text('Privacy Policy'),
        ),
      ),
      body: buildBody(context),
      backgroundColor: Colors.deepPurpleAccent,
    );
  }

  Widget buildBody(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Container(
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Positioned(
            width: width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                CustomPaint(
                  foregroundPainter: CurvePainter(),
                  child: Container(
                    width: width,
                    height: (height - (height - 150)),
                  ),
                ),
                Container(
                  height: isStart ? 400 : (height - (25 + 50 + 100 + 150)),
                  width: width,
                  child: ListView(
                    children: <Widget>[
                      container(context),
                    ],
                  ),
                ),
              ],
            ),
            top: animation2.value,
            bottom: 0.0,
          ),
        ],
        textDirection: TextDirection.ltr,
      ),
    );
  }

  Widget container(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Container(
      padding: EdgeInsets.only(left: 16, bottom: 16, right: 16),
      color: Colors.grey[200],
      child: Column(
        children: <Widget>[
          card(balance: 1250.00, title: 'Balance this month', progress: 0.75),
          SizedBox(
            height: 20,
          ),
          card(balance: 274.00, title: 'Monthly change', progress: 0.10),
          SizedBox(
            height: 20,
          ),
          Stack(
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(left: width * 0.00),
                child: wallet(
                  context: context,
                  lebar: 0.47,
                  tinggi: 80,
                  marginKanan: 30,
                ),
              ),
              Positioned(
                right: 0.0,
                child: bankAccount(
                  context: context,
                  lebar: 0.47,
                  tinggi: 80,
                  marginKiri: 30,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          upgradeYourAccount(),
        ],
      ),
    );
  }

  Widget card({double balance, String title, double progress}) {
    return Card(
      child: Container(
        padding: EdgeInsets.all(16),
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  '\$' + balance.toStringAsFixed(2),
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
                Text(
                  'Limit',
                  style: TextStyle(color: Colors.grey, fontSize: 16),
                )
              ],
            ),
            SizedBox(
              height: 20,
            ),
            LinearProgressIndicator(
              value: progress,
              backgroundColor: Colors.grey[200],
              valueColor: progress > 0.5
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
                  title,
                  style: TextStyle(color: Colors.grey, fontSize: 16),
                ),
                Icon(
                  Icons.keyboard_arrow_right,
                  color: Colors.grey,
                  size: 20,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget upgradeYourAccount() {
    return Card(
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
                width: 10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'Upgrade your account',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 16),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    'Create your budget connect your account',
                    style: TextStyle(color: Colors.white, fontSize: 12),
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
    );
  }

  Widget wallet(
      {BuildContext context, double lebar, double tinggi, double marginKanan}) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Container(
      color: Colors.transparent,
      padding: EdgeInsets.all(4.0),
      child: Row(
        children: <Widget>[
          CustomPaint(
            painter: ParallelogramPainter(),
            child: Container(
              color: Colors.transparent,
              width: width * lebar,
              height: (height - (height - tinggi)),
              child: Container(
                padding: EdgeInsets.only(
                    left: 8, top: 8, bottom: 8, right: marginKanan),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Icon(
                      Icons.account_balance_wallet,
                      color: Colors.white,
                      size: 20,
                    ),
                    Text(
                      'Manage your budget !',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          'WALLET',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 14),
                        ),
                        Icon(
                          Icons.add_circle_outline,
                          color: Colors.white,
                          size: 20,
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget bankAccount(
      {BuildContext context, double lebar, double tinggi, double marginKiri}) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Container(
      color: Colors.transparent,
      padding: EdgeInsets.all(4.0),
      child: Row(
        children: <Widget>[
          CustomPaint(
            painter: ParallelogramPainter2(),
            child: Container(
              color: Colors.transparent,
              width: width * lebar,
              height: (height - (height - tinggi)),
              child: Container(
                padding: EdgeInsets.only(
                    left: marginKiri, top: 8, bottom: 8, right: 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Icon(
                      Icons.lock_outline,
                      color: Colors.white,
                      size: 20,
                    ),
                    Text(
                      'Create new budget !',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          'BANK ACCOUNT',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 14),
                        ),
                        Icon(
                          Icons.add_circle_outline,
                          color: Colors.white,
                          size: 20,
                        )
                      ],
                    )
                  ],
                ),
              ),
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
    paint.color = Colors.grey[200];
    paint.style = PaintingStyle.fill; // Change this to fill

    var path = Path();

    path.moveTo(0.0, size.height);
    path.lineTo(0.0, size.height * 0.45);
    path.quadraticBezierTo(size.width * 0.15, size.height * 0,
        size.width * 0.25, size.height * 0.65);
    path.quadraticBezierTo(size.width * 0.30, size.height * 0.52,
        size.width * 0.35, size.height * 0.65);
    path.quadraticBezierTo(size.width * 0.40, size.height * 0.40,
        size.width * 0.45, size.height * 0.65);
    path.quadraticBezierTo(size.width * 0.55, size.height * 0.10,
        size.width * 0.70, size.height * 0.50);
    path.quadraticBezierTo(size.width * 0.80, size.height * 0.20,
        size.width * 0.85, size.height * 0.50);
    path.quadraticBezierTo(
        size.width * 0.85, size.height * 0.00, size.width, size.height * 0.20);
    path.lineTo(size.width, size.height);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}

class ParallelogramPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint();
    paint.color = Colors.lightBlueAccent[700];
    paint.style = PaintingStyle.fill; // Change this to fill

    var path = Path();

    path.moveTo(0.00, 0.00);
    path.lineTo(size.width, 0.00);
    path.lineTo(size.width * 0.85, size.height);
    path.lineTo(0.00, size.height);
    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}

class ParallelogramPainter2 extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint();
    paint.color = Colors.greenAccent[700];
    paint.style = PaintingStyle.fill; // Change this to fill

    var path = Path();

    path.moveTo(size.width * 0.15, 0.00);
    path.lineTo(0.00, size.height);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0.00);
    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
