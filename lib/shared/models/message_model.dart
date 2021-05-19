class MessageModel {
  String content;
  String createdAt;

  MessageModel({this.content, this.createdAt});

  MessageModel.fromJson(Map<String, dynamic> json) {
    content = json['content'];
    createdAt = json['created_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['content'] = this.content;
    data['created_at'] = this.createdAt;
    return data;
  }
}