class PasswordModel {
  int id;
  String title;
  String description;
  int used;
  int stock;
  String pic;
  bool choose;

  PasswordModel(
      {this.id, this.title, this.description, this.used, this.stock, this.pic, this.choose});

  PasswordModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    description = json['description'];
    used = json['used'];
    stock = json['stock'];
    pic = json['pic'];
    choose = json['choose'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['description'] = this.description;
    data['used'] = this.used;
    data['stock'] = this.stock;
    data['pic'] = this.pic;
    data['choose'] = this.choose;
    return data;
  }
}