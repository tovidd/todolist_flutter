import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:todolist/todo/src/resource/constant/constant.dart';

import 'progress_indicator/liquid_custom_progress_indicator.dart';
import '../../../bloc/tb/kehamilan/kehamilan_bloc.dart';
import '../../../bloc/tb/kehamilan/kehamilan_provider.dart';

class KehamilanScreen extends StatelessWidget {
  static const routeName = '/kehamilan';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Screen'),
      ),
      body: buildBody(context),
    );
  }

  Widget buildBody(BuildContext context) {
    KehamilanBloc bloc = KehamilanProvider.of(context);
    bloc.reset();

    return Container(
      child: Center(
        child: RaisedButton(
          child: Text('Pop up'),
          color: Colors.pinkAccent,
          onPressed: () {
            popUp(context, bloc);
          },
        ),
      ),
    );
  }

  void popUp(BuildContext context, KehamilanBloc bloc) {
    var size = MediaQuery.of(context).size;

    Widget space() {
      return SizedBox(
        height: 20,
      );
    }

    Widget close(BuildContext context) {
      return Align(
        alignment: Alignment(1.05, -1.05),
        child: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Container(
            decoration: BoxDecoration(
              color: Constant.sliderColor,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Icon(
              Icons.close,
              size: 30,
              color: Colors.white,
            ),
          ),
        ),
      );
    }

    Future<Null> _selectDate(BuildContext context) async {
      DateTime selectedDate = DateTime.now();

      DateTime picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime.now().subtract(Duration(days: 365 * 10)),
        lastDate: DateTime.now().add(Duration(days: 365 * 10)),
      );

      if (picked == null) {
        picked = selectedDate;
      }
      bloc.addDateValue(DateFormat('EEE, d MMM yyyy')
          .format(DateTime.parse(picked.toString()))
          .toString());
    }

    Widget klikDanTentukanTanggal() {
      Color unSelectColor = Colors.grey[400];
      Color selectedColor = Colors.black;
      return Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Hari Perkiraan Lahir',
              style: TextStyle(
                fontSize: 15,
                color: Colors.blueAccent[200],
              ),
            ),
            SizedBox(
              height: 5,
            ),
            StreamBuilder(
                stream: bloc.dateValue,
                builder: (context, snapshot) {
                  return GestureDetector(
                    onTap: () => _selectDate(context),
                    child: Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey,
                            blurRadius: 1.0,
                            spreadRadius: 1.0,
                            offset: Offset(
                              0.0,
                              2.0,
                            ),
                          ),
                        ],
                        borderRadius: BorderRadius.circular(5),
                        color: Colors.grey[200],
                      ),
                      child: Row(
                        children: <Widget>[
                          Icon(
                            Icons.date_range,
                            color: !snapshot.hasData
                                ? unSelectColor
                                : selectedColor,
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Expanded(
                            flex: 1,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Text(
                                  !snapshot.hasData
                                      ? 'Klik & tentukan tanggal'
                                      : snapshot.data,
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                    color: !snapshot.hasData
                                        ? unSelectColor
                                        : selectedColor,
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                ),
                                GestureDetector(
                                  onTap: () {
                                    bloc.addDateValue(null);
                                  },
                                  child: Icon(
                                    Icons.close,
                                    size: 30,
                                    color: !snapshot.hasData
                                        ? unSelectColor
                                        : selectedColor,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                }),
          ],
        ),
      );
    }

    Widget heart() {
      return Container(
        child: _AnimatedLiquidCustomProgressIndicator(
          max: 40.0,
        ),
      );
    }

    Widget buttonSimpan() {
      return SizedBox(
        width: double.infinity,
        child: StreamBuilder(
            stream: bloc.dateValue,
            builder: (context, snapshot) {
              return RaisedButton(
                elevation: 5,
                color: Colors.blue,
                padding: EdgeInsets.only(
                  top: 20,
                  bottom: 20,
                ),
                disabledColor: Colors.blue[100],
                child: Text(
                  'SIMPAN',
                  style: TextStyle(color: Colors.white, letterSpacing: 2.0),
                ),
                onPressed:
                    !snapshot.hasData ? null : () => Navigator.pop(context),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              );
            }),
      );
    }

    Widget body(BuildContext context) {
      return StreamBuilder(
        stream: bloc.dateValue,
        builder: (context, snapshot) {
          return Container(
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.white,
            ),
            child: ListView(
              children: <Widget>[
                Center(
                  child: Text(
                    'DATA',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 25,
                        letterSpacing: 2),
                  ),
                ),
                space(),
                Center(
                  child: CrazySwitch(),
                ),
                space(),
                klikDanTentukanTanggal(),
                space(),
//                !snapshot.hasData ? Container() : slider(),
                !snapshot.hasData
                    ? Container()
                    : Container(
                        height: 200,
                        child: Carroussel(bloc),
                      ),
                !snapshot.hasData ? Container() : heart(),
                !snapshot.hasData ? Container() : space(),
                buttonSimpan(),
                space(),
              ],
            ),
          );
        },
      );
    }

    Dialog dialog = Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Container(
        child: Stack(
          fit: StackFit.loose,
          children: <Widget>[
            body(context),
            close(context),
          ],
        ),
      ),
    );

    showDialog(
      context: context,
      builder: (context) => dialog,
      barrierDismissible: false,
    );
  }
}

