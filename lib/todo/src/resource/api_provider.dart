import 'dart:convert';
import 'package:http/http.dart' show Client;

import '../model/todolist/todolist_response_model.dart';
import '../model/profile_information/profile_information_response_model.dart';
import '../model/change_password/password_list_response_model.dart';
import '../model/push_notifications/push_notifications_response_model.dart';
import '../model/tb/tema/tema_response_model.dart';

class ApiProvider {
  Client client = Client();
  final _base_url = 'http://www.mocky.io/v2/';
  final _suffix_todolist = '5e27f4183200001206d83da8?mocky-delay=5000ms';
  final _suffix_setting_profile_information =
      '5e212fa32f0000670077d4ae?mocky-delay=5000ms'; //success
  // final _suffix_setting_profile_information= '5e28130b3200007404d83ea1?mocky-delay=2000ms'; //error
  final _suffix_password = '5e30f8b73200005200888221?mocky-delay=5000ms';
  final _suffix_push_notifications =
      '5e3253ba3200005f0094cdab?mocky-delay=5000ms';
  final _suffix_tema = '5e466dee330000554902617b';

  var response;
  var parsedJson;

  Future<TodolistResponseModel> getTodolist() async {
    response = await client.get(_base_url + _suffix_todolist);
    parsedJson = json.decode(response.body);
    return TodolistResponseModel.fromJson(parsedJson);
  }

  Future<ProfileInformationResponseModel> getSettingProfileInformation() async {
    response =
        await client.get(_base_url + _suffix_setting_profile_information);
    parsedJson = json.decode(response.body);
    return ProfileInformationResponseModel.fromJson(parsedJson);
  }

  Future<PasswordListResponseModel> getPasswordList() async {
    response = await client.get(_base_url + _suffix_password);
    parsedJson = json.decode(response.body);
    return PasswordListResponseModel.fromJson(parsedJson);
  }

  Future<PushNotificationsResponseModel> getPushNotifications() async {
    response = await client.get(_base_url + _suffix_push_notifications);
    parsedJson = json.decode(response.body);
    return PushNotificationsResponseModel.fromJson(parsedJson);
  }

  Future<TemaResponseModel> getTema() async {
    response = await client.get(_base_url + _suffix_tema);
    parsedJson = json.decode(response.body);
    return TemaResponseModel.fromJson(parsedJson);
  }
}
