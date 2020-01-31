import 'password_model.dart';
export 'password_model.dart';

class PasswordTypeModel {
  int id;
  String type;
  bool isExpand;
  List<PasswordModel> data;

  PasswordTypeModel({this.id, this.type, this.data, this.isExpand});

  PasswordTypeModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    type = json['type'];
    isExpand = json['isExpand'];
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
    data['isExpand'] = this.isExpand;
    if (this.data != null) {
      data['data'] = this.data.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

