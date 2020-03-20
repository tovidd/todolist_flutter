import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';
import 'package:todolist/todo/src/bloc/widget/picker/cupertino_date_picker/cupertino_date_picker_bloc.dart';
import 'package:todolist/todo/src/bloc/widget/picker/cupertino_date_picker/cupertino_date_picker_provider.dart';
import 'package:todolist/todo/src/screen/widget/animation/confetti/confetti.dart';

class CompleteRegistrationScreen extends StatefulWidget {
  static const routeName = '/complete_registration';

  @override
  _CompleteRegistrationScreen createState() => _CompleteRegistrationScreen();
}

class _CompleteRegistrationScreen extends State<CompleteRegistrationScreen> {
  @override
  Widget build(BuildContext context) {
    CupertinoDatePickerBloc bloc = CupertinoDatePickerProvider.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(CompleteRegistrationScreen.routeName),
      ),
      body: Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RaisedButton(
              child: Text('Popup'),
              onPressed: () {
                popUp(context);
              },
            ),
          ],
        ),
      ),
    );
  }

  void popUp(BuildContext context) {
    CustomDialog customDialog = CustomDialog();
    showDialog(context: context, builder: (context) => customDialog);
  }
}

class CustomDialog extends StatefulWidget {
  @override
  _CustomDialogState createState() => _CustomDialogState();
}

class _CustomDialogState extends State<CustomDialog> {
  ConfettiController _controllerMyLeft, _controllerMyRight;

  @override
  void initState() {
    _controllerMyLeft = ConfettiController(duration: Duration(seconds: 3));
    _controllerMyRight = ConfettiController(duration: Duration(seconds: 3));
    super.initState();
  }

  @override
  void dispose() {
    _controllerMyLeft.dispose();
    _controllerMyRight.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _controllerMyLeft.play();
    _controllerMyRight.play();

    return Stack(
      children: <Widget>[
        Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(Consts.padding),
          ),
          elevation: 0.0,
          backgroundColor: Colors.transparent,
          child: dialogContent(context),
        ),
        Positioned(
          top: MediaQuery.of(context).size.height * 0.4,
          right: 0,
          child: Align(
            alignment: Alignment.centerRight,
            child: ConfettiWidget(
              confettiController: _controllerMyLeft,
//              blastDirection: pi + 0.5,
              blastDirection: pi,
              emissionFrequency: 0.10,
              numberOfParticles: 2,
              shouldLoop: false,
              minimumSize: Size(20, 5),
              maximumSize: Size(20, 5),
              colors: [
                Colors.green,
                Colors.blue,
                Colors.pink,
                Colors.deepOrange
              ],
            ),
          ),
        ),
        Positioned(
          top: MediaQuery.of(context).size.height * 0.4,
          left: 0,
          child: Align(
            alignment: Alignment.centerLeft,
            child: ConfettiWidget(
              confettiController: _controllerMyRight,
//              blastDirection: -0.5,
              blastDirection: 0,
              emissionFrequency: 0.10,
              numberOfParticles: 2,
              shouldLoop: false,
              minimumSize: Size(20, 5),
              maximumSize: Size(20, 5),
              colors: [
                Colors.green,
                Colors.blue,
                Colors.pink,
                Colors.deepOrange
              ],
            ),
          ),
        ),
      ],
    );
  }

  dialogContent(BuildContext context) {
    return Stack(
      children: <Widget>[
        container(context),
      ],
    );
  }

  Widget container(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(Consts.padding),
      decoration: new BoxDecoration(
        color: Colors.white,
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(Consts.padding),
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 10.0,
            offset: const Offset(0.0, 10.0),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Text(
            'Mums Berhasil Registrasi di Teman Bumil',
            style: TextStyle(fontWeight: FontWeight.w500, fontSize: 18),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 30),
          Image.asset(
            'assets/image/ic_couple.png',
            height: 100,
          ),
          SizedBox(height: 30),
          Text(
            'Teman Bumil akan selalu menemani Mums dalam menjalani Program Hamil, semangat ya Mums!',
            style: TextStyle(
              color: Colors.blueAccent[100],
              fontSize: 12,
              fontWeight: FontWeight.w300,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}

class Consts {
  Consts._();

  static const double padding = 16.0;
}
