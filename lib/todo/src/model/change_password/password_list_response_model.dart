import 'password_type_model.dart';

class PasswordListResponseModel {
  String status;
  String message;
  List<PasswordTypeModel> data;

  PasswordListResponseModel({this.status, this.message, this.data});

  PasswordListResponseModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = new List<PasswordTypeModel>();
      json['data'].forEach((v) {
        data.add(new PasswordTypeModel.fromJson(v));
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


