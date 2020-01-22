import '../model/todolist/todolist_response_model.dart';
import '../resource/api_provider.dart';

class Repository{
  ApiProvider apiProvider = ApiProvider();
  Future<TodolistResponseModel> getTodolist() async{
    return await apiProvider.getTodolist();
  }
}