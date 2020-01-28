import 'package:rxdart/rxdart.dart';

import '../../../model/profile_information/profile_information_response_model.dart';
import '../../../resource/repository.dart';

class ProfileInformationBloc {
  Repository _repository= Repository();

  final _feeds = BehaviorSubject<ProfileInformationResponseModel>();
  Stream<ProfileInformationResponseModel> get feeds => _feeds.stream;

  Function(ProfileInformationResponseModel) get addFeeds => _feeds.sink.add;

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
