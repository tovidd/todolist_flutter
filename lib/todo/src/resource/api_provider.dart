import 'dart:convert';
import 'package:http/http.dart' show Client;
import '../model/change_password/change_password_model.dart';

import '../model/todolist/todolist_response_model.dart';
import '../model/setting_profile_information/setting_profile_information_response_model.dart';

class ApiProvider {
  Client client = Client();
  final _base_url = 'http://www.mocky.io/v2/';
  final _suffix_todolist= '5e27f4183200001206d83da8?mocky-delay=2000ms';
  final _suffix_setting_profile_information= '5e212fa32f0000670077d4ae?mocky-delay=2000ms'; //success 
  // final _suffix_setting_profile_information= '5e28130b3200007404d83ea1?mocky-delay=2000ms'; //error
  final _suffix_product_terlaris= '5e2c4de53100007500267ebc?mocky-delay=2000ms';

  var response;
  var parsedJson;

  Future<TodolistResponseModel> getTodolist() async {
    response = await client.get(_base_url+_suffix_todolist);
    parsedJson = json.decode(response.body);
    return TodolistResponseModel.fromJson(parsedJson);
  }

  Future<SettingProfileInformationResponseModel> getSettingProfileInformation() async {
    response = await client.get(_base_url+_suffix_setting_profile_information);
    parsedJson = json.decode(response.body);
    return SettingProfileInformationResponseModel.fromJson(parsedJson);
  }

  Future<ProductResponseModel> getProductTerlaris() async {
    response = await client.get(_base_url+_suffix_product_terlaris);
    parsedJson = json.decode(response.body);
    return ProductResponseModel.fromJson(parsedJson);
  }

}