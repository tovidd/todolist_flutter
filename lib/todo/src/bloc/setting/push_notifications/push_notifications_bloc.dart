import 'package:rxdart/rxdart.dart';

import '../../../model/push_notifications/push_notifications_response_model.dart';
import '../../../resource/repository.dart';

class PushNotificationsBloc{
  Repository _repository= Repository();

  final _pushNotifications = BehaviorSubject<PushNotificationsResponseModel>();
  Stream<PushNotificationsResponseModel> get pushNotifications => _pushNotifications.stream;

  Function(PushNotificationsResponseModel) get addPushNotifications => _pushNotifications.sink.add;

  getPushNotifications() async {
    addPushNotifications(null);
    final response = await _repository.getPushNotifications();
    print(response.toJson());
    addPushNotifications(response);
  }

  dispose() {
    _pushNotifications.close();
  }
}
