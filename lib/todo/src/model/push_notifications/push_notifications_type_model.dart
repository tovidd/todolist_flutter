import 'push_notifications_model.dart';

class PushNotificationTypeModel {
  int id;
  String title;
  List<PushNotificationsModel> data;

  PushNotificationTypeModel({this.id, this.title, this.data});

  PushNotificationTypeModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    if (json['data'] != null) {
      data = new List<PushNotificationsModel>();
      json['data'].forEach((v) {
        data.add(new PushNotificationsModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    if (this.data != null) {
      data['data'] = this.data.map((v) => v.toJson()).toList();
    }
    return data;
  }
}