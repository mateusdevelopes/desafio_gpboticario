class BannerModel {
  String id;
  String createdAt;
  String title;
  String image;

  BannerModel({this.id, this.createdAt, this.title, this.image});

  BannerModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    createdAt = json['createdAt'];
    title = json['title'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['createdAt'] = this.createdAt;
    data['title'] = this.title;
    data['image'] = this.image;
    return data;
  }
}