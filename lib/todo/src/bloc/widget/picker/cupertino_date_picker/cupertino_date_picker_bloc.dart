import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';
import 'package:rxdart/rxdart.dart';
import 'package:todolist/todo/src/resource/constant/repository.dart';


class CupertinoDatePickerBloc {
  Repository _repository = Repository();

  final _bottomSheetCupertinoDatePickerValue = BehaviorSubject<String>();
  final _language = BehaviorSubject<Locale>();

  Stream<String> get bottomSheetCupertinoDatePickerValue => _bottomSheetCupertinoDatePickerValue.stream;
  Stream<Locale> get language => _language.stream;

  Function(String) get addBottomSheetCupertinoDatePickerValue => _bottomSheetCupertinoDatePickerValue.sink.add;
  Function(Locale) get addLanguage => _language.sink.add;

  dispose() {
    _bottomSheetCupertinoDatePickerValue.close();
    _language.close();
  }
}