class CrazySwitch extends StatefulWidget {
  @override
  _CrazySwitchState createState() => _CrazySwitchState();
}

class _CrazySwitchState extends State<CrazySwitch>
    with SingleTickerProviderStateMixin {
  bool isChecked = false;
  Duration _duration = Duration(milliseconds: 370);
  Animation<Alignment> _animation;
  AnimationController _animationController;

  @override
  void initState() {
    super.initState();

    _animationController =
        AnimationController(vsync: this, duration: _duration);

    _animation =
        AlignmentTween(begin: Alignment.centerLeft, end: Alignment.centerRight)
            .animate(
      CurvedAnimation(
          parent: _animationController,
          curve: Curves.bounceOut,
          reverseCurve: Curves.bounceIn),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animationController,
      builder: (context, child) {
        return Container(
          width: 200,
          height: 50,
          decoration: BoxDecoration(
            color: Constant.sliderColor,
            borderRadius: BorderRadius.all(
              Radius.circular(40),
            ),
            border: Border.all(color: Colors.grey[700], width: 3.0),
            boxShadow: [
              BoxShadow(color: Colors.grey, blurRadius: 4, offset: Offset(0, 2))
            ],
          ),
          child: Stack(
            children: <Widget>[
              Align(
                alignment: _animation.value,
                child: GestureDetector(
                  onPanUpdate: (details) {
                    if (details.delta.dx > 0 && isChecked == false) {
                      setState(() {
                        _animationController.forward();
                        isChecked = !isChecked;
                        print(details.delta.dx);
                      });
                    } else if (details.delta.dx < 0 && isChecked == true) {
                      setState(() {
                        _animationController.reverse();
                        isChecked = !isChecked;
                      });
                    }
                  },
                  onTap: () {
                    setState(() {
                      if (_animationController.isCompleted) {
                        _animationController.reverse();
                      } else {
                        _animationController.forward();
                      }

                      isChecked = !isChecked;
                    });
                  },
                  child: Container(
                    width: 100,
                    height: 50,
                    decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(40),
                      border: Border.all(color: Colors.grey[700], width: 1.0),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.grey[800],
                            blurRadius: 1,
                            spreadRadius: 0,
                            offset: Offset(isChecked ? -2 : 2, 0)),
                      ],
                    ),
                    child: Center(
                      child: Text(
                        isChecked ? 'HPHT' : 'HPL',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, letterSpacing: 2.0),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class _AnimatedLiquidCustomProgressIndicator extends StatefulWidget {
  double max;

  _AnimatedLiquidCustomProgressIndicator({this.max});

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
    KehamilanBloc bloc = KehamilanProvider.of(context);

    return Container(
      child: Column(
        children: <Widget>[
          StreamBuilder(
            stream: bloc.sliderValue,
            builder: (context, AsyncSnapshot<double> snapshot) {
              if (snapshot.hasData) {
                return Stack(
                  children: <Widget>[
                    LiquidCustomProgressIndicator(
                      direction: Axis.vertical,
                      backgroundColor: Colors.blue,
                      shapePath: _buildHeartPath(),
                      center: Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              Color(0xFF9DB7ED),
                              Color(0xFFB68DC3),
                            ],
                          ),
                        ),
                      ),
                    ),
                    LiquidCustomProgressIndicator(
                      value: (snapshot.data / this.widget.max) - 0.20,
                      direction: Axis.vertical,
                      backgroundColor: Colors.transparent,
                      valueColor: AlwaysStoppedAnimation(Color(0xFFF8798A)),
                      shapePath: _buildHeartStrokeBound(),
                    ),
                  ],
                );
              }
              return Container();
            },
          ),
        ],
      ),
    );
  }

//  Path _buildHeartPath2() {
//    return Path()
//      ..moveTo(55, 15)
//      ..cubicTo(55, 12, 50, 0, 30, 0)
//      ..cubicTo(0, 0, 0, 37.5, 0, 37.5)
//      ..cubicTo(0, 55, 20, 77, 55, 95)
//      ..cubicTo(90, 77, 110, 55, 110, 37.5)
//      ..cubicTo(110, 37.5, 110, 0, 80, 0)
//      ..cubicTo(65, 0, 55, 12, 55, 15)
//      ..close();
//  }

  // heart
  Path _buildHeartPath() {
    return Path()
      ..moveTo(50, 45)
      ..cubicTo(20, 10, -45, 60, 50, 125)
      ..moveTo(50, 45)
      ..cubicTo(80, 10, 145, 60, 50, 125)
      ..close();
  }

  // heart stroke
  Path _buildHeartStrokeBound() {
    return Path()
      ..moveTo(50, 58)
      ..cubicTo(33, 10, -43, 60, 50, 117)
      ..moveTo(50, 58)
      ..cubicTo(67, 10, 143, 60, 50, 117)
      ..close();
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

class Carroussel extends StatelessWidget {
  KehamilanBloc bloc;

  Carroussel(@required this.bloc);

  PageController pageController;

//  int currentpage = 0;

  @override
  Widget build(BuildContext context) {
    double _viewportFraction = 1 / 8;
    return StreamBuilder(
      stream: this.bloc.sliderValue,
      builder: (context, AsyncSnapshot<double> snapshot) {
        if (snapshot.hasData) {
          pageController = PageController(
            initialPage: snapshot.data.toInt(),
            keepPage: true,
            viewportFraction: _viewportFraction,
          );

          return Center(
            child: Container(
              color: Colors.transparent,
              child: PageView.builder(
                itemCount: 40,
                onPageChanged: (value) {
                  this.bloc.addSliderValue(value.toDouble());
                },
                controller: pageController,
                itemBuilder: (context, index) => angka(index + 1, snapshot),
                physics: ScrollPhysics(),
              ),
            ),
          );
        }
        return Container();
      },
    );
  }

  angka(int index, AsyncSnapshot<double> snapshot) {
    return AnimatedBuilder(
      animation: pageController,
      builder: (context, child) {
        double value = 1.0;
        if (pageController.position.haveDimensions) {
          value = pageController.page - index;
          value = (1 - (value.abs() * .5)).clamp(0.0, 1.0);
        }
        return Container(
          alignment: Alignment.center,
          child: child,
        );
      },
      child: Center(
        child: snapshot.data.toInt() == index
            ? Container(
                margin: EdgeInsets.only(top: 90),
                child: CircleAvatar(
                  radius: 55,
                  backgroundColor: Colors.blue,
                  child: Text(
                    (index).toString(),
                    style: TextStyle(
                      fontSize: 25,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              )
            : GestureDetector(
                onTap: () {
                  this.bloc.addSliderValue(index.toDouble());
                },
                child: Container(
                  margin: EdgeInsets.only(
                    top: index == (snapshot.data.toInt() - 2) ||
                            index == (snapshot.data.toInt() + 2)
                        ? 30
                        : index == (snapshot.data.toInt() - 1) ||
                                index == (snapshot.data.toInt() + 1)
                            ? 60
                            : 0,
                  ),
                  child: CircleAvatar(
                    backgroundColor: Colors.transparent,
                    child: Text(
                      (index).toString(),
                      style: TextStyle(
                        fontSize: 15,
                        color: index == (snapshot.data.toInt() - 2) ||
                                index == (snapshot.data.toInt() + 2)
                            ? Colors.grey[400]
                            : index == (snapshot.data.toInt() - 1) ||
                                    index == (snapshot.data.toInt() + 1)
                                ? Colors.grey[600]
                                : Colors.grey[300],
                      ),
                    ),
                  ),
                ),
              ),
      ),
    );
  }
}
