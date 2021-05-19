import 'package:desafio_gpboticario/shared/models/news_model.dart';
import 'package:desafio_gpboticario/shared/models/news_response_model.dart';

abstract class INewsRepository {
  Future<List<NewsModel>> fetchNews();
}
