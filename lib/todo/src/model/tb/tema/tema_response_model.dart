import 'tema_model.dart';

class TemaResponseModel {
  List<TemaModel> data;

  TemaResponseModel({this.data});

  TemaResponseModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = new List<TemaModel>();
      json['data'].forEach((v) {
        data.add(new TemaModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
