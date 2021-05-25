import 'package:desafio_gpboticario/ui/dash/dash_controller.dart';
import 'package:desafio_gpboticario/ui/feed/feed_controller.dart';
import 'package:desafio_gpboticario/ui/login/login_controller.dart';
import 'package:desafio_gpboticario/ui/news/news_controller.dart';
import 'package:desafio_gpboticario/ui/profile/profile_controller.dart';
import 'package:desafio_gpboticario/ui/register/register_controller.dart';
import 'package:get/get.dart';

class DashBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DashController>(() => DashController());
    Get.lazyPut<FeedController>(() => FeedController());
    Get.lazyPut<NewsController>(() => NewsController());
    Get.lazyPut<ProfileController>(() => ProfileController());
  }
}
