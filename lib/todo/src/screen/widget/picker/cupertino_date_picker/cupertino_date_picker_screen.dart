import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';
import 'package:todolist/todo/src/bloc/widget/picker/cupertino_date_picker/cupertino_date_picker_bloc.dart';
import 'package:todolist/todo/src/bloc/widget/picker/cupertino_date_picker/cupertino_date_picker_provider.dart';

class CupertinoDatePickerScreen extends StatefulWidget {
  static const routeName = '/cupertino_date_picker';

  @override
  _CupertinoDatePickerScreenState createState() =>
      _CupertinoDatePickerScreenState();
}

class _CupertinoDatePickerScreenState extends State<CupertinoDatePickerScreen> {
  @override
  Widget build(BuildContext context) {
    CupertinoDatePickerBloc bloc = CupertinoDatePickerProvider.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(CupertinoDatePickerScreen.routeName),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            RaisedButton(
              child: Text('Popup'),
              onPressed: () {
                popUp(context);
              },
            ),
            RaisedButton(
              child: Text('Bottom sheet'),
              onPressed: () {
                showModalBottomSheet(
                  backgroundColor: Colors.transparent,
                  context: context,
                  isScrollControlled: true,
                  builder: (_) =>
                      _bottomSheet(context, bloc, 'Hari Perkiraan Lahir'),
                );
              },
            ),
            StreamBuilder(
                stream: bloc.bottomSheetCupertinoDatePickerValue,
                initialData:
                    DateFormat('EEE, d MMM yyyy').format(DateTime.now()),
                builder: (context, snapshot) {
                  return Text(!snapshot.hasData ? 'null' : snapshot.data);
                }),
          ],
        ),
      ),
    );
  }

  void popUp(BuildContext context) {
    CustomDialog customDialog = CustomDialog();

    showDialog(context: context, builder: (context) => customDialog);
  }

  Widget _bottomSheet(
      BuildContext context, CupertinoDatePickerBloc bloc, String title) {
    Widget ruler(double width) {
      return Center(
        child: Container(
          width: width,
          height: 5,
          decoration: BoxDecoration(
            color: Colors.grey[200],
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      );
    }

    return Wrap(
      alignment: WrapAlignment.center,
      children: <Widget>[
        Container(
          padding: EdgeInsets.all(16),
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20.0),
              topRight: Radius.circular(20.0),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              ruler(60),
              SizedBox(height: 3),
              ruler(40),
              SizedBox(height: 5),
              Text(
                title,
                style: TextStyle(
                    fontSize: 22,
                    color: Colors.black,
                    fontWeight: FontWeight.w400),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 5),
              Column(
                children: <Widget>[
                  Container(
                    height: 200,
                    color: Colors.grey,
                    child: StreamBuilder(
                        stream: bloc.bottomSheetCupertinoDatePickerValue,
                        builder: (context, snapshot) {
                          return CupertinoDatePicker(
                            initialDateTime: DateTime.now(),
                            onDateTimeChanged: (date) {
                              bloc.addBottomSheetCupertinoDatePickerValue(
                                  DateFormat('EEE, d MMM yyyy').format(date));
                              print(date);
                            },
                            mode: CupertinoDatePickerMode.date,
                          );
                        }),
                  ),
                ],
              ),
              SizedBox(height: 10),
              FlatButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  print('on tap: selanjutnya');
                },
                child:
                    Text('SELANJUTNYA', style: TextStyle(color: Colors.white)),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50),
                ),
                color: Color(0xFF9DB7ED),
              ),
            ],
          ),
        )
      ],
    );
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
