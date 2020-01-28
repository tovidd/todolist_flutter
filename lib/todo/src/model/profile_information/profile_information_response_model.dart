import 'profile_information_model.dart';

class ProfileInformationResponseModel {
  String status;
  String message;
  ProfileInformationModel data;

  ProfileInformationResponseModel({this.status, this.message, this.data});

  ProfileInformationResponseModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? new ProfileInformationModel.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data.toJson();
    }
    return data;
  }
}