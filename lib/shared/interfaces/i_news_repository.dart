import 'package:desafio_gpboticario/shared/models/banner_model.dart';
import 'package:desafio_gpboticario/shared/models/news_model.dart';

abstract class INewsRepository {
  Future<List<NewsModel>> fetchNews();

  Future<List<BannerModel>> fetchBanners();
}
