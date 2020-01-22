import 'package:todolist/todo/src/model/todolist/todolist_model.dart';

class TodolistResponseModel {
  String status;
  String message;
  List<TodolistModel> data;

  TodolistResponseModel({this.status, this.message, this.data});

  TodolistResponseModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = new List<TodolistModel>();
      json['data'].forEach((v) {
        data.add(new TodolistModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data.map((v) => v.toJson()).toList();
    }
    return data;
  }
}