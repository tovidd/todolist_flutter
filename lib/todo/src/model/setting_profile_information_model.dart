
class SettingProfileInformation {
  String status;
  String message;
  User user;

  SettingProfileInformation({this.status, this.message, this.user});

  SettingProfileInformation.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    user = json['data'] != null ? new User.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.user != null) {
      data['data'] = this.user.toJson();
    }
    return data;
  }
}

class User {
  String fullName;
  int age;
  String email;
  String gender;
  int photosCount;
  int followersCount;
  int followingCount;
  String avatar;
  String profileCover;

  User(
      {this.fullName,
      this.age,
      this.email,
      this.gender,
      this.photosCount,
      this.followersCount,
      this.followingCount,
      this.avatar,
      this.profileCover});

  User.fromJson(Map<String, dynamic> json) {
    fullName = json['full_name'];
    age = json['age'];
    email = json['email'];
    gender = json['gender'];
    photosCount = json['photos_count'];
    followersCount = json['followers_count'];
    followingCount = json['following_count'];
    avatar = json['avatar'];
    profileCover = json['profile_cover'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> user = new Map<String, dynamic>();
    user['full_name'] = this.fullName;
    user['age'] = this.age;
    user['email'] = this.email;
    user['gender'] = this.gender;
    user['photos_count'] = this.photosCount;
    user['followers_count'] = this.followersCount;
    user['following_count'] = this.followingCount;
    user['avatar'] = this.avatar;
    user['profile_cover'] = this.profileCover;
    return user;
  }
}
