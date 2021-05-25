import 'package:desafio_gpboticario/shared/models/message_model.dart';
import 'package:desafio_gpboticario/shared/models/user_model.dart';

class NewsModel {
  User user;
  MessageModel message;

  NewsModel({this.user, this.message});

  NewsModel.fromJson(Map<String, dynamic> json) {
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
    message =
        json['message'] != null ? new MessageModel.fromJson(json['message']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.user != null) {
      data['user'] = this.user.toJson();
    }
    if (this.message != null) {
      data['message'] = this.message.toJson();
    }
    return data;
  }
}