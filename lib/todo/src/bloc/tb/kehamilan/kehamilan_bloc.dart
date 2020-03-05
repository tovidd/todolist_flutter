import 'package:rxdart/rxdart.dart';

import '../../../resource/repository.dart';

class KehamilanBloc {
  Repository _repository = Repository();

  final _dateValue = BehaviorSubject<String>();
  final _sliderValue = BehaviorSubject<double>();

  Stream<String> get dateValue => _dateValue.stream;

  Stream<double> get sliderValue => _sliderValue.stream;

  Function(String) get addDateValue => _dateValue.sink.add;

  Function(double) get addSliderValue => _sliderValue.sink.add;

  reset() {
    addSliderValue(20.0);
  }

  dispose() {
    _dateValue.close();
    _sliderValue.close();
  }
}
