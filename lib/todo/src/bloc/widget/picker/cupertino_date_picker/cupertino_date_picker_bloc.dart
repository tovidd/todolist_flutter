import 'package:intl/intl.dart';
import 'package:rxdart/rxdart.dart';
import 'package:todolist/todo/src/resource/repository.dart';


class CupertinoDatePickerBloc {
  Repository _repository = Repository();

  final _bottomSheetCupertinoDatePickerValue = BehaviorSubject<String>();

  Stream<String> get bottomSheetCupertinoDatePickerValue => _bottomSheetCupertinoDatePickerValue.stream;

  Function(String) get addBottomSheetCupertinoDatePickerValue => _bottomSheetCupertinoDatePickerValue.sink.add;

//  setBottomSheetCupertinoDatePickerValue(){
//    addBottomSheetCupertinoDatePickerValue(DateFormat('EEE, d MMM yyyy').format(DateTime.now()));
//  }


  dispose() {
    _bottomSheetCupertinoDatePickerValue.close();
  }
}
