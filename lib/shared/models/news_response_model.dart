import 'package:desafio_gpboticario/shared/models/news_model.dart';

class NewsResponseModel {
  List<NewsModel> news;

  NewsResponseModel({this.news});

  NewsResponseModel.fromJson(Map<String, dynamic> json) {
    if (json['news'] != null) {
      news = new List<NewsModel>();
      json['news'].forEach((v) {
        news.add(new NewsModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.news != null) {
      data['news'] = this.news.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
