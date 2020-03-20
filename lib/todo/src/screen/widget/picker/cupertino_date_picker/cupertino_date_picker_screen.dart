import 'dart:math';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';
import 'package:todolist/todo/src/bloc/widget/picker/cupertino_date_picker/cupertino_date_picker_bloc.dart';
import 'package:todolist/todo/src/bloc/widget/picker/cupertino_date_picker/cupertino_date_picker_provider.dart';
import 'package:todolist/todo/src/locale/app_localizations.dart';
import 'package:todolist/todo/src/locale/langs.dart';
import 'package:todolist/todo/src/screen/widget/animation/confetti/confetti.dart';

class CupertinoDatePickerScreen extends StatefulWidget {
  static const routeName = '/cupertino_date_picker';

  @override
  _CupertinoDatePickerScreenState createState() =>
      _CupertinoDatePickerScreenState();
}

class _CupertinoDatePickerScreenState extends State<CupertinoDatePickerScreen> {
  Locale locale = Locale(Langs.id, Langs.ID);

  @override
  Widget build(BuildContext context) {
    CupertinoDatePickerBloc bloc = CupertinoDatePickerProvider.of(context);

    return StreamBuilder(
      stream: bloc.language,
      builder: (context, snapshot) {
        return MaterialApp(
          home: MyHome(),
          supportedLocales: [
            Locale(Langs.en, Langs.EN),
            Locale(Langs.it, Langs.IT),
            Locale(Langs.id, Langs.ID),
          ],
          locale: snapshot.data == null ? this.locale : snapshot.data,
          localizationsDelegates: [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          localeResolutionCallback: (locale, supportedLocales) {
            for (var supportedLocale in supportedLocales) {
              if (supportedLocale.languageCode == locale.languageCode &&
                  supportedLocale.countryCode == locale.countryCode) {
                return supportedLocale;
              }
            }
            return supportedLocales.first;
          },
        );
      },
    );
  }
}

class MyHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    CupertinoDatePickerBloc bloc = CupertinoDatePickerProvider.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(CupertinoDatePickerScreen.routeName),
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
//                          return Container(
//                            child: Text(AppLocalizations.of(context)?.translate(
//                                    'cupertino_date_picker_bs_title') ??
//                                'null'),
//                          );
                          return CupertinoDatePicker(
                            initialDateTime: DateTime.now(),
                            onDateTimeChanged: (date) {
                              bloc.addBottomSheetCupertinoDatePickerValue(
                                  DateFormat(
                                          'EEE, d MMMM yyyy')
                                      .format(date));
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
          top: 250,
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
          top: 250,
          left: 50,
          child: Align(
            alignment: Alignment.centerLeft,
            child: ConfettiWidget(
              confettiController: _controllerMyRight,
//              blastDirection: -0.5,
              blastDirection: 0,
              emissionFrequency: 0.10,
              numberOfParticles: 2,
              shouldLoop: false,
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

//https://medium.com/@puneetsethi25/flutter-internationalization-switching-locales-manually-f182ec9b8ff0

// app_localization.dart

// MaterialApp
// localizationsDelegates: [
//    GlobalMaterialLocalizations.delegate,
//    GlobalWidgetsLocalizations.delegate,
//    GlobalCupertinoLocalizations.delegate,
//    AppLocalizations.delegate,
// ],
// supportedLocales: [
//    Locale('id', 'ID'),
//    Locale('en', 'US'),
// ],

// intl_translation: ^0.17.9

// terminal-> flutter pub run intl_translation:extract_to_arb --output-dir=lib/l10n/ lib/locale/app_localization.dart

// munculin message
// terminal-> flutter pub run intl_translation:generate_from_arb --output-dir=lib/l10n/ --no-use-deferred-loading lib/l10n/intl_messages.arb lib/l10n/intl_de.arb lib/l10n/intl_en.arb lib/locale/app_localization.dart

// sepertinya folder language tidak butuh, karena pake arb file bukan json
