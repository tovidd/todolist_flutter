import 'dart:convert';
import 'package:http/http.dart' show Client;

import '../model/todolist/todolist_response_model.dart';

class ApiProvider {
  Client client = Client();
  final _base_url = 'http://www.mocky.io/v2/';
  final _suffix= '5e27f4183200001206d83da8';

  Future<TodolistResponseModel> getTodolist() async {
    // final response = await client.get('${_root}5e27c1143200002a00d83cda?mocky-delay=5000ms');
    final response = await client.get(_base_url+_suffix);
    final parsedJson = json.decode(response.body);
    print('WOYY1 : $parsedJson');
    return TodolistResponseModel.fromJson(parsedJson);
  }
}