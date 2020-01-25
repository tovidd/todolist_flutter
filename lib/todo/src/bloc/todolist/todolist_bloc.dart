import 'package:rxdart/rxdart.dart';

import '../../model/todolist/todolist_response_model.dart';
import '../../resource/repository.dart';

class TodolistBloc {
  Repository _repository = Repository();

  final _feeds = BehaviorSubject<TodolistResponseModel>();
  Stream<TodolistResponseModel> get feeds => _feeds.stream;

  Function(TodolistResponseModel) get addFeeds => _feeds.sink.add;

  getFeed() async {
    addFeeds(null);
    final response = await _repository.getTodolist();
    addFeeds(response);
  }

  dispose() {
    _feeds.close();
  }
}
