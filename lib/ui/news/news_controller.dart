import 'dart:async';
import 'dart:io';

import 'package:desafio_gpboticario/shared/models/banner_model.dart';
import 'package:desafio_gpboticario/shared/models/news_model.dart';
import 'package:desafio_gpboticario/shared/repositories/news_repository.dart';
import 'package:desafio_gpboticario/shared/services/rest_exception.dart';
import 'package:desafio_gpboticario/shared/utils/snack_bars.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class NewsController extends GetxController {
  final SnackBars _snack = SnackBars();
  final NewsRepository _repository = NewsRepository();
  RefreshController refreshController =
      RefreshController(initialRefresh: false);
  var bannerList = List<BannerModel>.empty().obs;
  var isLoading = true.obs;

  @override
  void onInit() async {
    await getBanners();
    super.onInit();
  }

  Future<List<NewsModel>> getNews() async {
    try {
      var response = await _repository.fetchNews();
      return response;
    } on RestException catch (e) {
      _snack.errorSnackbar(msg: e.message);
      print(e);
    }
  }

  Future<List<BannerModel>> getBanners() async {
    try {
      var response = await _repository.fetchBanners();
      bannerList = response.obs;
      isLoading.toggle();
      return bannerList;
    } on RestException catch (e) {
      _snack.errorSnackbar(msg: e.message);
      print(e);
    }
  }

  bool checkIsFetching() {
    if (isLoading.isFalse) {
      return false;
    }
    return true;
  }

  bool checkPlatform() {
    if (Platform.isAndroid) {
      return true;
    }
    return false;
  }

  void onRefresh() async {
    await Future.delayed(Duration(milliseconds: 1000));
    await getNews();
    refreshController.refreshCompleted();
  }
}
