import 'package:rxdart/rxdart.dart';

import '../../../resource/repository.dart';

class CustomNumberPickerBloc {
  Repository _repository = Repository();

  final _numberPickerValue = BehaviorSubject<int>();

  Stream<int> get numberPickerValue => _numberPickerValue.stream;

  Function(int) get addNumberPickerValue => _numberPickerValue.sink.add;

  getNumberPickerValue() async {
    addNumberPickerValue(5);
  }

  dispose() {
    _numberPickerValue.close();
  }
}
