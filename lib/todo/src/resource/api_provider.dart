import 'dart:convert';
import 'package:http/http.dart' show Client;

import '../model/todolist/todolist_response_model.dart';
import '../model/profile_information/profile_information_response_model.dart';
import '../model/change_password/password_list_response_model.dart';
import '../model/push_notifications/push_notifications_response_model.dart';

class ApiProvider {
  Client client = Client();
  final _base_url = 'http://www.mocky.io/v2/';
  final _suffix_todolist= '5e27f4183200001206d83da8?mocky-delay=2000ms';
  final _suffix_setting_profile_information= '5e212fa32f0000670077d4ae?mocky-delay=2000ms'; //success 
  // final _suffix_setting_profile_information= '5e28130b3200007404d83ea1?mocky-delay=2000ms'; //error
  final _suffix_product_terlaris= '5e2c4de53100007500267ebc?mocky-delay=2000ms';
  final _suffix_password= '5e30f8b73200005200888221?mocky-delay=2000ms';
  final _suffix_push_notifications= '5e3253ba3200005f0094cdab?mocky-delay=2000ms';

  var response;
  var parsedJson;

  Future<TodolistResponseModel> getTodolist() async {
    response = await client.get(_base_url+_suffix_todolist);
    parsedJson = json.decode(response.body);
    return TodolistResponseModel.fromJson(parsedJson);
  }

  Future<ProfileInformationResponseModel> getSettingProfileInformation() async {
    response = await client.get(_base_url+_suffix_setting_profile_information);
    parsedJson = json.decode(response.body);
    return ProfileInformationResponseModel.fromJson(parsedJson);
  }

  Future<PasswordListResponseModel> getPasswordList() async {
    response = await client.get(_base_url+_suffix_password);
    parsedJson = json.decode(response.body);
    return PasswordListResponseModel.fromJson(parsedJson);
  }

  Future<PushNotificationsResponseModel> getPushNotifications() async {
    response = await client.get(_base_url+_suffix_push_notifications);
    parsedJson = json.decode(response.body);
    return PushNotificationsResponseModel.fromJson(parsedJson);
  }
  


}