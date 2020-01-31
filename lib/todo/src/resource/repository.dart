import '../model/todolist/todolist_response_model.dart';
import '../resource/api_provider.dart';
import '../model/profile_information/profile_information_response_model.dart';
import '../model/change_password/password_list_response_model.dart';
import '../model/push_notifications/push_notifications_response_model.dart';

class Repository{
  ApiProvider apiProvider = ApiProvider();
  
  Future<TodolistResponseModel> getTodolist() async{
    return await apiProvider.getTodolist();
  }

  Future<ProfileInformationResponseModel> getSettingProfileInformation() async{
    return await apiProvider.getSettingProfileInformation();
  }

  Future<PasswordListResponseModel> getPasswordList() async{
    return await apiProvider.getPasswordList();
  }

  Future<PushNotificationsResponseModel> getPushNotifications() async{
    return await apiProvider.getPushNotifications();
  }

}