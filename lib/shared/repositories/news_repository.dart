import 'package:desafio_gpboticario/shared/interfaces/i_news_repository.dart';
import 'package:desafio_gpboticario/shared/models/news_model.dart';
import 'package:desafio_gpboticario/shared/services/rest_client.dart';
import 'package:desafio_gpboticario/shared/services/rest_exception.dart';
import 'package:dio/dio.dart';

class NewsRepository extends INewsRepository {
  final Dio _dio = Dio(restClient.options);

  static const String NEWS_URL =
      "https://gb-mobile-app-teste.s3.amazonaws.com/data.json";

  @override
  Future<List<NewsModel>> fetchNews() async {
    try {
      final response = await _dio.get('$NEWS_URL');
      return response.data['news']
              .map<NewsModel>((e) => NewsModel.fromJson(e))
              .toList() ??
          [];
    } on DioError catch (e) {
      if (e.response?.statusCode == 500) {
        print('Houve um problema no servidor!');
        throw RestException(
            message: 'Houve um problema no servidor!',
            statusCode: e.response?.statusCode ?? 0);
      }
      throw RestException(
          message: e.error, statusCode: e.response?.statusCode ?? 0);
    }
  }
}
