import 'password_model.dart';
export 'password_model.dart';

class PasswordTypeModel {
  int id;
  String type;
  List<PasswordModel> data;

  PasswordTypeModel({this.id, this.type, this.data});

  PasswordTypeModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    type = json['type'];
    if (json['data'] != null) {
      data = new List<PasswordModel>();
      json['data'].forEach((v) {
        data.add(new PasswordModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['type'] = this.type;
    if (this.data != null) {
      data['data'] = this.data.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

