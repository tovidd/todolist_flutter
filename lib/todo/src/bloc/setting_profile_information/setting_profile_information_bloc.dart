import 'package:rxdart/rxdart.dart';

import '../../model/setting_profile_information/setting_profile_information_response_model.dart';
import '../../resource/repository.dart';

class SettingProfileInformationBloc {
  Repository _repository= Repository();

  final _feeds = BehaviorSubject<SettingProfileInformationResponseModel>();
  Stream<SettingProfileInformationResponseModel> get feeds => _feeds.stream;

  Function(SettingProfileInformationResponseModel) get addFeeds => _feeds.sink.add;

  getFeed() async {
    addFeeds(null);
    final response = await _repository.getSettingProfileInformation();
    print(response.toJson());
    addFeeds(response);
  }

  dispose() {
    _feeds.close();
  }
}
