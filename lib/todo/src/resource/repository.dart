import '../model/change_password/change_password_model.dart';

import '../model/todolist/todolist_response_model.dart';
import '../resource/api_provider.dart';
import '../model/setting_profile_information/setting_profile_information_response_model.dart';

class Repository{
  ApiProvider apiProvider = ApiProvider();
  
  Future<TodolistResponseModel> getTodolist() async{
    return await apiProvider.getTodolist();
  }

  Future<SettingProfileInformationResponseModel> getSettingProfileInformation() async{
    return await apiProvider.getSettingProfileInformation();
  }

  Future<ProductResponseModel> getProductTerlaris() async{
    return await apiProvider.getProductTerlaris();
  }
}