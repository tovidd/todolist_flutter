import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class CupertinoDatePickerScreen extends StatefulWidget {
  static const routeName = '/cupertino_date_picker';

  @override
  _CupertinoDatePickerScreenState createState() =>
      _CupertinoDatePickerScreenState();
}

class _CupertinoDatePickerScreenState extends State<CupertinoDatePickerScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(CupertinoDatePickerScreen.routeName),
      ),
      body: Center(
        child: RaisedButton(
          child: Text('Popup'),
          onPressed: () {
            popUp(context);
          },
        ),
      ),
    );
  }

  void popUp(BuildContext context) {
    CustomDialog customDialog = CustomDialog();

    showDialog(context: context, builder: (context) => customDialog);
  }
}

class CustomDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(Consts.padding),
      ),
      elevation: 0.0,
      backgroundColor: Colors.transparent,
      child: dialogContent(context),
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
      padding: EdgeInsets.only(
        left: Consts.padding,
        right: Consts.padding,
      ),
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
          Container(
            height: 120,
            color: Colors.grey,
            child: CupertinoDatePicker(
              initialDateTime: DateTime.now(),
              onDateTimeChanged: (date) {
                print(date);
              },
              mode: CupertinoDatePickerMode.date,
            ),
          ),
          Container(
            alignment: Alignment.bottomRight,
            child: FlatButton(
              onPressed: () {
                Navigator.of(context).pop(); // To close the dialog
              },
              child: Text('Ok'),
            ),
          ),
        ],
      ),
    );
  }
}

class Consts {
  Consts._();

  static const double padding = 10.0;
}
