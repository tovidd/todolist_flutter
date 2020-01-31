class PushNotificationsModel {
  int id;
  int sales;
  int year;

  PushNotificationsModel({this.id, this.sales, this.year});

  PushNotificationsModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    sales = json['sales'];
    year = json['year'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['sales'] = this.sales;
    data['year'] = this.year;
    return data;
  }
}