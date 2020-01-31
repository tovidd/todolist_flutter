import 'push_notifications_type_model.dart';

class PushNotificationsResponseModel {
  String status;
  String message;
  List<PushNotificationTypeModel> data;

  PushNotificationsResponseModel({this.status, this.message, this.data});

  PushNotificationsResponseModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = new List<PushNotificationTypeModel>();
      json['data'].forEach((v) {
        data.add(new PushNotificationTypeModel.fromJson(v));
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




