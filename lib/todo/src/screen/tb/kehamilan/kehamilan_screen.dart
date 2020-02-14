import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'progress_indicator/liquid_custom_progress_indicator.dart';

import '../../../resource/constant.dart';
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
                                    fontSize: 20,
                                    color: !snapshot.hasData
                                        ? unSelectColor
                                        : selectedColor,
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    bloc.addDateValue(null);
                                  },
                                  child: Icon(
                                    Icons.close,
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

    Widget slider() {
      return Column(
        children: <Widget>[
          StreamBuilder(
            stream: bloc.sliderValue,
            builder: (context, snapshot) {
              return Column(
                children: <Widget>[
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: Slider(
                      activeColor: Colors.indigoAccent,
                      min: 0.0,
                      max: 36.0,
                      onChanged: (val) {
                        bloc.addSliderValue(val);
                      },
                      value: !snapshot.hasData ? 0.0 : snapshot.data,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text('0'),
                      Text('36'),
                    ],
                  ),
                ],
              );
            },
          ),
          SizedBox(
            height: 50,
          )
        ],
      );
    }

    Widget heart() {
      return Container(
        child: _AnimatedLiquidCustomProgressIndicator(
          max: 36.0,
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
            child: Column(
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
                !snapshot.hasData ? Container() : slider(),
                !snapshot.hasData ? Container() : heart(),
                !snapshot.hasData ? Container() : space(),
                buttonSimpan(),
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
            builder: (context, snapshot) {
              return Stack(
                children: <Widget>[
                  LiquidCustomProgressIndicator(
                    direction: Axis.vertical,
                    backgroundColor: Colors.transparent,
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
                    value: snapshot.data / this.widget.max,
                    direction: Axis.vertical,
                    backgroundColor: Colors.transparent,
                    valueColor: AlwaysStoppedAnimation(Color(0xFFF8798A)),
                    shapePath: _buildHeartPath(),
                    center: Stack(
                      children: <Widget>[
                        Center(child: Text(snapshot.data.toStringAsFixed(0))),
                        Center(
                          child: Image.asset(
                            'assets/ic_heart.png',
                            color: Colors.white,
                            width: 99,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              );
            },
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
}
