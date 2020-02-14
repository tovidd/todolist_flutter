class TemaModel {
  int id;
  String title;
  bool selected;

  TemaModel({this.id, this.title, this.selected});

  TemaModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    selected = json['selected'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['selected'] = this.selected;
    return data;
  }
}
