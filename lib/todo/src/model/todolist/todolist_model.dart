

class TodolistModel {
  int id;
  String title;
  String description;
  String createdAt;
  String deadlineAt;
  String deletedAt;
  String doneAt;
  String undoneAt;

  TodolistModel(
      {this.id,
      this.title,
      this.description,
      this.createdAt,
      this.deadlineAt,
      this.deletedAt,
      this.doneAt,
      this.undoneAt});

  TodolistModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    description = json['description'];
    createdAt = json['created_at'];
    deadlineAt = json['deadline_at'];
    deletedAt = json['deleted_at'];
    doneAt = json['done_at'];
    undoneAt = json['undone_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['description'] = this.description;
    data['created_at'] = this.createdAt;
    data['deadline_at'] = this.deadlineAt;
    data['deleted_at'] = this.deletedAt;
    data['done_at'] = this.doneAt;
    data['undone_at'] = this.undoneAt;
    return data;
  }
}