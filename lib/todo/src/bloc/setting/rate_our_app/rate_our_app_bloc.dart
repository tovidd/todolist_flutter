import 'package:rxdart/rxdart.dart';

import '../../../model/push_notifications/push_notifications_response_model.dart';
import '../../../resource/repository.dart';

class RateOurAppBloc{
  Repository _repository= Repository();

  final _rateOurApp = BehaviorSubject<int>();
  Stream<int> get rateOurApp => _rateOurApp.stream;

  Function(int) get addRateOurApp => _rateOurApp.sink.add;

  getRateOurApp() async {
    addRateOurApp(5);
  }

  dispose() {
    _rateOurApp.close();
  }
}
