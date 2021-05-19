class PostModel {
  String id;
  String createdAt;
  String name;
  String avatar;
  String description;
  int userId;

  PostModel(
      {this.id,
      this.createdAt,
      this.name,
      this.avatar,
      this.description,
      this.userId});

  PostModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    createdAt = json['createdAt'];
    name = json['name'];
    avatar = json['avatar'];
    description = json['description'];
    userId = json['userId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['createdAt'] = this.createdAt;
    data['name'] = this.name;
    data['avatar'] = this.avatar;
    data['description'] = this.description;
    data['userId'] = this.userId;
    return data;
  }
}